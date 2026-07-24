import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/dividends/data/datasources/dividend_remote_data_source.dart';
import 'package:dhan_sanket/features/dividends/data/dto/dividend_recommendation_dto.dart';
import 'package:dhan_sanket/features/dividends/data/repositories/dividend_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDividendRemoteDataSource extends Mock implements DividendRemoteDataSource {}

void main() {
  late MockDividendRemoteDataSource remote;
  late DividendRepositoryImpl repository;

  setUp(() {
    remote = MockDividendRemoteDataSource();
    repository = DividendRepositoryImpl(remote);
  });

  test('list maps DTOs to entities', () async {
    when(
      () => remote.list(
        upcoming: any(named: 'upcoming'),
        sort: any(named: 'sort'),
        limit: any(named: 'limit'),
      ),
    ).thenAnswer(
      (_) async => [
        DividendRecommendationDto(
          symbol: 'RELIANCE',
          name: 'Reliance Industries',
          dividendYield: Decimal.parse('2.5'),
          dividendAmount: Decimal.parse('10.0'),
          exDividendDate: DateTime(2026, 2, 1),
          buyBeforeDate: DateTime(2026, 1, 31),
          recommendation: 'Hold',
          riskLevel: 'Low',
          confidence: 80,
        ),
      ],
    );

    final result = await repository.list();

    expect(result, isA<Success>());
    final recommendations = (result as Success).data;
    expect(recommendations.single.symbol, 'RELIANCE');
    expect(recommendations.single.dividendYield, Decimal.parse('2.5'));
    expect(recommendations.single.recommendation, 'Hold');
  });

  test('list maps a DioException to an Error result', () async {
    when(
      () => remote.list(
        upcoming: any(named: 'upcoming'),
        sort: any(named: 'sort'),
        limit: any(named: 'limit'),
      ),
    ).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/dividends'),
        type: DioExceptionType.connectionError,
      ),
    );

    final result = await repository.list();

    expect(result, isA<Error>());
  });
}
