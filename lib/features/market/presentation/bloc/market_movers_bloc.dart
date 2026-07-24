import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/live_socket_service.dart';
import '../../domain/entities/mover_category.dart';
import '../../domain/repositories/market_repository.dart';
import 'market_movers_event.dart';
import 'market_movers_state.dart';

class MarketMoversBloc extends Bloc<MarketMoversEvent, MarketMoversState> {
  final MarketRepository _repository;
  final LiveSocketService _liveSocketService;
  late final StreamSubscription<LiveEvent> _liveSubscription;
  MoverCategory? _currentCategory;

  MarketMoversBloc({required MarketRepository repository, required LiveSocketService liveSocketService})
    : _repository = repository,
      _liveSocketService = liveSocketService,
      super(const MarketMoversInitial()) {
    on<MarketMoversRequested>(_onRequested);
    on<MarketMoversLiveSnapshotReceived>(_onLiveSnapshot);
    _liveSocketService.subscribe(this, {LiveSocketService.marketChannel});
    _liveSubscription = _liveSocketService.events.listen((event) {
      if (event is MarketSnapshotLiveEvent) add(MarketMoversLiveSnapshotReceived(event));
    });
  }

  Future<void> _onRequested(MarketMoversRequested event, Emitter<MarketMoversState> emit) async {
    _currentCategory = event.category;
    emit(const MarketMoversLoading());
    final result = await _repository.getMovers(event.category, period: event.period);
    switch (result) {
      case Success(data: final movers):
        emit(MarketMoversLoaded(movers));
      case Error(failure: final failure):
        emit(MarketMoversError(failure));
    }
  }

  void _onLiveSnapshot(MarketMoversLiveSnapshotReceived event, Emitter<MarketMoversState> emit) {
    if (state is! MarketMoversLoaded) return;
    // The broadcaster only covers gainers/losers/most-active - 52-week
    // high/low have no live feed, so those categories are left untouched.
    final movers = switch (_currentCategory) {
      MoverCategory.gainers => event.liveEvent.gainers,
      MoverCategory.losers => event.liveEvent.losers,
      MoverCategory.mostActive => event.liveEvent.mostActive,
      _ => null,
    };
    if (movers != null) emit(MarketMoversLoaded(movers));
  }

  @override
  Future<void> close() {
    _liveSocketService.unsubscribe(this);
    _liveSubscription.cancel();
    return super.close();
  }
}
