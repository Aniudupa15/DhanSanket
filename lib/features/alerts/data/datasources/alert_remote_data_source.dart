import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/alert_dto.dart';

class AlertRemoteDataSource {
  final Dio _dio;

  AlertRemoteDataSource(this._dio);

  Future<List<AlertDto>> list({AlertStatusDto? status}) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.alerts,
      queryParameters: {if (status != null) 'status': _statusToQueryValue(status)},
    );
    return response.data!.map((e) => AlertDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<AlertDto> create({
    required String symbol,
    required String alertType,
    required Map<String, String> condition,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.alerts,
      data: {'symbol': symbol, 'alert_type': alertType, 'condition': condition},
    );
    return AlertDto.fromJson(response.data!);
  }

  Future<void> delete(String id) => _dio.delete(ApiEndpoints.alertDetail(id));

  String _statusToQueryValue(AlertStatusDto status) {
    return switch (status) {
      AlertStatusDto.active => 'ACTIVE',
      AlertStatusDto.triggered => 'TRIGGERED',
      AlertStatusDto.cancelled => 'CANCELLED',
    };
  }
}
