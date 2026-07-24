import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/instrument_type.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/stock_detail.dart';
import 'package:dhan_sanket/features/stocks/domain/repositories/stock_repository.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_quote_bloc.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_quote_event.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_quote_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStockRepository extends Mock implements StockRepository {}

void main() {
  late MockStockRepository repository;

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

  setUp(() {
    repository = MockStockRepository();
  });

  blocTest<StockQuoteBloc, StockQuoteState>(
    'emits loading then loaded on success',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => const Success(detail));
      return StockQuoteBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const StockQuoteRequested('RELIANCE')),
    expect: () => [isA<StockQuoteLoading>(), isA<StockQuoteLoaded>()],
  );

  blocTest<StockQuoteBloc, StockQuoteState>(
    'emits loading then error on failure',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return StockQuoteBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const StockQuoteRequested('RELIANCE')),
    expect: () => [isA<StockQuoteLoading>(), isA<StockQuoteError>()],
  );
}
