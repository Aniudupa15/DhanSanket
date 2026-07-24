import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/fundamentals.dart';

sealed class FundamentalsState extends Equatable {
  const FundamentalsState();

  @override
  List<Object?> get props => [];
}

class FundamentalsInitial extends FundamentalsState {
  const FundamentalsInitial();
}

class FundamentalsLoading extends FundamentalsState {
  const FundamentalsLoading();
}

class FundamentalsLoaded extends FundamentalsState {
  final Fundamentals fundamentals;

  const FundamentalsLoaded(this.fundamentals);

  @override
  List<Object?> get props => [fundamentals];
}

class FundamentalsError extends FundamentalsState {
  final Failure failure;

  const FundamentalsError(this.failure);

  @override
  List<Object?> get props => [failure];
}
