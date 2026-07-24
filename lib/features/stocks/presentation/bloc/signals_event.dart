import 'package:equatable/equatable.dart';

sealed class SignalsEvent extends Equatable {
  const SignalsEvent();

  @override
  List<Object?> get props => [];
}

class SignalsRequested extends SignalsEvent {
  final String symbol;

  const SignalsRequested(this.symbol);

  @override
  List<Object?> get props => [symbol];
}
