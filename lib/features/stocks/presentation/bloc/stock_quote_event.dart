import 'package:equatable/equatable.dart';

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
