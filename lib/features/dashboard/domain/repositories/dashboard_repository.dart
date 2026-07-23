import '../../../../core/error/result.dart';
import '../entities/dashboard_snapshot.dart';

abstract class DashboardRepository {
  Future<Result<DashboardSnapshot>> getDashboard();
}
