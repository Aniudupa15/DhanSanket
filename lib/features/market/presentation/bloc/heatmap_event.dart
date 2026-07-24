import 'package:equatable/equatable.dart';

sealed class HeatmapEvent extends Equatable {
  const HeatmapEvent();

  @override
  List<Object?> get props => [];
}

class HeatmapRequested extends HeatmapEvent {
  const HeatmapRequested();
}
