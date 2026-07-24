import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/stock_repository.dart';
import 'signals_event.dart';
import 'signals_state.dart';

class SignalsBloc extends Bloc<SignalsEvent, SignalsState> {
  final StockRepository _repository;

  SignalsBloc({required StockRepository repository}) : _repository = repository, super(const SignalsInitial()) {
    on<SignalsRequested>(_onRequested);
  }

  Future<void> _onRequested(SignalsRequested event, Emitter<SignalsState> emit) async {
    emit(const SignalsLoading());
    // Both requests start immediately (before either `await`), so they run
    // concurrently even though awaited sequentially below - no need for
    // Future.wait, which can't hold two differently-typed Results in one
    // homogeneous list without losing type information.
    final intradayFuture = _repository.getIntradaySignal(event.symbol);
    final longTermFuture = _repository.getLongTermSignal(event.symbol);
    final intradayResult = await intradayFuture;
    final longTermResult = await longTermFuture;

    switch ((intradayResult, longTermResult)) {
      case (Success(data: final intraday), Success(data: final longTerm)):
        emit(SignalsLoaded(intraday: intraday, longTerm: longTerm));
      case (Error(failure: final failure), _):
        emit(SignalsError(failure));
      case (_, Error(failure: final failure)):
        emit(SignalsError(failure));
    }
  }
}
