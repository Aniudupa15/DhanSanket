import 'package:flutter/material.dart';

import '../../domain/entities/comparison_entry.dart';

class ComparisonTable extends StatelessWidget {
  final List<ComparisonEntry> entries;

  const ComparisonTable({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    final rows = <(String, String Function(ComparisonEntry))>[
      ('Last Price', (e) => e.detail.quote?.lastPrice.toString() ?? 'N/A'),
      ('Change %', (e) => e.detail.quote?.changePercent != null ? '${e.detail.quote!.changePercent}%' : 'N/A'),
      ('Sector', (e) => e.detail.sector ?? 'N/A'),
      ('RSI (14)', (e) => e.indicators.rsi14?.toString() ?? 'N/A'),
      ('SMA 50', (e) => e.indicators.sma50?.toString() ?? 'N/A'),
      ('SMA 200', (e) => e.indicators.sma200?.toString() ?? 'N/A'),
      ('P/E Ratio', (e) => e.fundamentals.peRatio?.toString() ?? 'N/A'),
      ('TTM EPS', (e) => e.fundamentals.ttmEps?.toString() ?? 'N/A'),
      ('Dividend Yield', (e) => e.fundamentals.dividendYield?.toString() ?? 'N/A'),
      ('Revenue Growth (YoY)', (e) => e.fundamentals.revenueGrowthYoy?.toString() ?? 'N/A'),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          const DataColumn(label: Text('Metric')),
          for (final entry in entries) DataColumn(label: Text(entry.detail.symbol)),
        ],
        rows: [
          for (final row in rows)
            DataRow(cells: [DataCell(Text(row.$1)), for (final entry in entries) DataCell(Text(row.$2(entry)))]),
        ],
      ),
    );
  }
}
