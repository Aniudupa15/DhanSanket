import 'ohlcv_bar.dart';

class PriceHistory {
  final String symbol;
  final String range;
  final List<OhlcvBar> bars;

  const PriceHistory({required this.symbol, required this.range, required this.bars});
}
