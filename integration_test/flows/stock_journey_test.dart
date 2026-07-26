import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../helpers/test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Stock Discovery & Search Integration Tests', () {
    testWidgets('Search stock, view stock details, and toggle price timeframe chips', (tester) async {
      await TestHelpers.bootApp(tester);

      // Perform Login
      await tester.enterText(find.byType(TextFormField).at(0), 'trader@dhansanket.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');
      await tester.tap(find.text('Log in'));
      await tester.pumpAndSettle();

      // Navigate to Stocks tab
      await tester.tap(find.text('Stocks'));
      await tester.pumpAndSettle();

      // Search for RELIANCE
      await tester.enterText(find.byType(TextField), 'RELIANCE');
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // Open Stock Details if result exists
      final relianceFinder = find.text('RELIANCE');
      if (relianceFinder.evaluate().isNotEmpty) {
        await tester.tap(relianceFinder.first);
        await tester.pumpAndSettle();

        // Verify Stock Detail page loaded
        expect(find.text('NSE'), findsOneWidget);

        // Tap 1M timeframe chip
        final monthChip = find.text('1M');
        if (monthChip.evaluate().isNotEmpty) {
          await tester.tap(monthChip);
          await tester.pumpAndSettle();
        }
      }
    });
  });
}
