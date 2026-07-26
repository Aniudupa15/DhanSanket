import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/entities/market_mover.dart';
import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_trend_badge.dart';

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
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              if (onSeeAll != null)
                TextButton(
                  onPressed: onSeeAll,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('See all'),
                      Icon(Icons.chevron_right, size: 18),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          ...movers.map((mover) {
            final changePercent = mover.changePercent != null
                ? (double.tryParse(mover.changePercent.toString()) ?? 0.0)
                : 0.0;

            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => context.push(RoutePaths.stockDetail(mover.symbol)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Text(
                        mover.symbol.length > 2 ? mover.symbol.substring(0, 2) : mover.symbol,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mover.symbol,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            mover.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '₹${mover.lastPrice}',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 2),
                        if (mover.changePercent != null)
                          AppTrendBadge(changePercent: changePercent)
                        else
                          Text('—', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

