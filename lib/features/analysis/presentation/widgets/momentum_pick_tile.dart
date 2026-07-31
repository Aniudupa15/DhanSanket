import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/momentum_pick.dart';

class MomentumPickTile extends StatelessWidget {
  final MomentumPick pick;
  final VoidCallback onTap;

  const MomentumPickTile({super.key, required this.pick, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final up = pick.trailingReturnPct >= 0;
    final returnColor = up ? AppColors.positiveChange(context) : AppColors.negativeChange(context);
    final signalColor = AppColors.positiveChange(context); // top-N picks are always BUY
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
                children: [
                  CircleAvatar(
                    radius: 16,
                    child: Text('${pick.rank}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pick.symbol, style: Theme.of(context).textTheme.titleMedium),
                        Text(
                          pick.name,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Chip(
                    label: Text(
                      pick.signal,
                      style: TextStyle(color: signalColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _labelValue(
                    context,
                    '30d return',
                    '${up ? '+' : ''}${pick.trailingReturnPct.toStringAsFixed(1)}%',
                    valueColor: returnColor,
                  ),
                  _labelValue(context, 'Hold', pick.holdPeriod),
                  _labelValue(context, 'Confidence', '${pick.confidence}%'),
                  _labelValue(context, 'Price', '₹${pick.lastClose.toStringAsFixed(0)}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelValue(BuildContext context, String label, String value, {Color? valueColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: valueColor),
        ),
      ],
    );
  }
}
