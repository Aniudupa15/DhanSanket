import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/price_history.dart';

const List<String> priceHistoryRanges = ['1D', '5D', '1M', '3M', '6M', '1Y', '3Y', '5Y', 'MAX'];

class PriceChart extends StatelessWidget {
  final PriceHistory history;
  final String selectedRange;
  final ValueChanged<String> onRangeChanged;

  const PriceChart({super.key, required this.history, required this.selectedRange, required this.onRangeChanged});

  @override
  Widget build(BuildContext context) {
    final bars = history.bars;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: priceHistoryRanges.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final range = priceHistoryRanges[index];
              return ChoiceChip(
                label: Text(range),
                selected: range == selectedRange,
                onSelected: (_) => onRangeChanged(range),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        if (bars.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Text('No price history available for this range.'),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 220,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (spots) {
                        return spots.map((spot) {
                          final bar = bars[spot.x.toInt()];
                          return LineTooltipItem('${bar.close}', const TextStyle(color: Colors.white));
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [for (var i = 0; i < bars.length; i++) FlSpot(i.toDouble(), bars[i].close.toDouble())],
                      isCurved: false,
                      dotData: const FlDotData(show: false),
                      color: Theme.of(context).colorScheme.primary,
                      barWidth: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
