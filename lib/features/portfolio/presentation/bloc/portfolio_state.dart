import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/portfolio.dart';

sealed class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object?> get props => [];
}

class PortfolioInitial extends PortfolioState {
  const PortfolioInitial();
}

class PortfolioLoading extends PortfolioState {
  const PortfolioLoading();
}

class PortfolioLoaded extends PortfolioState {
  final List<Portfolio> portfolios;

  const PortfolioLoaded(this.portfolios);

  @override
  List<Object?> get props => [portfolios];
}

class PortfolioError extends PortfolioState {
  final Failure failure;

  const PortfolioError(this.failure);

  @override
  List<Object?> get props => [failure];
}
