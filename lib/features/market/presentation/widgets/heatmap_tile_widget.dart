import 'package:decimal/decimal.dart';
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
    final isPositive = tile.changePercent != null && tile.changePercent! >= Decimal.zero;


    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => context.push(RoutePaths.stockDetail(tile.symbol)),
        child: Container(
          decoration: BoxDecoration(
            color: _colorFor(tile.bucket),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                tile.symbol,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: -0.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                tile.changePercent != null
                    ? '${isPositive ? '+' : ''}${tile.changePercent}%'
                    : '—',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _colorFor(HeatmapBucket bucket) {
    return switch (bucket) {
      HeatmapBucket.strongGain => const Color(0xFF15803D), // Emerald 700
      HeatmapBucket.gain => const Color(0xFF16A34A),       // Emerald 600
      HeatmapBucket.flat => const Color(0xFF64748B),       // Slate 500
      HeatmapBucket.loss => const Color(0xFFDC2626),       // Red 600
      HeatmapBucket.strongLoss => const Color(0xFF991B1B), // Red 800
      HeatmapBucket.unknown => const Color(0xFF475569),    // Slate 600
    };
  }
}

