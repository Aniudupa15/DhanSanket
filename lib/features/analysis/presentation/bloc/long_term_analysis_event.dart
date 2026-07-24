import 'package:equatable/equatable.dart';

sealed class LongTermAnalysisEvent extends Equatable {
  const LongTermAnalysisEvent();

  @override
  List<Object?> get props => [];
}

class LongTermAnalysisRequested extends LongTermAnalysisEvent {
  final int minConfidence;
  final String? tenure;

  const LongTermAnalysisRequested({this.minConfidence = 0, this.tenure});

  @override
  List<Object?> get props => [minConfidence, tenure];
}
