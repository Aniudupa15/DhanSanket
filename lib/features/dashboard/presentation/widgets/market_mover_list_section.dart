import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../core/entities/market_mover.dart';
import '../../../../core/theme/app_colors.dart';

/// Reused for gainers/losers/most-active/52w-high/52w-low - only the title
/// and data differ.
class MarketMoverListSection extends StatelessWidget {
  final String title;
  final List<MarketMover> movers;
  final VoidCallback? onSeeAll;

  const MarketMoverListSection({super.key, required this.title, required this.movers, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    if (movers.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              if (onSeeAll != null) TextButton(onPressed: onSeeAll, child: const Text('See all')),
            ],
          ),
          const SizedBox(height: 8),
          ...movers.map((mover) {
            final changePercent = mover.changePercent;
            final isPositive = changePercent != null && changePercent >= Decimal.zero;
            final color = changePercent == null
                ? AppColors.neutralChange(context)
                : (isPositive ? AppColors.positiveChange(context) : AppColors.negativeChange(context));
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(mover.symbol),
              subtitle: Text(mover.name, maxLines: 1, overflow: TextOverflow.ellipsis),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(mover.lastPrice.toString()),
                  Text(
                    changePercent != null ? '${isPositive ? '+' : ''}$changePercent%' : '—',
                    style: TextStyle(color: color, fontSize: 12),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
