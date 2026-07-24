import 'package:decimal/decimal.dart';

import '../../../../core/error/result.dart';
import '../entities/alert.dart';
import '../entities/alert_status.dart';
import '../entities/alert_type.dart';

abstract class AlertRepository {
  Future<Result<List<Alert>>> list({AlertStatus? status});
  Future<Result<Alert>> create({
    required String symbol,
    required AlertType alertType,
    required Map<String, Decimal> condition,
  });
  Future<Result<void>> delete(String id);
}
