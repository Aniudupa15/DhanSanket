import 'package:decimal/decimal.dart';

import 'alert_status.dart';
import 'alert_type.dart';

class Alert {
  final String id;
  final String symbol;
  final AlertType alertType;
  final Map<String, Decimal> condition;
  final AlertStatus status;
  final DateTime createdAt;
  final DateTime? triggeredAt;

  const Alert({
    required this.id,
    required this.symbol,
    required this.alertType,
    required this.condition,
    required this.status,
    required this.createdAt,
    required this.triggeredAt,
  });
}
