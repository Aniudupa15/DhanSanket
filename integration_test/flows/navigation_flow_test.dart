import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../helpers/test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Navigation & Dashboard Integration Tests', () {
    testWidgets('User logs in and navigates across bottom navigation tabs', (tester) async {
      await TestHelpers.bootApp(tester);

      // Perform Login
      await tester.enterText(find.byType(TextFormField).at(0), 'trader@dhansanket.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');
      await tester.tap(find.text('Log in'));
      await tester.pumpAndSettle();

      // Verify Dashboard Loaded
      expect(find.text('Dashboard'), findsOneWidget);

      // Tap Watchlist tab
      await tester.tap(find.text('Watchlist'));
      await tester.pumpAndSettle();
      expect(find.text('Watchlists'), findsOneWidget);

      // Tap Portfolio tab
      await tester.tap(find.text('Portfolio'));
      await tester.pumpAndSettle();
      expect(find.text('Portfolios'), findsOneWidget);

      // Tap Analysis tab
      await tester.tap(find.text('Analysis'));
      await tester.pumpAndSettle();
      expect(find.text('Analysis'), findsOneWidget);

      // Tap More tab
      await tester.tap(find.text('More'));
      await tester.pumpAndSettle();
      expect(find.text('More'), findsOneWidget);
    });
  });
}
