import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Reusable gain/loss percentage badge with background pill and arrow indicator.
class AppTrendBadge extends StatelessWidget {
  final double changePercent;
  final String? valueText;
  final bool showIcon;
  final EdgeInsetsGeometry padding;

  const AppTrendBadge({
    super.key,
    required this.changePercent,
    this.valueText,
    this.showIcon = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = changePercent > 0;
    final isNegative = changePercent < 0;

    final textColor = isPositive
        ? AppColors.positiveChange(context)
        : isNegative
        ? AppColors.negativeChange(context)
        : AppColors.neutralChange(context);

    final backgroundColor = isPositive
        ? AppColors.positiveBackground(context)
        : isNegative
        ? AppColors.negativeBackground(context)
        : AppColors.neutralBackground(context);

    final displayString = valueText ?? '${isPositive ? '+' : ''}${changePercent.toStringAsFixed(2)}%';

    final icon = isPositive
        ? Icons.arrow_drop_up
        : isNegative
        ? Icons.arrow_drop_down
        : Icons.remove;

    return Container(
      padding: padding,
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showIcon) ...[Icon(icon, size: 16, color: textColor), const SizedBox(width: 2)],
          Text(
            displayString,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
