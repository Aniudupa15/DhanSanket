import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/screener_request_dto.dart';
import '../dto/screener_result_dto.dart';

class ScreenerRemoteDataSource {
  final Dio _dio;

  ScreenerRemoteDataSource(this._dio);

  Future<List<ScreenerResultDto>> screen(ScreenerRequestDto request) async {
    final response = await _dio.post<List<dynamic>>(ApiEndpoints.screener, data: request.toJson());
    return response.data!.map((e) => ScreenerResultDto.fromJson(e as Map<String, dynamic>)).toList();
  }
}
