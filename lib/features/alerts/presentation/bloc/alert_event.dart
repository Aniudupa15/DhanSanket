import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/alert_type.dart';

sealed class AlertEvent extends Equatable {
  const AlertEvent();

  @override
  List<Object?> get props => [];
}

class AlertsRequested extends AlertEvent {
  const AlertsRequested();
}

class AlertCreateRequested extends AlertEvent {
  final String symbol;
  final AlertType alertType;
  final Map<String, Decimal> condition;

  const AlertCreateRequested({required this.symbol, required this.alertType, required this.condition});

  @override
  List<Object?> get props => [symbol, alertType, condition];
}

class AlertDeleteRequested extends AlertEvent {
  final String id;

  const AlertDeleteRequested(this.id);

  @override
  List<Object?> get props => [id];
}
