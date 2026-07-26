import 'package:flutter/material.dart';

import '../../../../core/widgets/app_trend_badge.dart';
import '../../domain/entities/watchlist_item.dart';

class WatchlistItemTile extends StatelessWidget {
  final WatchlistItem item;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  const WatchlistItemTile({super.key, required this.item, required this.onRemove, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final changePercent = item.changePercent != null ? (double.tryParse(item.changePercent.toString()) ?? 0.0) : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        margin: EdgeInsets.zero,
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Text(
              item.symbol.length > 2 ? item.symbol.substring(0, 2) : item.symbol,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.colorScheme.onPrimaryContainer),
            ),
          ),
          title: Text(item.symbol, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
          subtitle: Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.lastPrice != null ? '₹${item.lastPrice}' : '—',
                    style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  if (changePercent != null)
                    AppTrendBadge(changePercent: changePercent)
                  else
                    Text('—', style: theme.textTheme.bodySmall),
                ],
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.remove_circle_outline_rounded, size: 20, color: theme.colorScheme.outline),
                tooltip: 'Remove stock',
                onPressed: onRemove,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
