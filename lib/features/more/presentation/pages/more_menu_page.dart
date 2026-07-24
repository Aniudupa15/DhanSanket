import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';

class MoreMenuPage extends StatelessWidget {
  const MoreMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <(IconData, String, String)>[
      (Icons.person_outline, 'Profile', RoutePaths.profile),
      (Icons.notifications_outlined, 'Notifications', RoutePaths.notifications),
      (Icons.notifications_active_outlined, 'Alerts', RoutePaths.alerts),
      (Icons.smart_toy_outlined, 'AI Assistant', RoutePaths.chat),
      (Icons.article_outlined, 'News', RoutePaths.news),
      (Icons.grid_view_outlined, 'Market Heatmap', RoutePaths.marketHeatmap),
      (Icons.compare_arrows_outlined, 'Compare Stocks', RoutePaths.compare),
      (Icons.filter_alt_outlined, 'Stock Screener', RoutePaths.screener),
      (Icons.savings_outlined, 'Dividends', RoutePaths.dividends),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final (icon, label, path) = items[index];
          return ListTile(
            leading: Icon(icon),
            title: Text(label),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(path),
          );
        },
      ),
    );
  }
}
