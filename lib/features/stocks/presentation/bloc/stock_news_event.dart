import 'package:equatable/equatable.dart';

sealed class StockNewsEvent extends Equatable {
  const StockNewsEvent();

  @override
  List<Object?> get props => [];
}

class StockNewsRequested extends StockNewsEvent {
  final String symbol;

  const StockNewsRequested(this.symbol);

  @override
  List<Object?> get props => [symbol];
}
