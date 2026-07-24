import 'package:dio/dio.dart';

import '../../../../core/entities/market_mover.dart';
import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/heatmap.dart';
import '../../domain/entities/heatmap_bucket.dart';
import '../../domain/entities/heatmap_tile.dart';
import '../../domain/entities/mover_category.dart';
import '../../domain/repositories/market_repository.dart';
import '../datasources/market_remote_data_source.dart';
import '../dto/heatmap_dto.dart';
import '../dto/market_mover_dto.dart';

class MarketRepositoryImpl implements MarketRepository {
  final MarketRemoteDataSource _remote;

  MarketRepositoryImpl(this._remote);

  @override
  Future<Result<List<MarketMover>>> getMovers(MoverCategory category, {String period = '1D', int limit = 20}) async {
    try {
      final dtos = await switch (category) {
        MoverCategory.gainers => _remote.getGainers(period: period, limit: limit),
        MoverCategory.losers => _remote.getLosers(period: period, limit: limit),
        MoverCategory.mostActive => _remote.getMostActive(limit: limit),
        MoverCategory.fiftyTwoWeekHigh => _remote.get52WeekHigh(limit: limit),
        MoverCategory.fiftyTwoWeekLow => _remote.get52WeekLow(limit: limit),
      };
      return Success(dtos.map(_moverToEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<Heatmap>> getHeatmap({int limit = 100}) async {
    try {
      final dto = await _remote.getHeatmap(limit: limit);
      return Success(Heatmap(tiles: dto.tiles.map(_tileToEntity).toList(), notes: dto.notes));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  MarketMover _moverToEntity(MarketMoverDto dto) {
    return MarketMover(
      symbol: dto.symbol,
      name: dto.name,
      lastPrice: dto.lastPrice,
      change: dto.change,
      changePercent: dto.changePercent,
      volume: dto.volume,
    );
  }

  HeatmapTile _tileToEntity(HeatmapTileDto dto) {
    return HeatmapTile(
      symbol: dto.symbol,
      name: dto.name,
      lastPrice: dto.lastPrice,
      changePercent: dto.changePercent,
      volume: dto.volume,
      bucket: _bucketToEntity(dto.bucket),
    );
  }

  HeatmapBucket _bucketToEntity(String bucket) {
    return switch (bucket) {
      'STRONG_GAIN' => HeatmapBucket.strongGain,
      'GAIN' => HeatmapBucket.gain,
      'FLAT' => HeatmapBucket.flat,
      'LOSS' => HeatmapBucket.loss,
      'STRONG_LOSS' => HeatmapBucket.strongLoss,
      _ => HeatmapBucket.unknown,
    };
  }
}
