import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/stock_repository.dart';
import 'stock_quote_event.dart';
import 'stock_quote_state.dart';

class StockQuoteBloc extends Bloc<StockQuoteEvent, StockQuoteState> {
  final StockRepository _repository;

  StockQuoteBloc({required StockRepository repository}) : _repository = repository, super(const StockQuoteInitial()) {
    on<StockQuoteRequested>(_onRequested);
  }

  Future<void> _onRequested(StockQuoteRequested event, Emitter<StockQuoteState> emit) async {
    emit(const StockQuoteLoading());
    final result = await _repository.getDetail(event.symbol);
    switch (result) {
      case Success(data: final detail):
        emit(StockQuoteLoaded(detail));
      case Error(failure: final failure):
        emit(StockQuoteError(failure));
    }
  }
}
