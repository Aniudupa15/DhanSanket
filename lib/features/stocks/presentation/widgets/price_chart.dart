import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
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
    final isPositive = bars.isNotEmpty && (bars.last.close >= bars.first.close);
    final lineColor = isPositive ? AppColors.positiveChange(context) : AppColors.negativeChange(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: priceHistoryRanges.length,
            separatorBuilder: (_, _) => const SizedBox(width: 6),
            itemBuilder: (context, index) {
              final range = priceHistoryRanges[index];
              final isSelected = range == selectedRange;
              return ChoiceChip(
                label: Text(range),
                selected: isSelected,
                showCheckmark: false,
                labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
                onSelected: (_) => onRangeChanged(range),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        if (bars.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Center(child: Text('No price history available for this range.')),
          )
        else
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
            child: SizedBox(
              height: 220,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
                      strokeWidth: 1,
                      dashArray: [4, 4],
                    ),
                  ),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) => Theme.of(context).colorScheme.surfaceContainerHighest,
                      getTooltipItems: (spots) {
                        return spots.map((spot) {
                          final bar = bars[spot.x.toInt()];
                          return LineTooltipItem(
                            '₹${bar.close}',
                            TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [for (var i = 0; i < bars.length; i++) FlSpot(i.toDouble(), bars[i].close.toDouble())],
                      isCurved: true,
                      curveSmoothness: 0.2,
                      dotData: const FlDotData(show: false),
                      color: lineColor,
                      barWidth: 2.5,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [lineColor.withValues(alpha: 0.3), lineColor.withValues(alpha: 0.0)],
                        ),
                      ),
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
