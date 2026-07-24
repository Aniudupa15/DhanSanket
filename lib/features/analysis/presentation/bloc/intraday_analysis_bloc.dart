import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/analysis_repository.dart';
import 'intraday_analysis_event.dart';
import 'intraday_analysis_state.dart';

class IntradayAnalysisBloc extends Bloc<IntradayAnalysisEvent, IntradayAnalysisState> {
  final AnalysisRepository _repository;

  IntradayAnalysisBloc({required AnalysisRepository repository})
    : _repository = repository,
      super(const IntradayAnalysisInitial()) {
    on<IntradayAnalysisRequested>(_onRequested);
  }

  Future<void> _onRequested(IntradayAnalysisRequested event, Emitter<IntradayAnalysisState> emit) async {
    emit(const IntradayAnalysisLoading());
    final result = await _repository.getIntraday(minConfidence: event.minConfidence);
    switch (result) {
      case Success(data: final recommendations):
        emit(IntradayAnalysisLoaded(recommendations));
      case Error(failure: final failure):
        emit(IntradayAnalysisError(failure));
    }
  }
}
