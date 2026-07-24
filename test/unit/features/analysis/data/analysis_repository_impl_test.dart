import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/analysis/data/datasources/analysis_remote_data_source.dart';
import 'package:dhan_sanket/features/analysis/data/dto/intraday_recommendation_dto.dart';
import 'package:dhan_sanket/features/analysis/data/dto/long_term_recommendation_dto.dart';
import 'package:dhan_sanket/features/analysis/data/repositories/analysis_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAnalysisRemoteDataSource extends Mock implements AnalysisRemoteDataSource {}

void main() {
  late MockAnalysisRemoteDataSource remote;
  late AnalysisRepositoryImpl repository;

  setUp(() {
    remote = MockAnalysisRemoteDataSource();
    repository = AnalysisRepositoryImpl(remote);
  });

  test('getIntraday maps DTOs to entities', () async {
    when(
      () => remote.getIntraday(
        limit: any(named: 'limit'),
        minConfidence: any(named: 'minConfidence'),
      ),
    ).thenAnswer(
      (_) async => [
        IntradayRecommendationDto(
          symbol: 'RELIANCE',
          name: 'Reliance Industries',
          asOf: DateTime(2026, 1, 1),
          signal: 'BUY',
          confidence: Decimal.parse('75'),
          entryPrice: Decimal.parse('2500'),
          targetPrice: Decimal.parse('2600'),
          stopLoss: Decimal.parse('2450'),
          reasoning: const ['RSI oversold'],
        ),
      ],
    );

    final result = await repository.getIntraday();

    expect(result, isA<Success>());
    final recommendations = (result as Success).data;
    expect(recommendations.single.symbol, 'RELIANCE');
    expect(recommendations.single.signal, 'BUY');
  });

  test('getIntraday maps a DioException to an Error result', () async {
    when(
      () => remote.getIntraday(
        limit: any(named: 'limit'),
        minConfidence: any(named: 'minConfidence'),
      ),
    ).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/analysis/intraday'),
        type: DioExceptionType.connectionError,
      ),
    );

    final result = await repository.getIntraday();

    expect(result, isA<Error>());
  });

  test('getLongTerm maps DTOs to entities', () async {
    when(
      () => remote.getLongTerm(
        limit: any(named: 'limit'),
        minConfidence: any(named: 'minConfidence'),
        tenure: any(named: 'tenure'),
      ),
    ).thenAnswer(
      (_) async => [
        LongTermRecommendationDto(
          symbol: 'TCS',
          name: 'Tata Consultancy Services',
          asOf: DateTime(2026, 1, 1),
          signal: 'BUY',
          confidence: 80,
          riskLevel: 'Low',
          growthPotential: 'High',
          investmentTenure: '1 Year',
          reasoning: const ['Strong fundamentals'],
        ),
      ],
    );

    final result = await repository.getLongTerm();

    expect(result, isA<Success>());
    final recommendations = (result as Success).data;
    expect(recommendations.single.symbol, 'TCS');
    expect(recommendations.single.investmentTenure, '1 Year');
  });

  test('getLongTerm maps a DioException to an Error result', () async {
    when(
      () => remote.getLongTerm(
        limit: any(named: 'limit'),
        minConfidence: any(named: 'minConfidence'),
        tenure: any(named: 'tenure'),
      ),
    ).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/analysis/long-term'),
        type: DioExceptionType.connectionError,
      ),
    );

    final result = await repository.getLongTerm();

    expect(result, isA<Error>());
  });
}
