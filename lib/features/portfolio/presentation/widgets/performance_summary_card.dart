import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/portfolio_performance.dart';

class PerformanceSummaryCard extends StatelessWidget {
  final PortfolioPerformance performance;

  const PerformanceSummaryCard({super.key, required this.performance});

  @override
  Widget build(BuildContext context) {
    final isPositive = performance.totalPnl >= Decimal.zero;
    final color = isPositive ? AppColors.positiveChange(context) : AppColors.negativeChange(context);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Performance', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            _row(context, 'Invested', performance.totalInvested.toString()),
            _row(context, 'Current Value', performance.currentValue.toString()),
            _row(
              context,
              'P&L',
              '${isPositive ? '+' : ''}${performance.totalPnl} (${performance.totalPnlPercent ?? 'N/A'}%)',
              color: color,
            ),
            _row(context, 'XIRR', performance.xirrPercent != null ? '${performance.xirrPercent}%' : 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _row(BuildContext context, String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color)),
        ],
      ),
    );
  }
}
