import 'package:decimal/decimal.dart';

/// Shared across features/dashboard (top-5 previews) and features/market
/// (full gainers/losers/most-active/52-week lists) - identical backend shape
/// (`MarketMoverOut`) consumed from multiple endpoints.
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
