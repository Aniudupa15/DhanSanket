import 'package:equatable/equatable.dart';

sealed class IntradayAnalysisEvent extends Equatable {
  const IntradayAnalysisEvent();

  @override
  List<Object?> get props => [];
}

class IntradayAnalysisRequested extends IntradayAnalysisEvent {
  final num minConfidence;

  const IntradayAnalysisRequested({this.minConfidence = 0});

  @override
  List<Object?> get props => [minConfidence];
}
