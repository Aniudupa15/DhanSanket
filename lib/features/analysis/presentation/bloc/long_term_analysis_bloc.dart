import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/analysis_repository.dart';
import 'long_term_analysis_event.dart';
import 'long_term_analysis_state.dart';

class LongTermAnalysisBloc extends Bloc<LongTermAnalysisEvent, LongTermAnalysisState> {
  final AnalysisRepository _repository;

  LongTermAnalysisBloc({required AnalysisRepository repository})
    : _repository = repository,
      super(const LongTermAnalysisInitial()) {
    on<LongTermAnalysisRequested>(_onRequested);
  }

  Future<void> _onRequested(LongTermAnalysisRequested event, Emitter<LongTermAnalysisState> emit) async {
    emit(const LongTermAnalysisLoading());
    final result = await _repository.getLongTerm(minConfidence: event.minConfidence, tenure: event.tenure);
    switch (result) {
      case Success(data: final recommendations):
        emit(LongTermAnalysisLoaded(recommendations));
      case Error(failure: final failure):
        emit(LongTermAnalysisError(failure));
    }
  }
}
