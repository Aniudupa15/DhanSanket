import 'package:equatable/equatable.dart';

sealed class PriceHistoryEvent extends Equatable {
  const PriceHistoryEvent();

  @override
  List<Object?> get props => [];
}

class PriceHistoryRequested extends PriceHistoryEvent {
  final String symbol;
  final String range;

  const PriceHistoryRequested(this.symbol, {this.range = '1Y'});

  @override
  List<Object?> get props => [symbol, range];
}
