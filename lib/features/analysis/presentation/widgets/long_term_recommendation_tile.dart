import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/long_term_recommendation.dart';

class LongTermRecommendationTile extends StatelessWidget {
  final LongTermRecommendation recommendation;
  final VoidCallback onTap;

  const LongTermRecommendationTile({super.key, required this.recommendation, required this.onTap});

  Color _signalColor(BuildContext context) {
    switch (recommendation.signal.toUpperCase()) {
      case 'BUY':
        return AppColors.positiveChange(context);
      case 'SELL':
      case 'AVOID':
        return AppColors.negativeChange(context);
      default:
        return AppColors.neutralChange(context);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      recommendation.signal,
                      style: TextStyle(color: _signalColor(context), fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _labelValue(context, 'Tenure', recommendation.investmentTenure),
                  _labelValue(context, 'Risk', recommendation.riskLevel),
                  _labelValue(context, 'Confidence', '${recommendation.confidence}%'),
                ],
              ),
              if (recommendation.reasoning.isNotEmpty) ...[
                const SizedBox(height: 8),
                ...recommendation.reasoning.map(
                  (line) => Text('- $line', style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
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
