import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/comparison_dto.dart';

class ComparisonRemoteDataSource {
  final Dio _dio;

  ComparisonRemoteDataSource(this._dio);

  Future<ComparisonDto> compare(List<String> symbols) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.stockCompare,
      queryParameters: {'symbols': symbols.join(',')},
    );
    return ComparisonDto.fromJson(response.data!);
  }
}
