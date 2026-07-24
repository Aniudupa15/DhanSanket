import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/watchlist_repository.dart';
import 'watchlist_detail_event.dart';
import 'watchlist_detail_state.dart';

class WatchlistDetailBloc extends Bloc<WatchlistDetailEvent, WatchlistDetailState> {
  final WatchlistRepository _repository;

  WatchlistDetailBloc({required WatchlistRepository repository})
    : _repository = repository,
      super(const WatchlistDetailInitial()) {
    on<WatchlistDetailRequested>(_onRequested);
    on<WatchlistItemAddRequested>(_onItemAdd);
    on<WatchlistItemRemoveRequested>(_onItemRemove);
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

  void _emitResult(Result result, Emitter<WatchlistDetailState> emit) {
    switch (result) {
      case Success(data: final detail):
        emit(WatchlistDetailLoaded(detail));
      case Error(failure: final failure):
        emit(WatchlistDetailError(failure));
    }
  }
}
