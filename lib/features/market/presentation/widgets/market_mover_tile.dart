import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/entities/market_mover.dart';
import '../../../../core/router/route_paths.dart';
import '../../../../core/theme/app_colors.dart';

class MarketMoverTile extends StatelessWidget {
  final MarketMover mover;

  const MarketMoverTile({super.key, required this.mover});

  @override
  Widget build(BuildContext context) {
    final changePercent = mover.changePercent;
    final isPositive = changePercent != null && changePercent >= Decimal.zero;
    final color = changePercent == null
        ? AppColors.neutralChange(context)
        : (isPositive ? AppColors.positiveChange(context) : AppColors.negativeChange(context));
    return ListTile(
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
      onTap: () => context.push(RoutePaths.stockDetail(mover.symbol)),
    );
  }
}
