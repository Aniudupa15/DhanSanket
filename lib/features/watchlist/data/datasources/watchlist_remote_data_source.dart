import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/watchlist_detail_dto.dart';
import '../dto/watchlist_dto.dart';

class WatchlistRemoteDataSource {
  final Dio _dio;

  WatchlistRemoteDataSource(this._dio);

  Future<List<WatchlistDto>> list() async {
    final response = await _dio.get<List<dynamic>>(ApiEndpoints.watchlists);
    return response.data!.map((e) => WatchlistDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<WatchlistDto> create(String name) async {
    final response = await _dio.post<Map<String, dynamic>>(ApiEndpoints.watchlists, data: {'name': name});
    return WatchlistDto.fromJson(response.data!);
  }

  Future<void> delete(String id) async {
    await _dio.delete<void>(ApiEndpoints.watchlistDetail(id));
  }

  Future<WatchlistDetailDto> getDetail(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.watchlistDetail(id));
    return WatchlistDetailDto.fromJson(response.data!);
  }

  Future<WatchlistDetailDto> addItem(String id, String symbol) async {
    final response = await _dio.post<Map<String, dynamic>>(ApiEndpoints.watchlistItems(id), data: {'symbol': symbol});
    return WatchlistDetailDto.fromJson(response.data!);
  }

  Future<WatchlistDetailDto> removeItem(String id, String symbol) async {
    final response = await _dio.delete<Map<String, dynamic>>(ApiEndpoints.watchlistItem(id, symbol));
    return WatchlistDetailDto.fromJson(response.data!);
  }
}
