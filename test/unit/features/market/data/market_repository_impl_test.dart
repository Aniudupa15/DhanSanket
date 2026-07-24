import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/market/data/datasources/market_remote_data_source.dart';
import 'package:dhan_sanket/features/market/data/dto/heatmap_dto.dart';
import 'package:dhan_sanket/features/market/data/dto/market_mover_dto.dart';
import 'package:dhan_sanket/features/market/data/repositories/market_repository_impl.dart';
import 'package:dhan_sanket/features/market/domain/entities/heatmap_bucket.dart';
import 'package:dhan_sanket/features/market/domain/entities/mover_category.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMarketRemoteDataSource extends Mock implements MarketRemoteDataSource {}

void main() {
  late MockMarketRemoteDataSource remote;
  late MarketRepositoryImpl repository;

  setUp(() {
    remote = MockMarketRemoteDataSource();
    repository = MarketRepositoryImpl(remote);
  });

  test('getMovers dispatches gainers to the correct datasource method and maps the result', () async {
    when(
      () => remote.getGainers(
        period: any(named: 'period'),
        limit: any(named: 'limit'),
      ),
    ).thenAnswer(
      (_) async => [
        MarketMoverDto(
          symbol: 'RELIANCE',
          name: 'Reliance Industries',
          lastPrice: Decimal.fromInt(1300),
          change: Decimal.fromInt(10),
          changePercent: Decimal.parse('0.8'),
          volume: 1000,
        ),
      ],
    );

    final result = await repository.getMovers(MoverCategory.gainers);

    expect(result, isA<Success>());
    final movers = (result as Success).data;
    expect(movers.single.symbol, 'RELIANCE');
    verify(
      () => remote.getGainers(
        period: any(named: 'period'),
        limit: any(named: 'limit'),
      ),
    ).called(1);
  });

  test('getMovers maps a DioException to an Error result', () async {
    when(
      () => remote.getMostActive(limit: any(named: 'limit')),
    ).thenThrow(DioException(requestOptions: RequestOptions(path: '/market/most-active')));

    final result = await repository.getMovers(MoverCategory.mostActive);

    expect(result, isA<Error>());
  });

  test('getHeatmap maps tiles including the bucket enum and notes', () async {
    when(() => remote.getHeatmap(limit: any(named: 'limit'))).thenAnswer(
      (_) async => HeatmapDto(
        tiles: [
          HeatmapTileDto(
            symbol: 'RELIANCE',
            name: 'Reliance Industries',
            lastPrice: Decimal.fromInt(1300),
            changePercent: Decimal.parse('3.5'),
            volume: 1000,
            bucket: 'STRONG_GAIN',
          ),
        ],
        notes: const ['Bucketed by volume, not market cap.'],
      ),
    );

    final result = await repository.getHeatmap();

    expect(result, isA<Success>());
    final heatmap = (result as Success).data;
    expect(heatmap.tiles.single.bucket, HeatmapBucket.strongGain);
    expect(heatmap.notes.single, 'Bucketed by volume, not market cap.');
  });
}
