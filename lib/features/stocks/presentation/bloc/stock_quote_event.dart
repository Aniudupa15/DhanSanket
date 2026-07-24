import 'package:equatable/equatable.dart';

import '../../../../core/network/live_socket_service.dart';

sealed class StockQuoteEvent extends Equatable {
  const StockQuoteEvent();

  @override
  List<Object?> get props => [];
}

class StockQuoteRequested extends StockQuoteEvent {
  final String symbol;

  const StockQuoteRequested(this.symbol);

  @override
  List<Object?> get props => [symbol];
}

/// Internal - fed by the [LiveSocketService] subscription started in the
/// Bloc's constructor, not dispatched directly by the UI.
class StockQuoteLiveUpdateReceived extends StockQuoteEvent {
  final QuoteLiveEvent liveEvent;

  const StockQuoteLiveUpdateReceived(this.liveEvent);

  @override
  List<Object?> get props => [liveEvent];
}
