import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/live_socket_service.dart';
import '../../domain/entities/quote.dart';
import '../../domain/entities/stock_detail.dart';
import '../../domain/repositories/stock_repository.dart';
import 'stock_quote_event.dart';
import 'stock_quote_state.dart';

class StockQuoteBloc extends Bloc<StockQuoteEvent, StockQuoteState> {
  final StockRepository _repository;
  final LiveSocketService _liveSocketService;
  late final StreamSubscription<LiveEvent> _liveSubscription;

  StockQuoteBloc({required StockRepository repository, required LiveSocketService liveSocketService})
    : _repository = repository,
      _liveSocketService = liveSocketService,
      super(const StockQuoteInitial()) {
    on<StockQuoteRequested>(_onRequested);
    on<StockQuoteLiveUpdateReceived>(_onLiveUpdate);
    _liveSubscription = _liveSocketService.events.listen((event) {
      if (event is QuoteLiveEvent) add(StockQuoteLiveUpdateReceived(event));
    });
  }

  Future<void> _onRequested(StockQuoteRequested event, Emitter<StockQuoteState> emit) async {
    emit(const StockQuoteLoading());
    final result = await _repository.getDetail(event.symbol);
    switch (result) {
      case Success(data: final detail):
        emit(StockQuoteLoaded(detail));
        _liveSocketService.subscribe(this, {event.symbol});
      case Error(failure: final failure):
        emit(StockQuoteError(failure));
    }
  }

  void _onLiveUpdate(StockQuoteLiveUpdateReceived event, Emitter<StockQuoteState> emit) {
    final current = state;
    if (current is! StockQuoteLoaded) return;
    final detail = current.detail;
    final quote = detail.quote;
    if (quote == null || detail.symbol != event.liveEvent.symbol) return;

    emit(
      StockQuoteLoaded(
        StockDetail(
          symbol: detail.symbol,
          isin: detail.isin,
          name: detail.name,
          series: detail.series,
          sector: detail.sector,
          industry: detail.industry,
          instrumentType: detail.instrumentType,
          listingDate: detail.listingDate,
          faceValue: detail.faceValue,
          quoteUnavailableReason: detail.quoteUnavailableReason,
          quote: Quote(
            lastPrice: event.liveEvent.lastPrice,
            change: event.liveEvent.change,
            changePercent: event.liveEvent.changePercent,
            open: quote.open,
            high: quote.high,
            low: quote.low,
            previousClose: quote.previousClose,
            volume: event.liveEvent.volume,
            asOf: event.liveEvent.asOf,
          ),
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
