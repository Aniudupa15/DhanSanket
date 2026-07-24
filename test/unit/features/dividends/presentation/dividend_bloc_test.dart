import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/dividends/domain/entities/dividend_recommendation.dart';
import 'package:dhan_sanket/features/dividends/domain/repositories/dividend_repository.dart';
import 'package:dhan_sanket/features/dividends/presentation/bloc/dividend_bloc.dart';
import 'package:dhan_sanket/features/dividends/presentation/bloc/dividend_event.dart';
import 'package:dhan_sanket/features/dividends/presentation/bloc/dividend_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDividendRepository extends Mock implements DividendRepository {}

void main() {
  late MockDividendRepository repository;

  final recommendation = DividendRecommendation(
    symbol: 'RELIANCE',
    name: 'Reliance Industries',
    dividendYield: Decimal.parse('2.5'),
    dividendAmount: Decimal.parse('10.0'),
    exDividendDate: DateTime(2026, 2, 1),
    buyBeforeDate: DateTime(2026, 1, 31),
    recommendation: 'Hold',
    riskLevel: 'Low',
    confidence: 80,
  );

  setUp(() {
    repository = MockDividendRepository();
  });

  blocTest<DividendBloc, DividendState>(
    'emits loading then loaded on a successful fetch',
    build: () {
      when(
        () => repository.list(
          upcoming: any(named: 'upcoming'),
          sort: any(named: 'sort'),
        ),
      ).thenAnswer((_) async => Success([recommendation]));
      return DividendBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const DividendsRequested()),
    expect: () => [const DividendLoading(), isA<DividendLoaded>()],
  );

  blocTest<DividendBloc, DividendState>(
    'emits loading then error on failure',
    build: () {
      when(
        () => repository.list(
          upcoming: any(named: 'upcoming'),
          sort: any(named: 'sort'),
        ),
      ).thenAnswer((_) async => const Error(NetworkFailure()));
      return DividendBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const DividendsRequested()),
    expect: () => [const DividendLoading(), isA<DividendError>()],
  );

  blocTest<DividendBloc, DividendState>(
    'passes upcoming and sort filters through to the repository',
    build: () {
      when(
        () => repository.list(
          upcoming: any(named: 'upcoming'),
          sort: any(named: 'sort'),
        ),
      ).thenAnswer((_) async => Success([recommendation]));
      return DividendBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const DividendsRequested(upcoming: true, sort: 'yield')),
    verify: (_) {
      verify(() => repository.list(upcoming: true, sort: 'yield')).called(1);
    },
  );
}
