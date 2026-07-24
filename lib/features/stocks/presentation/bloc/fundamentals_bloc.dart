import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/stock_repository.dart';
import 'fundamentals_event.dart';
import 'fundamentals_state.dart';

class FundamentalsBloc extends Bloc<FundamentalsEvent, FundamentalsState> {
  final StockRepository _repository;

  FundamentalsBloc({required StockRepository repository})
    : _repository = repository,
      super(const FundamentalsInitial()) {
    on<FundamentalsRequested>(_onRequested);
  }

  Future<void> _onRequested(FundamentalsRequested event, Emitter<FundamentalsState> emit) async {
    emit(const FundamentalsLoading());
    final result = await _repository.getFundamentals(event.symbol);
    switch (result) {
      case Success(data: final fundamentals):
        emit(FundamentalsLoaded(fundamentals));
      case Error(failure: final failure):
        emit(FundamentalsError(failure));
    }
  }
}
