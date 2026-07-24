import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/stock_repository.dart';
import 'indicators_event.dart';
import 'indicators_state.dart';

class IndicatorsBloc extends Bloc<IndicatorsEvent, IndicatorsState> {
  final StockRepository _repository;

  IndicatorsBloc({required StockRepository repository}) : _repository = repository, super(const IndicatorsInitial()) {
    on<IndicatorsRequested>(_onRequested);
  }

  Future<void> _onRequested(IndicatorsRequested event, Emitter<IndicatorsState> emit) async {
    emit(const IndicatorsLoading());
    final result = await _repository.getIndicators(event.symbol);
    switch (result) {
      case Success(data: final indicators):
        emit(IndicatorsLoaded(indicators));
      case Error(failure: final failure):
        emit(IndicatorsError(failure));
    }
  }
}
