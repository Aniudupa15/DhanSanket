import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/app_notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_remote_data_source.dart';
import '../dto/notification_dto.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _remote;

  NotificationRepositoryImpl(this._remote);

  @override
  Future<Result<List<AppNotification>>> list({bool unreadOnly = false, int limit = 20, int offset = 0}) async {
    try {
      final dtos = await _remote.list(unreadOnly: unreadOnly, limit: limit, offset: offset);
      return Success(dtos.map(_toEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> markRead(String id) async {
    try {
      await _remote.markRead(id);
      return const Success(null);
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  AppNotification _toEntity(NotificationDto dto) {
    return AppNotification(
      id: dto.id,
      alertId: dto.alertId,
      title: dto.title,
      message: dto.message,
      createdAt: dto.createdAt,
      readAt: dto.readAt,
    );
  }
}
