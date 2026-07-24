import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/portfolio_repository.dart';
import 'portfolio_detail_event.dart';
import 'portfolio_detail_state.dart';

class PortfolioDetailBloc extends Bloc<PortfolioDetailEvent, PortfolioDetailState> {
  final PortfolioRepository _repository;

  PortfolioDetailBloc({required PortfolioRepository repository})
    : _repository = repository,
      super(const PortfolioDetailInitial()) {
    on<PortfolioDetailRequested>(_onRequested);
    on<PortfolioTransactionAddRequested>(_onTransactionAdd);
  }

  Future<void> _onRequested(PortfolioDetailRequested event, Emitter<PortfolioDetailState> emit) async {
    emit(const PortfolioDetailLoading());
    await _fetchAndEmit(event.portfolioId, emit);
  }

  Future<void> _onTransactionAdd(PortfolioTransactionAddRequested event, Emitter<PortfolioDetailState> emit) async {
    final result = await _repository.addTransaction(
      portfolioId: event.portfolioId,
      symbol: event.symbol,
      transactionType: event.transactionType,
      quantity: event.quantity,
      price: event.price,
      transactionDate: event.transactionDate,
    );
    if (result case Error(:final failure)) {
      emit(PortfolioDetailError(failure));
      return;
    }
    await _fetchAndEmit(event.portfolioId, emit);
  }

  Future<void> _fetchAndEmit(String portfolioId, Emitter<PortfolioDetailState> emit) async {
    // Both requests start immediately (before either `await`) so they run
    // concurrently even though awaited sequentially below.
    final detailFuture = _repository.getDetail(portfolioId);
    final performanceFuture = _repository.getPerformance(portfolioId);
    final detailResult = await detailFuture;
    final performanceResult = await performanceFuture;

    switch ((detailResult, performanceResult)) {
      case (Success(data: final detail), Success(data: final performance)):
        emit(PortfolioDetailLoaded(detail: detail, performance: performance));
      case (Error(failure: final failure), _):
        emit(PortfolioDetailError(failure));
      case (_, Error(failure: final failure)):
        emit(PortfolioDetailError(failure));
    }
  }
}
