import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/entities/market_mover.dart';
import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_trend_badge.dart';

class MarketMoverTile extends StatelessWidget {
  final MarketMover mover;

  const MarketMoverTile({super.key, required this.mover});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final changePercent = mover.changePercent != null ? (double.tryParse(mover.changePercent.toString()) ?? 0.0) : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        margin: EdgeInsets.zero,
        child: ListTile(
          onTap: () => context.push(RoutePaths.stockDetail(mover.symbol)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Text(
              mover.symbol.length > 2 ? mover.symbol.substring(0, 2) : mover.symbol,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.colorScheme.onPrimaryContainer),
            ),
          ),
          title: Text(mover.symbol, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
          subtitle: Text(
            mover.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('₹${mover.lastPrice}', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 2),
              if (changePercent != null)
                AppTrendBadge(changePercent: changePercent)
              else
                Text('—', style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
