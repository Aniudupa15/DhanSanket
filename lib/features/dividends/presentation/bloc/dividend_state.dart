import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/dividend_recommendation.dart';

sealed class DividendState extends Equatable {
  const DividendState();

  @override
  List<Object?> get props => [];
}

class DividendInitial extends DividendState {
  const DividendInitial();
}

class DividendLoading extends DividendState {
  const DividendLoading();
}

class DividendLoaded extends DividendState {
  final List<DividendRecommendation> recommendations;

  const DividendLoaded(this.recommendations);

  @override
  List<Object?> get props => [recommendations];
}

class DividendError extends DividendState {
  final Failure failure;

  const DividendError(this.failure);

  @override
  List<Object?> get props => [failure];
}
