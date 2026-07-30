import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/momentum_pick.dart';

sealed class MomentumState extends Equatable {
  const MomentumState();

  @override
  List<Object?> get props => [];
}

class MomentumInitial extends MomentumState {
  const MomentumInitial();
}

class MomentumLoading extends MomentumState {
  const MomentumLoading();
}

class MomentumLoaded extends MomentumState {
  final List<MomentumPick> picks;

  const MomentumLoaded(this.picks);

  @override
  List<Object?> get props => [picks];
}

class MomentumError extends MomentumState {
  final Failure failure;

  const MomentumError(this.failure);

  @override
  List<Object?> get props => [failure];
}
