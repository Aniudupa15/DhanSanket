import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/market_repository.dart';
import 'market_movers_event.dart';
import 'market_movers_state.dart';

class MarketMoversBloc extends Bloc<MarketMoversEvent, MarketMoversState> {
  final MarketRepository _repository;

  MarketMoversBloc({required MarketRepository repository})
    : _repository = repository,
      super(const MarketMoversInitial()) {
    on<MarketMoversRequested>(_onRequested);
  }

  Future<void> _onRequested(MarketMoversRequested event, Emitter<MarketMoversState> emit) async {
    emit(const MarketMoversLoading());
    final result = await _repository.getMovers(event.category, period: event.period);
    switch (result) {
      case Success(data: final movers):
        emit(MarketMoversLoaded(movers));
      case Error(failure: final failure):
        emit(MarketMoversError(failure));
    }
  }
}
