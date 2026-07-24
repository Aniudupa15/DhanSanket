import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/alert_type.dart';

typedef CreateAlertResult = ({String symbol, AlertType alertType, Map<String, Decimal> condition});

/// Returns the entered alert spec, or null if the user cancelled.
Future<CreateAlertResult?> showCreateAlertDialog(BuildContext context) {
  return showDialog<CreateAlertResult>(context: context, builder: (context) => const _CreateAlertDialog());
}

class _CreateAlertDialog extends StatefulWidget {
  const _CreateAlertDialog();

  @override
  State<_CreateAlertDialog> createState() => _CreateAlertDialogState();
}

class _CreateAlertDialogState extends State<_CreateAlertDialog> {
  final _symbolController = TextEditingController();
  final _valueController = TextEditingController();
  AlertType _alertType = AlertType.priceAbove;

  @override
  void dispose() {
    _symbolController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void _submit() {
    final symbol = _symbolController.text.trim().toUpperCase();
    if (symbol.isEmpty) return;
    final conditionKey = _alertType.conditionKey;
    final condition = <String, Decimal>{};
    if (conditionKey != null) {
      final value = Decimal.tryParse(_valueController.text.trim());
      if (value == null) return;
      condition[conditionKey] = value;
    }
    Navigator.of(context).pop((symbol: symbol, alertType: _alertType, condition: condition));
  }

  String _labelFor(AlertType type) {
    return switch (type) {
      AlertType.priceAbove => 'Price above',
      AlertType.priceBelow => 'Price below',
      AlertType.percentChangeAbove => 'Percent change above',
      AlertType.percentChangeBelow => 'Percent change below',
      AlertType.rsiAbove => 'RSI above',
      AlertType.rsiBelow => 'RSI below',
      AlertType.volumeSpike => 'Volume spike (x normal)',
      AlertType.new52WeekHigh => 'New 52-week high',
      AlertType.new52WeekLow => 'New 52-week low',
    };
  }

  @override
  Widget build(BuildContext context) {
    final needsValue = _alertType.conditionKey != null;
    return AlertDialog(
      title: const Text('New alert'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _symbolController,
            autofocus: true,
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(labelText: 'Symbol (e.g. RELIANCE)'),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<AlertType>(
            initialValue: _alertType,
            decoration: const InputDecoration(labelText: 'Alert type'),
            items: [for (final type in AlertType.values) DropdownMenuItem(value: type, child: Text(_labelFor(type)))],
            onChanged: (value) {
              if (value != null) setState(() => _alertType = value);
            },
          ),
          if (needsValue) ...[
            const SizedBox(height: 12),
            TextField(
              controller: _valueController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: _labelFor(_alertType)),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
        FilledButton(onPressed: _submit, child: const Text('Create')),
      ],
    );
  }
}
