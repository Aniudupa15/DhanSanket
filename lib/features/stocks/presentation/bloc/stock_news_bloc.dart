import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/stock_repository.dart';
import 'stock_news_event.dart';
import 'stock_news_state.dart';

class StockNewsBloc extends Bloc<StockNewsEvent, StockNewsState> {
  final StockRepository _repository;

  StockNewsBloc({required StockRepository repository}) : _repository = repository, super(const StockNewsInitial()) {
    on<StockNewsRequested>(_onRequested);
  }

  Future<void> _onRequested(StockNewsRequested event, Emitter<StockNewsState> emit) async {
    emit(const StockNewsLoading());
    final result = await _repository.getNews(event.symbol);
    switch (result) {
      case Success(data: final articles):
        emit(StockNewsLoaded(articles));
      case Error(failure: final failure):
        emit(StockNewsError(failure));
    }
  }
}
