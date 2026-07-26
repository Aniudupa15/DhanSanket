import 'package:dhan_sanket/bootstrap/app.dart';
import 'package:dhan_sanket/bootstrap/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Helper utilities for DhanSanket integration tests.
class TestHelpers {
  static Future<void> bootApp(WidgetTester tester) async {
    // Reset service locator if initialized
    if (getIt.isRegistered<App>()) {
      await getIt.reset();
    }
    setupInjector();
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
  }

  static Future<void> tapByText(WidgetTester tester, String text) async {
    final finder = find.text(text);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  static Future<void> enterTextByLabel(WidgetTester tester, String label, String text) async {
    final finder = find.widgetWithText(TextFormField, label);
    expect(finder, findsOneWidget);
    await tester.enterText(finder, text);
    await tester.pumpAndSettle();
  }
}
