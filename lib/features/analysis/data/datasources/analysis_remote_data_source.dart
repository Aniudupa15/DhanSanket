import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/intraday_recommendation_dto.dart';
import '../dto/long_term_recommendation_dto.dart';

class AnalysisRemoteDataSource {
  final Dio _dio;

  AnalysisRemoteDataSource(this._dio);

  Future<List<IntradayRecommendationDto>> getIntraday({required int limit, required num minConfidence}) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.analysisIntraday,
      queryParameters: {'limit': limit, 'min_confidence': minConfidence},
    );
    return response.data!.map((e) => IntradayRecommendationDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<LongTermRecommendationDto>> getLongTerm({
    required int limit,
    required int minConfidence,
    String? tenure,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.analysisLongTerm,
      queryParameters: {'limit': limit, 'min_confidence': minConfidence, if (tenure != null) 'tenure': tenure},
    );
    return response.data!.map((e) => LongTermRecommendationDto.fromJson(e as Map<String, dynamic>)).toList();
  }
}
