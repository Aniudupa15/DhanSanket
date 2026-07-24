import 'package:equatable/equatable.dart';

sealed class StockSearchEvent extends Equatable {
  const StockSearchEvent();

  @override
  List<Object?> get props => [];
}

/// Dispatched by the search page after its own debounce timer fires (UI
/// layer debounces, not the Bloc, to avoid pulling in a transformer
/// package for a single feature).
class StockSearchQueryChanged extends StockSearchEvent {
  final String query;

  const StockSearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class StockSearchCleared extends StockSearchEvent {
  const StockSearchCleared();
}
