import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/screener/domain/entities/screener_filter.dart';
import 'package:dhan_sanket/features/screener/domain/entities/screener_result.dart';
import 'package:dhan_sanket/features/screener/domain/repositories/screener_repository.dart';
import 'package:dhan_sanket/features/screener/presentation/bloc/screener_bloc.dart';
import 'package:dhan_sanket/features/screener/presentation/bloc/screener_event.dart';
import 'package:dhan_sanket/features/screener/presentation/bloc/screener_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockScreenerRepository extends Mock implements ScreenerRepository {}

void main() {
  late MockScreenerRepository repository;

  final result = ScreenerResult(
    symbol: 'RELIANCE',
    name: 'Reliance Industries',
    asOf: DateTime(2026, 1, 1),
    close: Decimal.fromInt(1300),
    volume: 1000,
    rsi14: Decimal.parse('28'),
    sma50: Decimal.fromInt(1250),
    sma200: Decimal.fromInt(1200),
  );

  setUpAll(() {
    registerFallbackValue(const ScreenerFilter());
  });

  setUp(() {
    repository = MockScreenerRepository();
  });

  blocTest<ScreenerBloc, ScreenerState>(
    'emits loading then loaded on a successful screen',
    build: () {
      when(() => repository.screen(any())).thenAnswer((_) async => Success([result]));
      return ScreenerBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const ScreenerSubmitted(ScreenerFilter(rsiBelow: null))),
    expect: () => [const ScreenerLoading(), isA<ScreenerLoaded>()],
  );

  blocTest<ScreenerBloc, ScreenerState>(
    'emits loading then error on failure',
    build: () {
      when(() => repository.screen(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return ScreenerBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const ScreenerSubmitted(ScreenerFilter())),
    expect: () => [const ScreenerLoading(), isA<ScreenerError>()],
  );
}
