import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/holding.dart';

class HoldingTile extends StatelessWidget {
  final Holding holding;

  const HoldingTile({super.key, required this.holding});

  @override
  Widget build(BuildContext context) {
    final pnl = holding.pnl;
    final isPositive = pnl != null && pnl >= Decimal.zero;
    final color = pnl == null
        ? AppColors.neutralChange(context)
        : (isPositive ? AppColors.positiveChange(context) : AppColors.negativeChange(context));

    return ListTile(
      title: Text(holding.symbol),
      subtitle: Text('${holding.quantity} @ avg ${holding.avgPrice}'),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(holding.currentValue?.toString() ?? '—'),
          Text(
            pnl != null ? '${isPositive ? '+' : ''}$pnl (${holding.pnlPercent ?? '—'}%)' : 'N/A',
            style: TextStyle(color: color, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
