import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:decimal/decimal.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../bootstrap/env.dart';
import '../entities/market_mover.dart';
import '../storage/secure_token_storage.dart';

sealed class LiveEvent {
  const LiveEvent();
}

class QuoteLiveEvent extends LiveEvent {
  final String symbol;
  final Decimal lastPrice;
  final Decimal change;
  final Decimal changePercent;
  final int volume;
  final DateTime asOf;

  const QuoteLiveEvent({
    required this.symbol,
    required this.lastPrice,
    required this.change,
    required this.changePercent,
    required this.volume,
    required this.asOf,
  });
}

class QuoteUnavailableLiveEvent extends LiveEvent {
  final String symbol;
  final String? reason;

  const QuoteUnavailableLiveEvent({required this.symbol, required this.reason});
}

class MarketSnapshotLiveEvent extends LiveEvent {
  final List<MarketMover> gainers;
  final List<MarketMover> losers;
  final List<MarketMover> mostActive;

  const MarketSnapshotLiveEvent({required this.gainers, required this.losers, required this.mostActive});
}

/// Wraps the `/ws/live` WebSocket: reconnects automatically with an
/// exponential backoff (1s -> 2s -> 4s -> ... capped at 30s) and, on every
/// (re)connect, resends the full merged subscription set so reconnection is
/// transparent to callers - a Bloc never needs to know the socket dropped and
/// came back.
///
/// Multiple screens can be interested in overlapping symbols at once (e.g.
/// the same stock in both a Watchlist and the Stock Detail page); each
/// caller subscribes under its own key (its Bloc instance) so one screen's
/// unsubscribe never wipes another screen's interest - the service unions
/// every active subscriber's symbols before sending them upstream.
class LiveSocketService {
  static const String marketChannel = '__market__';

  final SecureTokenStorage _tokenStorage;

  final Map<Object, Set<String>> _subscriptions = {};
  final StreamController<LiveEvent> _eventController = StreamController<LiveEvent>.broadcast();
  final StreamController<bool> _connectionController = StreamController<bool>.broadcast();

  WebSocketChannel? _channel;
  StreamSubscription? _channelSubscription;
  Timer? _reconnectTimer;
  int _reconnectAttempt = 0;
  bool _connecting = false;
  bool _disposed = false;

  LiveSocketService({required SecureTokenStorage tokenStorage}) : _tokenStorage = tokenStorage;

  Stream<LiveEvent> get events => _eventController.stream;

  /// Emits `true` once the socket is open, `false` on every drop - the app
  /// shell uses this to show a small "reconnecting" indicator.
  Stream<bool> get connectionStatus => _connectionController.stream;

  void subscribe(Object subscriberKey, Set<String> symbols) {
    if (symbols.isEmpty) {
      _subscriptions.remove(subscriberKey);
    } else {
      _subscriptions[subscriberKey] = symbols.map(_normalize).toSet();
    }
    _sendSubscription();
    if (_channel == null && !_connecting) _connect();
  }

  void unsubscribe(Object subscriberKey) {
    _subscriptions.remove(subscriberKey);
    _sendSubscription();
  }

  String _normalize(String symbol) => symbol == marketChannel ? symbol : symbol.trim().toUpperCase();

  Future<void> _connect() async {
    if (_disposed || _connecting) return;
    final token = await _tokenStorage.getAccessToken();
    if (token == null) {
      // No session yet (e.g. app just started, pre-login) - keep retrying on
      // the same backoff schedule so a login completing later is picked up
      // without any subscriber needing to call subscribe() again.
      _scheduleReconnect();
      return;
    }

    _connecting = true;
    try {
      final wsBase = AppConfig.baseUrl.replaceFirst('http', 'ws');
      final uri = Uri.parse('$wsBase/ws/live').replace(queryParameters: {'token': token});
      final channel = WebSocketChannel.connect(uri);
      await channel.ready;
      _channel = channel;
      _reconnectAttempt = 0;
      _connectionController.add(true);
      _sendSubscription();
      _channelSubscription = channel.stream.listen(
        _handleMessage,
        onDone: _handleDisconnect,
        onError: (_) => _handleDisconnect(),
        cancelOnError: true,
      );
    } catch (_) {
      _handleDisconnect();
    } finally {
      _connecting = false;
    }
  }

  void _handleDisconnect() {
    _channel = null;
    _channelSubscription?.cancel();
    _channelSubscription = null;
    _connectionController.add(false);
    _scheduleReconnect();
  }

  void _scheduleReconnect() {
    if (_disposed) return;
    _reconnectTimer?.cancel();
    final seconds = math.min(30, math.pow(2, _reconnectAttempt).toInt());
    _reconnectAttempt++;
    _reconnectTimer = Timer(Duration(seconds: seconds), _connect);
  }

  void _sendSubscription() {
    final channel = _channel;
    if (channel == null) return;
    final symbols = <String>{};
    for (final s in _subscriptions.values) {
      symbols.addAll(s);
    }
    channel.sink.add(jsonEncode({'action': 'subscribe', 'symbols': symbols.toList()}));
  }

  void _handleMessage(dynamic raw) {
    final Map<String, dynamic> message;
    try {
      message = jsonDecode(raw as String) as Map<String, dynamic>;
    } catch (_) {
      return;
    }

    switch (message['type']) {
      case 'quote':
        final data = message['data'] as Map<String, dynamic>;
        _eventController.add(
          QuoteLiveEvent(
            symbol: message['symbol'] as String,
            lastPrice: Decimal.parse(data['last_price'].toString()),
            change: Decimal.parse(data['change'].toString()),
            changePercent: Decimal.parse(data['change_percent'].toString()),
            volume: (data['volume'] as num).toInt(),
            asOf: DateTime.parse(data['as_of'] as String),
          ),
        );
      case 'quote_unavailable':
        _eventController.add(
          QuoteUnavailableLiveEvent(symbol: message['symbol'] as String, reason: message['reason'] as String?),
        );
      case 'market_snapshot':
        final data = message['data'] as Map<String, dynamic>;
        _eventController.add(
          MarketSnapshotLiveEvent(
            gainers: _toMarketMovers(data['gainers']),
            losers: _toMarketMovers(data['losers']),
            mostActive: _toMarketMovers(data['most_active']),
          ),
        );
    }
  }

  List<MarketMover> _toMarketMovers(dynamic list) {
    return (list as List)
        .map((e) => e as Map<String, dynamic>)
        .map(
          (json) => MarketMover(
            symbol: json['symbol'] as String,
            name: json['name'] as String,
            lastPrice: Decimal.parse(json['last_price'].toString()),
            change: json['change'] == null ? null : Decimal.parse(json['change'].toString()),
            changePercent: json['change_percent'] == null ? null : Decimal.parse(json['change_percent'].toString()),
            volume: (json['volume'] as num).toInt(),
          ),
        )
        .toList();
  }

  void dispose() {
    _disposed = true;
    _reconnectTimer?.cancel();
    _channelSubscription?.cancel();
    _channel?.sink.close();
    _eventController.close();
    _connectionController.close();
  }
}
