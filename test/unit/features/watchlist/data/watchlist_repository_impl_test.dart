import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/watchlist/data/datasources/watchlist_remote_data_source.dart';
import 'package:dhan_sanket/features/watchlist/data/dto/watchlist_detail_dto.dart';
import 'package:dhan_sanket/features/watchlist/data/dto/watchlist_dto.dart';
import 'package:dhan_sanket/features/watchlist/data/dto/watchlist_item_dto.dart';
import 'package:dhan_sanket/features/watchlist/data/repositories/watchlist_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWatchlistRemoteDataSource extends Mock implements WatchlistRemoteDataSource {}

void main() {
  late MockWatchlistRemoteDataSource remote;
  late WatchlistRepositoryImpl repository;

  setUp(() {
    remote = MockWatchlistRemoteDataSource();
    repository = WatchlistRepositoryImpl(remote);
  });

  test('list maps watchlists correctly', () async {
    when(
      () => remote.list(),
    ).thenAnswer((_) async => [WatchlistDto(id: 'w1', name: 'Tech', createdAt: DateTime(2026, 1, 1), itemCount: 3)]);

    final result = await repository.list();

    expect(result, isA<Success>());
    final watchlists = (result as Success).data;
    expect(watchlists.single.name, 'Tech');
    expect(watchlists.single.itemCount, 3);
  });

  test('getDetail maps items with nullable Decimal fields', () async {
    when(() => remote.getDetail(any())).thenAnswer(
      (_) async => WatchlistDetailDto(
        id: 'w1',
        name: 'Tech',
        createdAt: DateTime(2026, 1, 1),
        items: [
          WatchlistItemDto(
            symbol: 'RELIANCE',
            name: 'Reliance Industries',
            addedAt: DateTime(2026, 1, 2),
            lastPrice: null,
            change: null,
            changePercent: null,
          ),
        ],
      ),
    );

    final result = await repository.getDetail('w1');

    expect(result, isA<Success>());
    final detail = (result as Success).data;
    expect(detail.items.single.symbol, 'RELIANCE');
    expect(detail.items.single.lastPrice, isNull);
  });

  test('delete maps a DioException to an Error result', () async {
    when(() => remote.delete(any())).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/watchlists/w1'),
        type: DioExceptionType.connectionError,
      ),
    );

    final result = await repository.delete('w1');

    expect(result, isA<Error>());
  });
}
