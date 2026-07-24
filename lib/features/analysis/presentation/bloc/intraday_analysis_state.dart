import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/intraday_recommendation.dart';

sealed class IntradayAnalysisState extends Equatable {
  const IntradayAnalysisState();

  @override
  List<Object?> get props => [];
}

class IntradayAnalysisInitial extends IntradayAnalysisState {
  const IntradayAnalysisInitial();
}

class IntradayAnalysisLoading extends IntradayAnalysisState {
  const IntradayAnalysisLoading();
}

class IntradayAnalysisLoaded extends IntradayAnalysisState {
  final List<IntradayRecommendation> recommendations;

  const IntradayAnalysisLoaded(this.recommendations);

  @override
  List<Object?> get props => [recommendations];
}

class IntradayAnalysisError extends IntradayAnalysisState {
  final Failure failure;

  const IntradayAnalysisError(this.failure);

  @override
  List<Object?> get props => [failure];
}
