import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/watchlist_item.dart';

class WatchlistItemTile extends StatelessWidget {
  final WatchlistItem item;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  const WatchlistItemTile({super.key, required this.item, required this.onRemove, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final changePercent = item.changePercent;
    final isPositive = changePercent != null && changePercent >= Decimal.zero;
    final color = changePercent == null
        ? AppColors.neutralChange(context)
        : (isPositive ? AppColors.positiveChange(context) : AppColors.negativeChange(context));

    return ListTile(
      onTap: onTap,
      title: Text(item.symbol),
      subtitle: Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.lastPrice?.toString() ?? '—'),
              Text(
                changePercent != null ? '${isPositive ? '+' : ''}$changePercent%' : 'N/A',
                style: TextStyle(color: color, fontSize: 12),
              ),
            ],
          ),
          IconButton(icon: const Icon(Icons.close), tooltip: 'Remove from watchlist', onPressed: onRemove),
        ],
      ),
    );
  }
}
