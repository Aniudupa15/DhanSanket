import 'package:decimal/decimal.dart';

class MarketMover {
  final String symbol;
  final String name;
  final Decimal lastPrice;
  final Decimal? change;
  final Decimal? changePercent;
  final int volume;

  const MarketMover({
    required this.symbol,
    required this.name,
    required this.lastPrice,
    required this.change,
    required this.changePercent,
    required this.volume,
  });
}
