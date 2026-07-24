import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../domain/entities/heatmap_bucket.dart';
import '../../domain/entities/heatmap_tile.dart';

class HeatmapTileWidget extends StatelessWidget {
  final HeatmapTile tile;

  const HeatmapTileWidget({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(RoutePaths.stockDetail(tile.symbol)),
      child: Container(
        decoration: BoxDecoration(color: _colorFor(tile.bucket), borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tile.symbol,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              tile.changePercent != null ? '${tile.changePercent}%' : '—',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Color _colorFor(HeatmapBucket bucket) {
    return switch (bucket) {
      HeatmapBucket.strongGain => const Color(0xFF1B5E20),
      HeatmapBucket.gain => const Color(0xFF4CAF50),
      HeatmapBucket.flat => const Color(0xFF9E9E9E),
      HeatmapBucket.loss => const Color(0xFFEF5350),
      HeatmapBucket.strongLoss => const Color(0xFFB71C1C),
      HeatmapBucket.unknown => const Color(0xFF616161),
    };
  }
}
