import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/quote.dart';
import '../../domain/entities/stock_detail.dart';
import 'add_to_watchlist_sheet.dart';

class QuoteHeader extends StatelessWidget {
  final StockDetail detail;

  const QuoteHeader({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final quote = detail.quote;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(detail.symbol, style: Theme.of(context).textTheme.headlineSmall),
              IconButton(
                icon: const Icon(Icons.star_outline),
                tooltip: 'Add to watchlist',
                onPressed: () => showAddToWatchlistSheet(context, detail.symbol),
              ),
            ],
          ),
          Text(detail.name, style: Theme.of(context).textTheme.bodyMedium),
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
    final isPositive = quote.change >= Decimal.zero;
    final color = isPositive ? AppColors.positiveChange(context) : AppColors.negativeChange(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(quote.lastPrice.toString(), style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(width: 12),
        Text(
          '${isPositive ? '+' : ''}${quote.change} (${quote.changePercent}%)',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color),
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
    return Text(
      reason ?? 'Live quote is currently unavailable.',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.outline),
    );
  }
}
