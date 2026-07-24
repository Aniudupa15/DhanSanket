import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';

class AppShellPage extends StatelessWidget {
  final Widget child;

  const AppShellPage({super.key, required this.child});

  static const _tabs = [
    (path: RoutePaths.dashboard, icon: Icons.dashboard_outlined, selectedIcon: Icons.dashboard, label: 'Dashboard'),
    (path: RoutePaths.stocks, icon: Icons.show_chart_outlined, selectedIcon: Icons.show_chart, label: 'Stocks'),
    (path: RoutePaths.watchlist, icon: Icons.star_outline, selectedIcon: Icons.star, label: 'Watchlist'),
    (
      path: RoutePaths.portfolio,
      icon: Icons.account_balance_wallet_outlined,
      selectedIcon: Icons.account_balance_wallet,
      label: 'Portfolio',
    ),
    (path: RoutePaths.analysis, icon: Icons.insights_outlined, selectedIcon: Icons.insights, label: 'Analysis'),
    (path: RoutePaths.more, icon: Icons.more_horiz, selectedIcon: Icons.more_horiz, label: 'More'),
  ];

  int _indexForLocation(String location) {
    final index = _tabs.indexWhere((tab) => location.startsWith(tab.path));
    return index == -1 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final currentIndex = _indexForLocation(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) => context.go(_tabs[index].path),
        destinations: _tabs
            .map(
              (tab) =>
                  NavigationDestination(icon: Icon(tab.icon), selectedIcon: Icon(tab.selectedIcon), label: tab.label),
            )
            .toList(),
      ),
    );
  }
}
