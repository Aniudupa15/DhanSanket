import 'package:equatable/equatable.dart';

sealed class FundamentalsEvent extends Equatable {
  const FundamentalsEvent();

  @override
  List<Object?> get props => [];
}

class FundamentalsRequested extends FundamentalsEvent {
  final String symbol;

  const FundamentalsRequested(this.symbol);

  @override
  List<Object?> get props => [symbol];
}
