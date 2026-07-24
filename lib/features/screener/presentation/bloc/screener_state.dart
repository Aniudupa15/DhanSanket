import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/screener_result.dart';

sealed class ScreenerState extends Equatable {
  const ScreenerState();

  @override
  List<Object?> get props => [];
}

class ScreenerInitial extends ScreenerState {
  const ScreenerInitial();
}

class ScreenerLoading extends ScreenerState {
  const ScreenerLoading();
}

class ScreenerLoaded extends ScreenerState {
  final List<ScreenerResult> results;

  const ScreenerLoaded(this.results);

  @override
  List<Object?> get props => [results];
}

class ScreenerError extends ScreenerState {
  final Failure failure;

  const ScreenerError(this.failure);

  @override
  List<Object?> get props => [failure];
}
