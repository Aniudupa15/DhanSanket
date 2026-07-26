import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_trend_badge.dart';
import '../../domain/entities/portfolio_performance.dart';

class PerformanceSummaryCard extends StatelessWidget {
  final PortfolioPerformance performance;

  const PerformanceSummaryCard({super.key, required this.performance});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pnlPercent = performance.totalPnlPercent != null
        ? (double.tryParse(performance.totalPnlPercent.toString()) ?? 0.0)
        : (performance.totalPnl >= Decimal.zero ? 0.0 : -0.0);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primaryContainer.withValues(alpha: 0.8),
            theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Portfolio Summary',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              AppTrendBadge(
                changePercent: pnlPercent,
                valueText: '${performance.totalPnl >= Decimal.zero ? '+' : ''}₹${performance.totalPnl}',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _metricBox(context, label: 'Invested', value: '₹${performance.totalInvested}'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _metricBox(
                  context,
                  label: 'Current Value',
                  value: '₹${performance.currentValue}',
                  highlight: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'XIRR Return',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              Text(
                performance.xirrPercent != null ? '${performance.xirrPercent}%' : 'N/A',
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metricBox(BuildContext context, {required String label, required String value, bool highlight = false}) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: highlight ? theme.colorScheme.primary : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
