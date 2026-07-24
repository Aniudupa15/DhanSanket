import 'package:dhan_sanket/core/widgets/market_hours_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows a session label and a countdown', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: MarketHoursBanner())));

    final hasOpenLabel = find.text('Market Open').evaluate().isNotEmpty;
    final hasPreOpenLabel = find.text('Pre-Market').evaluate().isNotEmpty;
    final hasClosedLabel = find.text('Market Closed').evaluate().isNotEmpty;
    final hasAfterHoursLabel = find.text('After Hours').evaluate().isNotEmpty;

    expect(hasOpenLabel || hasPreOpenLabel || hasClosedLabel || hasAfterHoursLabel, isTrue);
    expect(find.textContaining(RegExp(r'(Opens|Closes) in')), findsOneWidget);
  });
}
