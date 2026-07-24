import 'package:decimal/decimal.dart';

import 'heatmap_bucket.dart';

class HeatmapTile {
  final String symbol;
  final String name;
  final Decimal lastPrice;
  final Decimal? changePercent;
  final int volume;
  final HeatmapBucket bucket;

  const HeatmapTile({
    required this.symbol,
    required this.name,
    required this.lastPrice,
    required this.changePercent,
    required this.volume,
    required this.bucket,
  });
}
