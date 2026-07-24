import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/stock_repository.dart';
import 'stock_search_event.dart';
import 'stock_search_state.dart';

class StockSearchBloc extends Bloc<StockSearchEvent, StockSearchState> {
  final StockRepository _repository;

  StockSearchBloc({required StockRepository repository}) : _repository = repository, super(const StockSearchInitial()) {
    on<StockSearchQueryChanged>(_onQueryChanged);
    on<StockSearchCleared>((event, emit) => emit(const StockSearchInitial()));
  }

  Future<void> _onQueryChanged(StockSearchQueryChanged event, Emitter<StockSearchState> emit) async {
    final query = event.query.trim();
    if (query.isEmpty) {
      emit(const StockSearchInitial());
      return;
    }
    emit(const StockSearchLoading());
    final result = await _repository.search(query);
    switch (result) {
      case Success(data: final results):
        emit(StockSearchLoaded(results));
      case Error(failure: final failure):
        emit(StockSearchError(failure));
    }
  }
}
