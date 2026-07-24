import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/portfolio_repository.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final PortfolioRepository _repository;

  PortfolioBloc({required PortfolioRepository repository}) : _repository = repository, super(const PortfolioInitial()) {
    on<PortfoliosRequested>(_onRequested);
    on<PortfolioCreateRequested>(_onCreateRequested);
  }

  Future<void> _onRequested(PortfoliosRequested event, Emitter<PortfolioState> emit) async {
    emit(const PortfolioLoading());
    await _fetchAndEmit(emit);
  }

  Future<void> _onCreateRequested(PortfolioCreateRequested event, Emitter<PortfolioState> emit) async {
    final result = await _repository.create(event.name);
    if (result case Error(:final failure)) {
      emit(PortfolioError(failure));
      return;
    }
    await _fetchAndEmit(emit);
  }

  Future<void> _fetchAndEmit(Emitter<PortfolioState> emit) async {
    final result = await _repository.list();
    switch (result) {
      case Success(data: final portfolios):
        emit(PortfolioLoaded(portfolios));
      case Error(failure: final failure):
        emit(PortfolioError(failure));
    }
  }
}
