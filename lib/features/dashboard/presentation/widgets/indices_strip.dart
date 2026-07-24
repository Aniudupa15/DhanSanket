import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/index_quote.dart';

class IndicesStrip extends StatelessWidget {
  final List<IndexQuote> indices;

  const IndicesStrip({super.key, required this.indices});

  @override
  Widget build(BuildContext context) {
    if (indices.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: indices.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final quote = indices[index];
          final isPositive = quote.change >= Decimal.zero;
          final color = isPositive ? AppColors.positiveChange(context) : AppColors.negativeChange(context);
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(quote.indexName, style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 4),
                  Text(quote.lastPrice.toString(), style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    '${isPositive ? '+' : ''}${quote.changePercent}%',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
