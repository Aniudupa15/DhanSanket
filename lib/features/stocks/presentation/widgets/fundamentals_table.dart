import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/fundamentals.dart';

/// Renders every field, even the ones that are always null today
/// (book value/ROE/ROCE/debt-to-equity - no confirmed free data source on
/// the backend) as "N/A" - never hides the row, matching the backend's
/// "documented gap, not silently faked" philosophy.
class FundamentalsTable extends StatelessWidget {
  final Fundamentals fundamentals;

  const FundamentalsTable({super.key, required this.fundamentals});

  String _fmt(Decimal? value, [String suffix = '']) => value == null ? 'N/A' : '$value$suffix';

  @override
  Widget build(BuildContext context) {
    final rows = <(String, String)>[
      ('Revenue Growth (YoY)', _fmt(fundamentals.revenueGrowthYoy, '%')),
      ('Revenue Growth (QoQ)', _fmt(fundamentals.revenueGrowthQoq, '%')),
      ('Profit Growth (YoY)', _fmt(fundamentals.profitGrowthYoy, '%')),
      ('Profit Growth (QoQ)', _fmt(fundamentals.profitGrowthQoq, '%')),
      ('TTM EPS', _fmt(fundamentals.ttmEps)),
      ('P/E Ratio', _fmt(fundamentals.peRatio)),
      ('Dividend Yield', _fmt(fundamentals.dividendYield, '%')),
      ('Book Value', _fmt(fundamentals.bookValue)),
      ('ROE', _fmt(fundamentals.roe, '%')),
      ('ROCE', _fmt(fundamentals.roce, '%')),
      ('Debt to Equity', _fmt(fundamentals.debtToEquity)),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!fundamentals.hasData)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'No confirmed financial filings yet for this stock.',
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
            ),
          for (final (label, value) in rows)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label, style: Theme.of(context).textTheme.bodyMedium),
                  Text(value, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
