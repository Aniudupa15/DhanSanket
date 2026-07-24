import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/comparison_repository.dart';
import 'comparison_event.dart';
import 'comparison_state.dart';

class ComparisonBloc extends Bloc<ComparisonEvent, ComparisonState> {
  final ComparisonRepository _repository;

  ComparisonBloc({required ComparisonRepository repository})
    : _repository = repository,
      super(const ComparisonInitial()) {
    on<ComparisonRequested>(_onRequested);
  }

  Future<void> _onRequested(ComparisonRequested event, Emitter<ComparisonState> emit) async {
    emit(const ComparisonLoading());
    final result = await _repository.compare(event.symbols);
    switch (result) {
      case Success(data: final entries):
        emit(ComparisonLoaded(entries));
      case Error(failure: final failure):
        emit(ComparisonError(failure));
    }
  }
}
