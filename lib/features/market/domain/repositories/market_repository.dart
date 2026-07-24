import '../../../../core/entities/market_mover.dart';
import '../../../../core/error/result.dart';
import '../entities/heatmap.dart';
import '../entities/mover_category.dart';

abstract class MarketRepository {
  Future<Result<List<MarketMover>>> getMovers(MoverCategory category, {String period = '1D', int limit = 20});
  Future<Result<Heatmap>> getHeatmap({int limit = 100});
}
