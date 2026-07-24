import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/heatmap_dto.dart';
import '../dto/market_mover_dto.dart';

class MarketRemoteDataSource {
  final Dio _dio;

  MarketRemoteDataSource(this._dio);

  Future<List<MarketMoverDto>> getGainers({required String period, required int limit}) =>
      _getMovers(ApiEndpoints.marketGainers, period: period, limit: limit);

  Future<List<MarketMoverDto>> getLosers({required String period, required int limit}) =>
      _getMovers(ApiEndpoints.marketLosers, period: period, limit: limit);

  Future<List<MarketMoverDto>> getMostActive({required int limit}) =>
      _getMovers(ApiEndpoints.marketMostActive, limit: limit);

  Future<List<MarketMoverDto>> get52WeekHigh({required int limit}) =>
      _getMovers(ApiEndpoints.market52WeekHigh, limit: limit);

  Future<List<MarketMoverDto>> get52WeekLow({required int limit}) =>
      _getMovers(ApiEndpoints.market52WeekLow, limit: limit);

  Future<List<MarketMoverDto>> _getMovers(String path, {String? period, required int limit}) async {
    final response = await _dio.get<List<dynamic>>(
      path,
      queryParameters: {if (period != null) 'period': period, 'limit': limit},
    );
    return response.data!.map((e) => MarketMoverDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<HeatmapDto> getHeatmap({required int limit}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.marketHeatmap,
      queryParameters: {'limit': limit},
    );
    return HeatmapDto.fromJson(response.data!);
  }
}
