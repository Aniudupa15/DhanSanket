import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/market_repository.dart';
import 'heatmap_event.dart';
import 'heatmap_state.dart';

class HeatmapBloc extends Bloc<HeatmapEvent, HeatmapState> {
  final MarketRepository _repository;

  HeatmapBloc({required MarketRepository repository}) : _repository = repository, super(const HeatmapInitial()) {
    on<HeatmapRequested>(_onRequested);
  }

  Future<void> _onRequested(HeatmapRequested event, Emitter<HeatmapState> emit) async {
    emit(const HeatmapLoading());
    final result = await _repository.getHeatmap();
    switch (result) {
      case Success(data: final heatmap):
        emit(HeatmapLoaded(heatmap));
      case Error(failure: final failure):
        emit(HeatmapError(failure));
    }
  }
}
