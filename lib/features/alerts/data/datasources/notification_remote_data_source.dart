import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/notification_dto.dart';

class NotificationRemoteDataSource {
  final Dio _dio;

  NotificationRemoteDataSource(this._dio);

  Future<List<NotificationDto>> list({required bool unreadOnly, required int limit, required int offset}) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.notifications,
      queryParameters: {'unread_only': unreadOnly, 'limit': limit, 'offset': offset},
    );
    return response.data!.map((e) => NotificationDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> markRead(String id) => _dio.post(ApiEndpoints.notificationRead(id));
}
