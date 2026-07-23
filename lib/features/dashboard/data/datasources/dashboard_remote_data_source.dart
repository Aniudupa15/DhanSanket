import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/dashboard_dto.dart';

class DashboardRemoteDataSource {
  final Dio _dio;

  DashboardRemoteDataSource(this._dio);

  Future<DashboardDto> getDashboard() async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.dashboard);
    return DashboardDto.fromJson(response.data!);
  }
}
