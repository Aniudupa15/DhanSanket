import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:dhan_sanket/features/dashboard/data/dto/dashboard_dto.dart';
import 'package:dhan_sanket/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDashboardRemoteDataSource extends Mock implements DashboardRemoteDataSource {}

void main() {
  late MockDashboardRemoteDataSource remote;
  late DashboardRepositoryImpl repository;

  setUp(() {
    remote = MockDashboardRemoteDataSource();
    repository = DashboardRepositoryImpl(remote);
  });

  test('maps an empty dashboard response into an empty snapshot, surfacing notes', () async {
    when(() => remote.getDashboard()).thenAnswer(
      (_) async => DashboardDto.fromJson({
        'market_status': [],
        'indices': [],
        'gainers': [],
        'losers': [],
        'most_active': [],
        'fifty_two_week_high': [],
        'fifty_two_week_low': [],
        'latest_news': [],
        'notes': ['Sector data is unavailable for all stocks.'],
      }),
    );

    final result = await repository.getDashboard();

    expect(result, isA<Success>());
    final snapshot = (result as Success).data;
    expect(snapshot.notes, ['Sector data is unavailable for all stocks.']);
    expect(snapshot.gainers, isEmpty);
  });

  test('maps a populated dashboard response, including Decimal string fields', () async {
    when(() => remote.getDashboard()).thenAnswer(
      (_) async => DashboardDto.fromJson({
        'market_status': [
          {'market': 'Capital Market', 'status': 'Open', 'as_of': '2026-07-23 09:15:00'},
        ],
        'indices': [
          {'index_name': 'NIFTY 50', 'last_price': '25000.50', 'change': '120.30', 'change_percent': '0.48'},
        ],
        'gainers': [
          {
            'symbol': 'RELIANCE',
            'name': 'Reliance Industries',
            'last_price': '3000.00',
            'change': '50.00',
            'change_percent': '1.69',
            'volume': 100000,
          },
        ],
        'losers': [],
        'most_active': [],
        'fifty_two_week_high': [],
        'fifty_two_week_low': [],
        'latest_news': [
          {
            'headline': 'Markets rally',
            'summary': null,
            'source': 'Test Source',
            'url': 'https://example.com',
            'category': 'MARKET',
            'related_symbols': ['RELIANCE'],
            'published_at': '2026-07-23T09:00:00Z',
          },
        ],
        'notes': [],
      }),
    );

    final result = await repository.getDashboard();

    expect(result, isA<Success>());
    final snapshot = (result as Success).data;
    expect(snapshot.marketStatus.single.market, 'Capital Market');
    expect(snapshot.indices.single.indexName, 'NIFTY 50');
    expect(snapshot.gainers.single.symbol, 'RELIANCE');
    expect(snapshot.latestNews.single.headline, 'Markets rally');
  });

  test('maps a DioException to an Error result', () async {
    when(() => remote.getDashboard()).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/dashboard'),
        type: DioExceptionType.connectionTimeout,
      ),
    );

    final result = await repository.getDashboard();

    expect(result, isA<Error>());
  });
}
