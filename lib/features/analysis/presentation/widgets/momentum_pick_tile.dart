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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
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
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${up ? '+' : ''}${pick.trailingReturnPct.toStringAsFixed(1)}%',
                    style: TextStyle(color: returnColor, fontWeight: FontWeight.bold),
                  ),
                  Text('₹${pick.lastClose.toStringAsFixed(0)}', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
