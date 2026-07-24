import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/dividend_recommendation.dart';

class DividendRecommendationTile extends StatelessWidget {
  final DividendRecommendation recommendation;
  final VoidCallback onTap;

  const DividendRecommendationTile({super.key, required this.recommendation, required this.onTap});

  Color _recommendationColor(BuildContext context) {
    switch (recommendation.recommendation.toUpperCase()) {
      case 'HOLD':
      case 'HOLD FOR DIVIDEND':
        return AppColors.positiveChange(context);
      case 'SELL':
        return AppColors.negativeChange(context);
      default:
        return AppColors.neutralChange(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMd();
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(recommendation.symbol, style: Theme.of(context).textTheme.titleMedium),
                      Text(recommendation.name, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Chip(
                    label: Text(
                      recommendation.recommendation,
                      style: TextStyle(color: _recommendationColor(context), fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _labelValue(context, 'Yield', '${recommendation.dividendYield}%'),
                  _labelValue(context, 'Amount', '₹${recommendation.dividendAmount}'),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _labelValue(context, 'Ex-Dividend', dateFormat.format(recommendation.exDividendDate)),
                  _labelValue(context, 'Buy Before', dateFormat.format(recommendation.buyBeforeDate)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _labelValue(context, 'Risk', recommendation.riskLevel),
                  _labelValue(context, 'Confidence', '${recommendation.confidence}%'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelValue(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
