import 'package:decimal/decimal.dart';

class IntradayRecommendation {
  final String symbol;
  final String name;
  final DateTime asOf;
  final String signal;
  final Decimal confidence;
  final Decimal? entryPrice;
  final Decimal? targetPrice;
  final Decimal? stopLoss;
  final List<String> reasoning;

  const IntradayRecommendation({
    required this.symbol,
    required this.name,
    required this.asOf,
    required this.signal,
    required this.confidence,
    required this.entryPrice,
    required this.targetPrice,
    required this.stopLoss,
    required this.reasoning,
  });
}
