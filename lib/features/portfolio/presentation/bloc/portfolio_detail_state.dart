import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/portfolio_detail.dart';
import '../../domain/entities/portfolio_performance.dart';

sealed class PortfolioDetailState extends Equatable {
  const PortfolioDetailState();

  @override
  List<Object?> get props => [];
}

class PortfolioDetailInitial extends PortfolioDetailState {
  const PortfolioDetailInitial();
}

class PortfolioDetailLoading extends PortfolioDetailState {
  const PortfolioDetailLoading();
}

class PortfolioDetailLoaded extends PortfolioDetailState {
  final PortfolioDetail detail;
  final PortfolioPerformance performance;

  const PortfolioDetailLoaded({required this.detail, required this.performance});

  @override
  List<Object?> get props => [detail, performance];
}

class PortfolioDetailError extends PortfolioDetailState {
  final Failure failure;

  const PortfolioDetailError(this.failure);

  @override
  List<Object?> get props => [failure];
}
