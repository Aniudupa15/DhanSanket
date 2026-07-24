import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/long_term_recommendation.dart';

sealed class LongTermAnalysisState extends Equatable {
  const LongTermAnalysisState();

  @override
  List<Object?> get props => [];
}

class LongTermAnalysisInitial extends LongTermAnalysisState {
  const LongTermAnalysisInitial();
}

class LongTermAnalysisLoading extends LongTermAnalysisState {
  const LongTermAnalysisLoading();
}

class LongTermAnalysisLoaded extends LongTermAnalysisState {
  final List<LongTermRecommendation> recommendations;

  const LongTermAnalysisLoaded(this.recommendations);

  @override
  List<Object?> get props => [recommendations];
}

class LongTermAnalysisError extends LongTermAnalysisState {
  final Failure failure;

  const LongTermAnalysisError(this.failure);

  @override
  List<Object?> get props => [failure];
}
