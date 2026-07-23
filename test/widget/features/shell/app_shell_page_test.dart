import 'package:dhan_sanket/features/shell/presentation/pages/app_shell_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  Widget buildSubject() {
    final router = GoRouter(
      initialLocation: '/dashboard',
      routes: [
        ShellRoute(
          builder: (context, state, child) => AppShellPage(child: child),
          routes: [
            GoRoute(path: '/dashboard', builder: (context, state) => const Center(child: Text('Dashboard content'))),
            GoRoute(path: '/stocks', builder: (context, state) => const Center(child: Text('Stocks content'))),
            GoRoute(path: '/watchlist', builder: (context, state) => const Center(child: Text('Watchlist content'))),
            GoRoute(path: '/portfolio', builder: (context, state) => const Center(child: Text('Portfolio content'))),
            GoRoute(path: '/more', builder: (context, state) => const Center(child: Text('More content'))),
          ],
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('starts on the Dashboard tab', (tester) async {
    await tester.pumpWidget(buildSubject());

    expect(find.text('Dashboard content'), findsOneWidget);
  });

  testWidgets('tapping a destination navigates to that tab', (tester) async {
    await tester.pumpWidget(buildSubject());

    await tester.tap(find.text('Stocks'));
    await tester.pumpAndSettle();

    expect(find.text('Stocks content'), findsOneWidget);
    expect(find.text('Dashboard content'), findsNothing);
  });
}
