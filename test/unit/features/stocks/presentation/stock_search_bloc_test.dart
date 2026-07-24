import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/instrument_type.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/stock_search_result.dart';
import 'package:dhan_sanket/features/stocks/domain/repositories/stock_repository.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_search_bloc.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_search_event.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStockRepository extends Mock implements StockRepository {}

void main() {
  late MockStockRepository repository;

  const result = StockSearchResult(
    symbol: 'RELIANCE',
    name: 'Reliance Industries',
    isin: null,
    series: 'EQ',
    instrumentType: InstrumentType.equity,
  );

  setUp(() {
    repository = MockStockRepository();
  });

  blocTest<StockSearchBloc, StockSearchState>(
    'emits loading then loaded on a successful search',
    build: () {
      when(() => repository.search(any(), limit: any(named: 'limit'))).thenAnswer((_) async => const Success([result]));
      return StockSearchBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const StockSearchQueryChanged('reliance')),
    expect: () => [isA<StockSearchLoading>(), isA<StockSearchLoaded>()],
  );

  blocTest<StockSearchBloc, StockSearchState>(
    'emits initial (no search) for an empty query',
    build: () => StockSearchBloc(repository: repository),
    act: (bloc) => bloc.add(const StockSearchQueryChanged('   ')),
    expect: () => [isA<StockSearchInitial>()],
    verify: (_) => verifyNever(() => repository.search(any(), limit: any(named: 'limit'))),
  );

  blocTest<StockSearchBloc, StockSearchState>(
    'emits loading then error on failure',
    build: () {
      when(
        () => repository.search(any(), limit: any(named: 'limit')),
      ).thenAnswer((_) async => const Error(NetworkFailure()));
      return StockSearchBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const StockSearchQueryChanged('reliance')),
    expect: () => [isA<StockSearchLoading>(), isA<StockSearchError>()],
  );
}
