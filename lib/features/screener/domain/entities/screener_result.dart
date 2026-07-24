import 'package:decimal/decimal.dart';

class ScreenerResult {
  final String symbol;
  final String name;
  final DateTime asOf;
  final Decimal close;
  final int volume;
  final Decimal? rsi14;
  final Decimal? sma50;
  final Decimal? sma200;

  const ScreenerResult({
    required this.symbol,
    required this.name,
    required this.asOf,
    required this.close,
    required this.volume,
    required this.rsi14,
    required this.sma50,
    required this.sma200,
  });
}
