import '../../../../core/error/result.dart';
import '../entities/app_notification.dart';

abstract class NotificationRepository {
  Future<Result<List<AppNotification>>> list({bool unreadOnly = false, int limit = 20, int offset = 0});
  Future<Result<void>> markRead(String id);
}
