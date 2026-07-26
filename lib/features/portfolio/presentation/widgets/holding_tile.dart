import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_trend_badge.dart';
import '../../domain/entities/holding.dart';

class HoldingTile extends StatelessWidget {
  final Holding holding;

  const HoldingTile({super.key, required this.holding});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pnlPercent = holding.pnlPercent != null ? (double.tryParse(holding.pnlPercent.toString()) ?? 0.0) : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        margin: EdgeInsets.zero,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: theme.colorScheme.secondaryContainer,
            child: Text(
              holding.symbol.length > 2 ? holding.symbol.substring(0, 2) : holding.symbol,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          title: Text(holding.symbol, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
          subtitle: Text(
            '${holding.quantity} qty • Avg ₹${holding.avgPrice}',
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                holding.currentValue != null ? '₹${holding.currentValue}' : '—',
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              if (pnlPercent != null)
                AppTrendBadge(
                  changePercent: pnlPercent,
                  valueText: '${holding.pnl != null && holding.pnl! >= Decimal.zero ? '+' : ''}₹${holding.pnl}',
                )
              else
                Text('—', style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
