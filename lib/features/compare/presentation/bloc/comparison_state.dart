import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/comparison_entry.dart';

sealed class ComparisonState extends Equatable {
  const ComparisonState();

  @override
  List<Object?> get props => [];
}

class ComparisonInitial extends ComparisonState {
  const ComparisonInitial();
}

class ComparisonLoading extends ComparisonState {
  const ComparisonLoading();
}

class ComparisonLoaded extends ComparisonState {
  final List<ComparisonEntry> entries;

  const ComparisonLoaded(this.entries);

  @override
  List<Object?> get props => [entries];
}

class ComparisonError extends ComparisonState {
  final Failure failure;

  const ComparisonError(this.failure);

  @override
  List<Object?> get props => [failure];
}
