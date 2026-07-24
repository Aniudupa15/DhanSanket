import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/core/network/live_socket_service.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/instrument_type.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/quote.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/stock_detail.dart';
import 'package:dhan_sanket/features/stocks/domain/repositories/stock_repository.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_quote_bloc.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_quote_event.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_quote_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fakes/mock_live_socket_service.dart';

class MockStockRepository extends Mock implements StockRepository {}

void main() {
  late MockStockRepository repository;
  late MockLiveSocketService liveSocketService;

  const detail = StockDetail(
    symbol: 'RELIANCE',
    isin: null,
    name: 'Reliance Industries',
    series: 'EQ',
    sector: null,
    industry: null,
    instrumentType: InstrumentType.equity,
    listingDate: null,
    faceValue: null,
    quote: null,
    quoteUnavailableReason: null,
  );

  final detailWithQuote = StockDetail(
    symbol: 'RELIANCE',
    isin: null,
    name: 'Reliance Industries',
    series: 'EQ',
    sector: null,
    industry: null,
    instrumentType: InstrumentType.equity,
    listingDate: null,
    faceValue: null,
    quoteUnavailableReason: null,
    quote: Quote(
      lastPrice: Decimal.fromInt(100),
      change: Decimal.fromInt(1),
      changePercent: Decimal.parse('1'),
      open: Decimal.fromInt(99),
      high: Decimal.fromInt(101),
      low: Decimal.fromInt(98),
      previousClose: Decimal.fromInt(99),
      volume: 1000,
      asOf: DateTime(2026, 1, 1),
    ),
  );

  setUp(() {
    repository = MockStockRepository();
    liveSocketService = MockLiveSocketService();
  });

  blocTest<StockQuoteBloc, StockQuoteState>(
    'emits loading then loaded on success',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => const Success(detail));
      return StockQuoteBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const StockQuoteRequested('RELIANCE')),
    expect: () => [isA<StockQuoteLoading>(), isA<StockQuoteLoaded>()],
  );

  blocTest<StockQuoteBloc, StockQuoteState>(
    'emits loading then error on failure',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return StockQuoteBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const StockQuoteRequested('RELIANCE')),
    expect: () => [isA<StockQuoteLoading>(), isA<StockQuoteError>()],
  );

  blocTest<StockQuoteBloc, StockQuoteState>(
    'patches the quote in place on a live update for the loaded symbol',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => Success(detailWithQuote));
      return StockQuoteBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) async {
      bloc.add(const StockQuoteRequested('RELIANCE'));
      await Future<void>.delayed(const Duration(milliseconds: 10));
      liveSocketService.emit(
        QuoteLiveEvent(
          symbol: 'RELIANCE',
          lastPrice: Decimal.fromInt(105),
          change: Decimal.fromInt(6),
          changePercent: Decimal.parse('6'),
          volume: 2000,
          asOf: DateTime(2026, 1, 2),
        ),
      );
    },
    wait: const Duration(milliseconds: 50),
    skip: 2,
    expect: () => [isA<StockQuoteLoaded>()],
    verify: (bloc) {
      final state = bloc.state as StockQuoteLoaded;
      expect(state.detail.quote!.lastPrice, Decimal.fromInt(105));
      expect(state.detail.quote!.open, Decimal.fromInt(99));
    },
  );
}
