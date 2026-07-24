import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/live_socket_service.dart';
import '../../domain/entities/watchlist_detail.dart';
import '../../domain/entities/watchlist_item.dart';
import '../../domain/repositories/watchlist_repository.dart';
import 'watchlist_detail_event.dart';
import 'watchlist_detail_state.dart';

class WatchlistDetailBloc extends Bloc<WatchlistDetailEvent, WatchlistDetailState> {
  final WatchlistRepository _repository;
  final LiveSocketService _liveSocketService;
  late final StreamSubscription<LiveEvent> _liveSubscription;

  WatchlistDetailBloc({required WatchlistRepository repository, required LiveSocketService liveSocketService})
    : _repository = repository,
      _liveSocketService = liveSocketService,
      super(const WatchlistDetailInitial()) {
    on<WatchlistDetailRequested>(_onRequested);
    on<WatchlistItemAddRequested>(_onItemAdd);
    on<WatchlistItemRemoveRequested>(_onItemRemove);
    on<WatchlistDetailLiveUpdateReceived>(_onLiveUpdate);
    _liveSubscription = _liveSocketService.events.listen((event) {
      if (event is QuoteLiveEvent) add(WatchlistDetailLiveUpdateReceived(event));
    });
  }

  Future<void> _onRequested(WatchlistDetailRequested event, Emitter<WatchlistDetailState> emit) async {
    emit(const WatchlistDetailLoading());
    final result = await _repository.getDetail(event.id);
    _emitResult(result, emit);
  }

  Future<void> _onItemAdd(WatchlistItemAddRequested event, Emitter<WatchlistDetailState> emit) async {
    final result = await _repository.addItem(event.id, event.symbol);
    _emitResult(result, emit);
  }

  Future<void> _onItemRemove(WatchlistItemRemoveRequested event, Emitter<WatchlistDetailState> emit) async {
    final result = await _repository.removeItem(event.id, event.symbol);
    _emitResult(result, emit);
  }

  void _onLiveUpdate(WatchlistDetailLiveUpdateReceived event, Emitter<WatchlistDetailState> emit) {
    final current = state;
    if (current is! WatchlistDetailLoaded) return;
    final liveEvent = event.liveEvent;
    final items = current.detail.items;
    final index = items.indexWhere((item) => item.symbol == liveEvent.symbol);
    if (index == -1) return;

    final updatedItems = List<WatchlistItem>.of(items);
    updatedItems[index] = WatchlistItem(
      symbol: items[index].symbol,
      name: items[index].name,
      addedAt: items[index].addedAt,
      lastPrice: liveEvent.lastPrice,
      change: liveEvent.change,
      changePercent: liveEvent.changePercent,
    );
    emit(
      WatchlistDetailLoaded(
        WatchlistDetail(
          id: current.detail.id,
          name: current.detail.name,
          createdAt: current.detail.createdAt,
          items: updatedItems,
        ),
      ),
    );
  }

  void _emitResult(Result<WatchlistDetail> result, Emitter<WatchlistDetailState> emit) {
    switch (result) {
      case Success(data: final detail):
        emit(WatchlistDetailLoaded(detail));
        _liveSocketService.subscribe(this, detail.items.map((item) => item.symbol).toSet());
      case Error(failure: final failure):
        emit(WatchlistDetailError(failure));
    }
  }

  @override
  Future<void> close() {
    _liveSocketService.unsubscribe(this);
    _liveSubscription.cancel();
    return super.close();
  }
}
