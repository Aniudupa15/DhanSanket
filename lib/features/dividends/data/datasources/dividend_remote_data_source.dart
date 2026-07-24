import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/dividend_recommendation_dto.dart';

class DividendRemoteDataSource {
  final Dio _dio;

  DividendRemoteDataSource(this._dio);

  Future<List<DividendRecommendationDto>> list({
    required bool upcoming,
    required String sort,
    required int limit,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.dividends,
      queryParameters: {'upcoming': upcoming, 'sort': sort, 'limit': limit},
    );
    return response.data!.map((e) => DividendRecommendationDto.fromJson(e as Map<String, dynamic>)).toList();
  }
}
