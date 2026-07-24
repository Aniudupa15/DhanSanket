import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/stock_repository.dart';
import 'price_history_event.dart';
import 'price_history_state.dart';

class PriceHistoryBloc extends Bloc<PriceHistoryEvent, PriceHistoryState> {
  final StockRepository _repository;

  PriceHistoryBloc({required StockRepository repository})
    : _repository = repository,
      super(const PriceHistoryInitial()) {
    on<PriceHistoryRequested>(_onRequested);
  }

  Future<void> _onRequested(PriceHistoryRequested event, Emitter<PriceHistoryState> emit) async {
    emit(const PriceHistoryLoading());
    final result = await _repository.getHistory(event.symbol, range: event.range);
    switch (result) {
      case Success(data: final history):
        emit(PriceHistoryLoaded(history));
      case Error(failure: final failure):
        emit(PriceHistoryError(failure));
    }
  }
}
