import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/alert_repository.dart';
import 'alert_event.dart';
import 'alert_state.dart';

class AlertBloc extends Bloc<AlertEvent, AlertState> {
  final AlertRepository _repository;

  AlertBloc({required AlertRepository repository}) : _repository = repository, super(const AlertInitial()) {
    on<AlertsRequested>(_onRequested);
    on<AlertCreateRequested>(_onCreateRequested);
    on<AlertDeleteRequested>(_onDeleteRequested);
  }

  Future<void> _onRequested(AlertsRequested event, Emitter<AlertState> emit) async {
    emit(const AlertLoading());
    await _fetchAndEmit(emit);
  }

  Future<void> _onCreateRequested(AlertCreateRequested event, Emitter<AlertState> emit) async {
    final result = await _repository.create(
      symbol: event.symbol,
      alertType: event.alertType,
      condition: event.condition,
    );
    if (result case Error(:final failure)) {
      emit(AlertError(failure));
      return;
    }
    await _fetchAndEmit(emit);
  }

  Future<void> _onDeleteRequested(AlertDeleteRequested event, Emitter<AlertState> emit) async {
    final result = await _repository.delete(event.id);
    if (result case Error(:final failure)) {
      emit(AlertError(failure));
      return;
    }
    await _fetchAndEmit(emit);
  }

  Future<void> _fetchAndEmit(Emitter<AlertState> emit) async {
    final result = await _repository.list();
    switch (result) {
      case Success(data: final alerts):
        emit(AlertLoaded(alerts));
      case Error(failure: final failure):
        emit(AlertError(failure));
    }
  }
}
