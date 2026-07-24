import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/live_socket_service.dart';
import '../../domain/entities/holding.dart';
import '../../domain/entities/portfolio_detail.dart';
import '../../domain/repositories/portfolio_repository.dart';
import 'portfolio_detail_event.dart';
import 'portfolio_detail_state.dart';

class PortfolioDetailBloc extends Bloc<PortfolioDetailEvent, PortfolioDetailState> {
  final PortfolioRepository _repository;
  final LiveSocketService _liveSocketService;
  late final StreamSubscription<LiveEvent> _liveSubscription;

  PortfolioDetailBloc({required PortfolioRepository repository, required LiveSocketService liveSocketService})
    : _repository = repository,
      _liveSocketService = liveSocketService,
      super(const PortfolioDetailInitial()) {
    on<PortfolioDetailRequested>(_onRequested);
    on<PortfolioTransactionAddRequested>(_onTransactionAdd);
    on<PortfolioDetailLiveUpdateReceived>(_onLiveUpdate);
    _liveSubscription = _liveSocketService.events.listen((event) {
      if (event is QuoteLiveEvent) add(PortfolioDetailLiveUpdateReceived(event));
    });
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

  void _onLiveUpdate(PortfolioDetailLiveUpdateReceived event, Emitter<PortfolioDetailState> emit) {
    final current = state;
    if (current is! PortfolioDetailLoaded) return;
    final liveEvent = event.liveEvent;
    final holdings = current.detail.holdings;
    final index = holdings.indexWhere((holding) => holding.symbol == liveEvent.symbol);
    if (index == -1) return;

    final holding = holdings[index];
    final currentPrice = liveEvent.lastPrice;
    final currentValue = holding.quantity * currentPrice;
    final pnl = currentValue - holding.costBasis;
    final pnlPercent = holding.costBasis == Decimal.zero
        ? null
        : (pnl / holding.costBasis).toDecimal(scaleOnInfinitePrecision: 4) * Decimal.fromInt(100);

    final updatedHoldings = List<Holding>.of(holdings);
    updatedHoldings[index] = Holding(
      symbol: holding.symbol,
      quantity: holding.quantity,
      avgPrice: holding.avgPrice,
      costBasis: holding.costBasis,
      currentPrice: currentPrice,
      currentValue: currentValue,
      pnl: pnl,
      pnlPercent: pnlPercent,
    );
    emit(
      PortfolioDetailLoaded(
        detail: PortfolioDetail(
          id: current.detail.id,
          name: current.detail.name,
          createdAt: current.detail.createdAt,
          holdings: updatedHoldings,
        ),
        performance: current.performance,
      ),
    );
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
        _liveSocketService.subscribe(this, detail.holdings.map((holding) => holding.symbol).toSet());
      case (Error(failure: final failure), _):
        emit(PortfolioDetailError(failure));
      case (_, Error(failure: final failure)):
        emit(PortfolioDetailError(failure));
    }
  }

  @override
  Future<void> close() {
    _liveSocketService.unsubscribe(this);
    _liveSubscription.cancel();
    return super.close();
  }
}
