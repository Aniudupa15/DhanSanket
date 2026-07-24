import 'package:equatable/equatable.dart';

sealed class IndicatorsEvent extends Equatable {
  const IndicatorsEvent();

  @override
  List<Object?> get props => [];
}

class IndicatorsRequested extends IndicatorsEvent {
  final String symbol;

  const IndicatorsRequested(this.symbol);

  @override
  List<Object?> get props => [symbol];
}
