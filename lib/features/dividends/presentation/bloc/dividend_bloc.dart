import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/dividend_repository.dart';
import 'dividend_event.dart';
import 'dividend_state.dart';

class DividendBloc extends Bloc<DividendEvent, DividendState> {
  final DividendRepository _repository;

  DividendBloc({required DividendRepository repository}) : _repository = repository, super(const DividendInitial()) {
    on<DividendsRequested>(_onRequested);
  }

  Future<void> _onRequested(DividendsRequested event, Emitter<DividendState> emit) async {
    emit(const DividendLoading());
    final result = await _repository.list(upcoming: event.upcoming, sort: event.sort);
    switch (result) {
      case Success(data: final recommendations):
        emit(DividendLoaded(recommendations));
      case Error(failure: final failure):
        emit(DividendError(failure));
    }
  }
}
