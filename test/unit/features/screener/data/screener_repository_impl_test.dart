import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/screener/data/datasources/screener_remote_data_source.dart';
import 'package:dhan_sanket/features/screener/data/dto/screener_request_dto.dart';
import 'package:dhan_sanket/features/screener/data/dto/screener_result_dto.dart';
import 'package:dhan_sanket/features/screener/data/repositories/screener_repository_impl.dart';
import 'package:dhan_sanket/features/screener/domain/entities/screener_filter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockScreenerRemoteDataSource extends Mock implements ScreenerRemoteDataSource {}

void main() {
  late MockScreenerRemoteDataSource remote;
  late ScreenerRepositoryImpl repository;

  setUpAll(() {
    registerFallbackValue(const ScreenerRequestDto());
  });

  setUp(() {
    remote = MockScreenerRemoteDataSource();
    repository = ScreenerRepositoryImpl(remote);
  });

  test('screen forwards the filter and maps results', () async {
    when(() => remote.screen(any())).thenAnswer(
      (_) async => [
        ScreenerResultDto(
          symbol: 'RELIANCE',
          name: 'Reliance Industries',
          asOf: DateTime(2026, 1, 1),
          close: Decimal.fromInt(1300),
          volume: 1000,
          rsi14: Decimal.parse('28'),
          sma50: Decimal.fromInt(1250),
          sma200: Decimal.fromInt(1200),
        ),
      ],
    );

    final result = await repository.screen(const ScreenerFilter(rsiBelow: null));

    expect(result, isA<Success>());
    final results = (result as Success).data;
    expect(results.single.symbol, 'RELIANCE');
    expect(results.single.rsi14, Decimal.parse('28'));
  });

  test('screen maps a DioException to an Error result', () async {
    when(() => remote.screen(any())).thenThrow(DioException(requestOptions: RequestOptions(path: '/screener')));

    final result = await repository.screen(const ScreenerFilter());

    expect(result, isA<Error>());
  });
}
