import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Surfaces the dashboard's `notes` caveats (e.g. "sector data unavailable")
/// visibly - these must never be silently dropped.
class DashboardNotesBanner extends StatelessWidget {
  final List<String> notes;

  const DashboardNotesBanner({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) return const SizedBox.shrink();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark ? AppColors.cautionBannerDark : AppColors.cautionBannerLight;
    final foreground = isDark ? AppColors.cautionBannerTextDark : AppColors.cautionBannerTextLight;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: notes.map((note) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, size: 16, color: foreground),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(note, style: TextStyle(color: foreground, fontSize: 12)),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
