import 'package:decimal/decimal.dart';

class WatchlistItem {
  final String symbol;
  final String name;
  final DateTime addedAt;
  final Decimal? lastPrice;
  final Decimal? change;
  final Decimal? changePercent;

  const WatchlistItem({
    required this.symbol,
    required this.name,
    required this.addedAt,
    required this.lastPrice,
    required this.change,
    required this.changePercent,
  });
}
