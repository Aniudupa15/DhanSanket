import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/stock_repository.dart';
import 'corporate_actions_event.dart';
import 'corporate_actions_state.dart';

class CorporateActionsBloc extends Bloc<CorporateActionsEvent, CorporateActionsState> {
  final StockRepository _repository;

  CorporateActionsBloc({required StockRepository repository})
    : _repository = repository,
      super(const CorporateActionsInitial()) {
    on<CorporateActionsRequested>(_onRequested);
  }

  Future<void> _onRequested(CorporateActionsRequested event, Emitter<CorporateActionsState> emit) async {
    emit(const CorporateActionsLoading());
    final result = await _repository.getCorporateActions(event.symbol);
    switch (result) {
      case Success(data: final actions):
        emit(CorporateActionsLoaded(actions));
      case Error(failure: final failure):
        emit(CorporateActionsError(failure));
    }
  }
}
