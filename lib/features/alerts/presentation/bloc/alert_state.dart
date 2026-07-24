import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/alert.dart';

sealed class AlertState extends Equatable {
  const AlertState();

  @override
  List<Object?> get props => [];
}

class AlertInitial extends AlertState {
  const AlertInitial();
}

class AlertLoading extends AlertState {
  const AlertLoading();
}

class AlertLoaded extends AlertState {
  final List<Alert> alerts;

  const AlertLoaded(this.alerts);

  @override
  List<Object?> get props => [alerts];
}

class AlertError extends AlertState {
  final Failure failure;

  const AlertError(this.failure);

  @override
  List<Object?> get props => [failure];
}
