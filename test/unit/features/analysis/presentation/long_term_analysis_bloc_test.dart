import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/analysis/domain/entities/long_term_recommendation.dart';
import 'package:dhan_sanket/features/analysis/domain/repositories/analysis_repository.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/long_term_analysis_bloc.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/long_term_analysis_event.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/long_term_analysis_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAnalysisRepository extends Mock implements AnalysisRepository {}

void main() {
  late MockAnalysisRepository repository;

  final recommendation = LongTermRecommendation(
    symbol: 'TCS',
    name: 'Tata Consultancy Services',
    asOf: DateTime(2026, 1, 1),
    signal: 'BUY',
    confidence: 80,
    riskLevel: 'Low',
    growthPotential: 'High',
    investmentTenure: '1 Year',
    reasoning: const ['Strong fundamentals'],
  );

  setUp(() {
    repository = MockAnalysisRepository();
  });

  blocTest<LongTermAnalysisBloc, LongTermAnalysisState>(
    'emits loading then loaded on a successful fetch',
    build: () {
      when(
        () => repository.getLongTerm(
          minConfidence: any(named: 'minConfidence'),
          tenure: any(named: 'tenure'),
        ),
      ).thenAnswer((_) async => Success([recommendation]));
      return LongTermAnalysisBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const LongTermAnalysisRequested()),
    expect: () => [const LongTermAnalysisLoading(), isA<LongTermAnalysisLoaded>()],
  );

  blocTest<LongTermAnalysisBloc, LongTermAnalysisState>(
    'emits loading then error on failure',
    build: () {
      when(
        () => repository.getLongTerm(
          minConfidence: any(named: 'minConfidence'),
          tenure: any(named: 'tenure'),
        ),
      ).thenAnswer((_) async => const Error(NetworkFailure()));
      return LongTermAnalysisBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const LongTermAnalysisRequested()),
    expect: () => [const LongTermAnalysisLoading(), isA<LongTermAnalysisError>()],
  );
}
