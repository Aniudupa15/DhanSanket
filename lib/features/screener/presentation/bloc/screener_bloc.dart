import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/screener_repository.dart';
import 'screener_event.dart';
import 'screener_state.dart';

class ScreenerBloc extends Bloc<ScreenerEvent, ScreenerState> {
  final ScreenerRepository _repository;

  ScreenerBloc({required ScreenerRepository repository}) : _repository = repository, super(const ScreenerInitial()) {
    on<ScreenerSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(ScreenerSubmitted event, Emitter<ScreenerState> emit) async {
    emit(const ScreenerLoading());
    final result = await _repository.screen(event.filter);
    switch (result) {
      case Success(data: final results):
        emit(ScreenerLoaded(results));
      case Error(failure: final failure):
        emit(ScreenerError(failure));
    }
  }
}
