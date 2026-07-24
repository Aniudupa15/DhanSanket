import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/analysis/domain/entities/intraday_recommendation.dart';
import 'package:dhan_sanket/features/analysis/domain/repositories/analysis_repository.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/intraday_analysis_bloc.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/intraday_analysis_event.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/intraday_analysis_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAnalysisRepository extends Mock implements AnalysisRepository {}

void main() {
  late MockAnalysisRepository repository;

  final recommendation = IntradayRecommendation(
    symbol: 'RELIANCE',
    name: 'Reliance Industries',
    asOf: DateTime(2026, 1, 1),
    signal: 'BUY',
    confidence: Decimal.parse('75'),
    entryPrice: Decimal.parse('2500'),
    targetPrice: Decimal.parse('2600'),
    stopLoss: Decimal.parse('2450'),
    reasoning: const ['RSI oversold'],
  );

  setUp(() {
    repository = MockAnalysisRepository();
  });

  blocTest<IntradayAnalysisBloc, IntradayAnalysisState>(
    'emits loading then loaded on a successful fetch',
    build: () {
      when(
        () => repository.getIntraday(minConfidence: any(named: 'minConfidence')),
      ).thenAnswer((_) async => Success([recommendation]));
      return IntradayAnalysisBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const IntradayAnalysisRequested()),
    expect: () => [const IntradayAnalysisLoading(), isA<IntradayAnalysisLoaded>()],
  );

  blocTest<IntradayAnalysisBloc, IntradayAnalysisState>(
    'emits loading then error on failure',
    build: () {
      when(
        () => repository.getIntraday(minConfidence: any(named: 'minConfidence')),
      ).thenAnswer((_) async => const Error(NetworkFailure()));
      return IntradayAnalysisBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const IntradayAnalysisRequested()),
    expect: () => [const IntradayAnalysisLoading(), isA<IntradayAnalysisError>()],
  );
}
