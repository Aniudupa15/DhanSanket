import 'package:flutter/material.dart';

import '../../../../core/widgets/app_trend_badge.dart';
import '../../domain/entities/index_quote.dart';

class IndicesStrip extends StatelessWidget {
  final List<IndexQuote> indices;

  const IndicesStrip({super.key, required this.indices});

  @override
  Widget build(BuildContext context) {
    if (indices.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: indices.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final quote = indices[index];
          final changePercent = double.tryParse(quote.changePercent.toString()) ?? 0.0;
          return Card(
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    quote.indexName,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    quote.lastPrice.toString(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  AppTrendBadge(
                    changePercent: changePercent,
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
