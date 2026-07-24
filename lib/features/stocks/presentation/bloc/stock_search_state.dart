import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/stock_search_result.dart';

sealed class StockSearchState extends Equatable {
  const StockSearchState();

  @override
  List<Object?> get props => [];
}

class StockSearchInitial extends StockSearchState {
  const StockSearchInitial();
}

class StockSearchLoading extends StockSearchState {
  const StockSearchLoading();
}

class StockSearchLoaded extends StockSearchState {
  final List<StockSearchResult> results;

  const StockSearchLoaded(this.results);

  @override
  List<Object?> get props => [results];
}

class StockSearchError extends StockSearchState {
  final Failure failure;

  const StockSearchError(this.failure);

  @override
  List<Object?> get props => [failure];
}
