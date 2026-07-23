import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/dashboard_snapshot.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial();
}

class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

class DashboardLoaded extends DashboardState {
  final DashboardSnapshot snapshot;

  const DashboardLoaded(this.snapshot);

  @override
  List<Object?> get props => [snapshot];
}

class DashboardError extends DashboardState {
  final Failure failure;

  const DashboardError(this.failure);

  @override
  List<Object?> get props => [failure];
}
