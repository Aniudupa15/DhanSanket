import 'package:flutter/material.dart';

import '../../domain/entities/alert.dart';
import '../../domain/entities/alert_status.dart';
import '../../domain/entities/alert_type.dart';

class AlertTile extends StatelessWidget {
  final Alert alert;
  final VoidCallback onDelete;

  const AlertTile({super.key, required this.alert, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${alert.symbol} · ${_labelFor(alert.alertType)}'),
      subtitle: Text('${_conditionText()} · ${_statusText(alert.status)}'),
      trailing: IconButton(icon: const Icon(Icons.delete_outline), tooltip: 'Delete alert', onPressed: onDelete),
    );
  }

  String _conditionText() {
    if (alert.condition.isEmpty) return 'No condition needed';
    return alert.condition.entries.map((e) => '${e.key}: ${e.value}').join(', ');
  }

  String _statusText(AlertStatus status) {
    return switch (status) {
      AlertStatus.active => 'Active',
      AlertStatus.triggered => 'Triggered',
      AlertStatus.cancelled => 'Cancelled',
    };
  }

  String _labelFor(AlertType type) {
    return switch (type) {
      AlertType.priceAbove => 'Price above',
      AlertType.priceBelow => 'Price below',
      AlertType.percentChangeAbove => 'Percent change above',
      AlertType.percentChangeBelow => 'Percent change below',
      AlertType.rsiAbove => 'RSI above',
      AlertType.rsiBelow => 'RSI below',
      AlertType.volumeSpike => 'Volume spike',
      AlertType.new52WeekHigh => 'New 52-week high',
      AlertType.new52WeekLow => 'New 52-week low',
    };
  }
}
