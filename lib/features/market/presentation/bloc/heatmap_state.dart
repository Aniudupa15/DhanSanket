import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/heatmap.dart';

sealed class HeatmapState extends Equatable {
  const HeatmapState();

  @override
  List<Object?> get props => [];
}

class HeatmapInitial extends HeatmapState {
  const HeatmapInitial();
}

class HeatmapLoading extends HeatmapState {
  const HeatmapLoading();
}

class HeatmapLoaded extends HeatmapState {
  final Heatmap heatmap;

  const HeatmapLoaded(this.heatmap);

  @override
  List<Object?> get props => [heatmap];
}

class HeatmapError extends HeatmapState {
  final Failure failure;

  const HeatmapError(this.failure);

  @override
  List<Object?> get props => [failure];
}
