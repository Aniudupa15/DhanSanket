import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/stocks/data/datasources/stock_remote_data_source.dart';
import 'package:dhan_sanket/features/stocks/data/dto/instrument_type_dto.dart';
import 'package:dhan_sanket/features/stocks/data/dto/search_history_entry_dto.dart';
import 'package:dhan_sanket/features/stocks/data/dto/stock_detail_dto.dart';
import 'package:dhan_sanket/features/stocks/data/dto/stock_search_result_dto.dart';
import 'package:dhan_sanket/features/stocks/data/repositories/stock_repository_impl.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/instrument_type.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStockRemoteDataSource extends Mock implements StockRemoteDataSource {}

void main() {
  late MockStockRemoteDataSource remote;
  late StockRepositoryImpl repository;

  setUp(() {
    remote = MockStockRemoteDataSource();
    repository = StockRepositoryImpl(remote);
  });

  group('search', () {
    test('maps search results, including the instrument type enum', () async {
      when(() => remote.search(any(), limit: any(named: 'limit'))).thenAnswer(
        (_) async => [
          const StockSearchResultDto(
            symbol: 'RELIANCE',
            name: 'Reliance Industries',
            isin: 'INE002A01018',
            series: 'EQ',
            instrumentType: InstrumentTypeDto.equity,
          ),
        ],
      );

      final result = await repository.search('reliance');

      expect(result, isA<Success>());
      final results = (result as Success).data;
      expect(results.single.symbol, 'RELIANCE');
      expect(results.single.instrumentType, InstrumentType.equity);
    });

    test('maps a DioException to an Error result', () async {
      when(() => remote.search(any(), limit: any(named: 'limit'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/stocks/search'),
          type: DioExceptionType.connectionError,
        ),
      );

      final result = await repository.search('reliance');

      expect(result, isA<Error>());
    });
  });

  group('getDetail', () {
    test('maps a stock detail response with a null quote gracefully', () async {
      when(() => remote.getDetail(any())).thenAnswer(
        (_) async => const StockDetailDto(
          symbol: 'TCS',
          isin: null,
          name: 'Tata Consultancy Services',
          series: 'EQ',
          sector: null,
          industry: null,
          instrumentType: InstrumentTypeDto.equity,
          listingDate: null,
          faceValue: null,
          quote: null,
          quoteUnavailableReason: 'NSE unavailable',
        ),
      );

      final result = await repository.getDetail('TCS');

      expect(result, isA<Success>());
      final detail = (result as Success).data;
      expect(detail.symbol, 'TCS');
      expect(detail.quote, isNull);
      expect(detail.quoteUnavailableReason, 'NSE unavailable');
    });
  });

  group('search history', () {
    test('getSearchHistory maps entries', () async {
      when(
        () => remote.getSearchHistory(),
      ).thenAnswer((_) async => [SearchHistoryEntryDto(query: 'reliance', searchedAt: DateTime(2026, 1, 1))]);

      final result = await repository.getSearchHistory();

      expect(result, isA<Success>());
      final entries = (result as Success).data;
      expect(entries.single.query, 'reliance');
    });

    test('clearSearchHistory maps a DioException to an Error result', () async {
      when(() => remote.clearSearchHistory()).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/search-history'),
          type: DioExceptionType.connectionError,
        ),
      );

      final result = await repository.clearSearchHistory();

      expect(result, isA<Error>());
    });
  });
}
