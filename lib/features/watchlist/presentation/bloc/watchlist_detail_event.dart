import 'package:equatable/equatable.dart';

import '../../../../core/network/live_socket_service.dart';

sealed class WatchlistDetailEvent extends Equatable {
  const WatchlistDetailEvent();

  @override
  List<Object?> get props => [];
}

class WatchlistDetailRequested extends WatchlistDetailEvent {
  final String id;

  const WatchlistDetailRequested(this.id);

  @override
  List<Object?> get props => [id];
}

class WatchlistItemAddRequested extends WatchlistDetailEvent {
  final String id;
  final String symbol;

  const WatchlistItemAddRequested(this.id, this.symbol);

  @override
  List<Object?> get props => [id, symbol];
}

class WatchlistItemRemoveRequested extends WatchlistDetailEvent {
  final String id;
  final String symbol;

  const WatchlistItemRemoveRequested(this.id, this.symbol);

  @override
  List<Object?> get props => [id, symbol];
}

/// Internal - fed by the [LiveSocketService] subscription started in the
/// Bloc's constructor, not dispatched directly by the UI.
class WatchlistDetailLiveUpdateReceived extends WatchlistDetailEvent {
  final QuoteLiveEvent liveEvent;

  const WatchlistDetailLiveUpdateReceived(this.liveEvent);

  @override
  List<Object?> get props => [liveEvent];
}
