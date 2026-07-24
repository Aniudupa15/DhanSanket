import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/intraday_signal.dart';
import '../../domain/entities/long_term_signal.dart';

sealed class SignalsState extends Equatable {
  const SignalsState();

  @override
  List<Object?> get props => [];
}

class SignalsInitial extends SignalsState {
  const SignalsInitial();
}

class SignalsLoading extends SignalsState {
  const SignalsLoading();
}

class SignalsLoaded extends SignalsState {
  final IntradaySignal intraday;
  final LongTermSignal longTerm;

  const SignalsLoaded({required this.intraday, required this.longTerm});

  @override
  List<Object?> get props => [intraday, longTerm];
}

class SignalsError extends SignalsState {
  final Failure failure;

  const SignalsError(this.failure);

  @override
  List<Object?> get props => [failure];
}
