import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/compare/data/datasources/comparison_remote_data_source.dart';
import 'package:dhan_sanket/features/compare/data/dto/comparison_dto.dart';
import 'package:dhan_sanket/features/compare/data/repositories/comparison_repository_impl.dart';
import 'package:dhan_sanket/features/stocks/data/dto/fundamentals_dto.dart';
import 'package:dhan_sanket/features/stocks/data/dto/indicators_dto.dart';
import 'package:dhan_sanket/features/stocks/data/dto/instrument_type_dto.dart';
import 'package:dhan_sanket/features/stocks/data/dto/stock_detail_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockComparisonRemoteDataSource extends Mock implements ComparisonRemoteDataSource {}

void main() {
  late MockComparisonRemoteDataSource remote;
  late ComparisonRepositoryImpl repository;

  setUp(() {
    remote = MockComparisonRemoteDataSource();
    repository = ComparisonRepositoryImpl(remote);
  });

  test('compare maps every entry (detail/indicators/fundamentals) to entities', () async {
    when(() => remote.compare(any())).thenAnswer(
      (_) async => ComparisonDto(
        entries: [
          ComparisonEntryDto(
            detail: StockDetailDto(
              symbol: 'RELIANCE',
              name: 'Reliance Industries',
              instrumentType: InstrumentTypeDto.equity,
            ),
            indicators: const IndicatorsDto(symbol: 'RELIANCE'),
            fundamentals: const FundamentalsDto(symbol: 'RELIANCE'),
          ),
          ComparisonEntryDto(
            detail: StockDetailDto(
              symbol: 'TCS',
              name: 'Tata Consultancy Services',
              instrumentType: InstrumentTypeDto.equity,
            ),
            indicators: IndicatorsDto(symbol: 'TCS', rsi14: Decimal.parse('55.5')),
            fundamentals: const FundamentalsDto(symbol: 'TCS'),
          ),
        ],
      ),
    );

    final result = await repository.compare(['RELIANCE', 'TCS']);

    expect(result, isA<Success>());
    final entries = (result as Success).data;
    expect(entries.length, 2);
    expect(entries.first.detail.symbol, 'RELIANCE');
    expect(entries.last.indicators.rsi14, Decimal.parse('55.5'));
  });

  test('compare maps a DioException to an Error result', () async {
    when(() => remote.compare(any())).thenThrow(DioException(requestOptions: RequestOptions(path: '/stocks/compare')));

    final result = await repository.compare(['RELIANCE', 'TCS']);

    expect(result, isA<Error>());
  });
}
