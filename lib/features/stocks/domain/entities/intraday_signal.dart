import 'package:decimal/decimal.dart';

/// `signal` is a plain string ("BUY"|"SELL"|"HOLD") straight from the
/// backend, not an enum - it's already display-ready and the backend
/// doesn't constrain it to those three values at the schema level.
class IntradaySignal {
  final String symbol;
  final DateTime? asOf;
  final bool hasData;
  final String signal;
  final Decimal confidence;
  final Decimal? entryPrice;
  final Decimal? targetPrice;
  final Decimal? stopLoss;
  final Decimal? riskRewardRatio;
  final Decimal? probability;
  final List<String> reasoning;
  final String disclaimer;

  const IntradaySignal({
    required this.symbol,
    required this.asOf,
    required this.hasData,
    required this.signal,
    required this.confidence,
    required this.entryPrice,
    required this.targetPrice,
    required this.stopLoss,
    required this.riskRewardRatio,
    required this.probability,
    required this.reasoning,
    required this.disclaimer,
  });
}
