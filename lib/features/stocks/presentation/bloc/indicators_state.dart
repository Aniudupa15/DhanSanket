import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/indicators.dart';

sealed class IndicatorsState extends Equatable {
  const IndicatorsState();

  @override
  List<Object?> get props => [];
}

class IndicatorsInitial extends IndicatorsState {
  const IndicatorsInitial();
}

class IndicatorsLoading extends IndicatorsState {
  const IndicatorsLoading();
}

class IndicatorsLoaded extends IndicatorsState {
  final Indicators indicators;

  const IndicatorsLoaded(this.indicators);

  @override
  List<Object?> get props => [indicators];
}

class IndicatorsError extends IndicatorsState {
  final Failure failure;

  const IndicatorsError(this.failure);

  @override
  List<Object?> get props => [failure];
}
