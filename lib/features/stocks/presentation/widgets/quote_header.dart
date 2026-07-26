import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_trend_badge.dart';
import '../../domain/entities/quote.dart';
import '../../domain/entities/stock_detail.dart';
import 'add_to_watchlist_sheet.dart';

class QuoteHeader extends StatelessWidget {
  final StockDetail detail;

  const QuoteHeader({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final quote = detail.quote;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          detail.symbol,
                          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'NSE',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      detail.name,
                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton.filledTonal(
                icon: const Icon(Icons.star_outline_rounded, size: 22),
                tooltip: 'Add to watchlist',
                onPressed: () => showAddToWatchlistSheet(context, detail.symbol),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (quote != null) _QuoteRow(quote: quote) else _QuoteUnavailable(reason: detail.quoteUnavailableReason),
        ],
      ),
    );
  }
}

class _QuoteRow extends StatelessWidget {
  final Quote quote;

  const _QuoteRow({required this.quote});

  @override
  Widget build(BuildContext context) {
    final changePercent = double.tryParse(quote.changePercent.toString()) ?? 0.0;
    final isPositive = quote.change >= Decimal.zero;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '₹${quote.lastPrice}',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(width: 12),
        AppTrendBadge(
          changePercent: changePercent,
          valueText: '${isPositive ? '+' : ''}${quote.change} (${quote.changePercent}%)',
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        ),
      ],
    );
  }
}

class _QuoteUnavailable extends StatelessWidget {
  final String? reason;

  const _QuoteUnavailable({required this.reason});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.info_outline, size: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
          const SizedBox(width: 6),
          Text(
            reason ?? 'Live quote is currently unavailable.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
