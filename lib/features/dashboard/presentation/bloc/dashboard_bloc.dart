import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/live_socket_service.dart';
import '../../domain/entities/dashboard_snapshot.dart';
import '../../domain/repositories/dashboard_repository.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _repository;
  final LiveSocketService _liveSocketService;
  late final StreamSubscription<LiveEvent> _liveSubscription;

  DashboardBloc({required DashboardRepository repository, required LiveSocketService liveSocketService})
    : _repository = repository,
      _liveSocketService = liveSocketService,
      super(const DashboardInitial()) {
    on<DashboardRequested>(_onRequested);
    on<DashboardRefreshRequested>(_onRequested);
    on<DashboardLiveMarketSnapshotReceived>(_onLiveMarketSnapshot);
    _liveSocketService.subscribe(this, {LiveSocketService.marketChannel});
    _liveSubscription = _liveSocketService.events.listen((event) {
      if (event is MarketSnapshotLiveEvent) add(DashboardLiveMarketSnapshotReceived(event));
    });
  }

  Future<void> _onRequested(DashboardEvent event, Emitter<DashboardState> emit) async {
    emit(const DashboardLoading());
    final result = await _repository.getDashboard();
    switch (result) {
      case Success(data: final snapshot):
        emit(DashboardLoaded(snapshot));
      case Error(failure: final failure):
        emit(DashboardError(failure));
    }
  }

  void _onLiveMarketSnapshot(DashboardLiveMarketSnapshotReceived event, Emitter<DashboardState> emit) {
    final current = state;
    if (current is! DashboardLoaded) return;
    final snapshot = current.snapshot;
    emit(
      DashboardLoaded(
        DashboardSnapshot(
          marketStatus: snapshot.marketStatus,
          indices: snapshot.indices,
          gainers: event.liveEvent.gainers,
          losers: event.liveEvent.losers,
          mostActive: event.liveEvent.mostActive,
          fiftyTwoWeekHigh: snapshot.fiftyTwoWeekHigh,
          fiftyTwoWeekLow: snapshot.fiftyTwoWeekLow,
          latestNews: snapshot.latestNews,
          notes: snapshot.notes,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _liveSocketService.unsubscribe(this);
    _liveSubscription.cancel();
    return super.close();
  }
}
