import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/momentum_repository.dart';
import 'momentum_event.dart';
import 'momentum_state.dart';

class MomentumBloc extends Bloc<MomentumEvent, MomentumState> {
  final MomentumRepository _repository;

  MomentumBloc({required MomentumRepository repository}) : _repository = repository, super(const MomentumInitial()) {
    on<MomentumRequested>(_onRequested);
  }

  Future<void> _onRequested(MomentumRequested event, Emitter<MomentumState> emit) async {
    emit(const MomentumLoading());
    final result = await _repository.getRanking(top: event.top);
    switch (result) {
      case Success(data: final picks):
        emit(MomentumLoaded(picks));
      case Error(failure: final failure):
        emit(MomentumError(failure));
    }
  }
}
