import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/price_history.dart';

sealed class PriceHistoryState extends Equatable {
  const PriceHistoryState();

  @override
  List<Object?> get props => [];
}

class PriceHistoryInitial extends PriceHistoryState {
  const PriceHistoryInitial();
}

class PriceHistoryLoading extends PriceHistoryState {
  const PriceHistoryLoading();
}

class PriceHistoryLoaded extends PriceHistoryState {
  final PriceHistory history;

  const PriceHistoryLoaded(this.history);

  @override
  List<Object?> get props => [history];
}

class PriceHistoryError extends PriceHistoryState {
  final Failure failure;

  const PriceHistoryError(this.failure);

  @override
  List<Object?> get props => [failure];
}
