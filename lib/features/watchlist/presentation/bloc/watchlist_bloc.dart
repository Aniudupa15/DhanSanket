import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/watchlist_repository.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final WatchlistRepository _repository;

  WatchlistBloc({required WatchlistRepository repository}) : _repository = repository, super(const WatchlistInitial()) {
    on<WatchlistsRequested>(_onRequested);
    on<WatchlistCreateRequested>(_onCreateRequested);
    on<WatchlistDeleteRequested>(_onDeleteRequested);
  }

  Future<void> _onRequested(WatchlistsRequested event, Emitter<WatchlistState> emit) async {
    emit(const WatchlistLoading());
    await _fetchAndEmit(emit);
  }

  Future<void> _onCreateRequested(WatchlistCreateRequested event, Emitter<WatchlistState> emit) async {
    final result = await _repository.create(event.name);
    if (result case Error(:final failure)) {
      emit(WatchlistError(failure));
      return;
    }
    await _fetchAndEmit(emit);
  }

  Future<void> _onDeleteRequested(WatchlistDeleteRequested event, Emitter<WatchlistState> emit) async {
    final result = await _repository.delete(event.id);
    if (result case Error(:final failure)) {
      emit(WatchlistError(failure));
      return;
    }
    await _fetchAndEmit(emit);
  }

  Future<void> _fetchAndEmit(Emitter<WatchlistState> emit) async {
    final result = await _repository.list();
    switch (result) {
      case Success(data: final watchlists):
        emit(WatchlistLoaded(watchlists));
      case Error(failure: final failure):
        emit(WatchlistError(failure));
    }
  }
}
