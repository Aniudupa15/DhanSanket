import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Reused for both the intraday and long-term signal sections - the two
/// backend signals have different extra fields (entry/target/stop-loss vs
/// investment horizon/risk level/strengths/weaknesses), so this widget only
/// owns the common chrome (title, signal badge, reasoning list, disclaimer)
/// and takes the signal-specific rows as [extra].
class SignalCard extends StatelessWidget {
  final String title;
  final String signal;
  final String confidenceLabel;
  final List<Widget> extra;
  final List<String> reasoning;
  final String disclaimer;

  const SignalCard({
    super.key,
    required this.title,
    required this.signal,
    required this.confidenceLabel,
    this.extra = const [],
    required this.reasoning,
    required this.disclaimer,
  });

  Color _signalColor(BuildContext context) {
    switch (signal.toUpperCase()) {
      case 'BUY':
        return AppColors.positiveChange(context);
      case 'SELL':
      case 'AVOID':
        return AppColors.negativeChange(context);
      default:
        return AppColors.neutralChange(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Chip(
                  label: Text(
                    signal,
                    style: TextStyle(color: _signalColor(context), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Text(confidenceLabel, style: Theme.of(context).textTheme.bodyMedium),
            if (extra.isNotEmpty) ...[const SizedBox(height: 8), ...extra],
            if (reasoning.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text('Reasoning', style: Theme.of(context).textTheme.labelLarge),
              ...reasoning.map((line) => Text('- $line', style: Theme.of(context).textTheme.bodyMedium)),
            ],
            const SizedBox(height: 12),
            Text(
              disclaimer,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.outline),
            ),
          ],
        ),
      ),
    );
  }
}
