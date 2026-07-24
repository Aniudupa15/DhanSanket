import 'package:decimal/decimal.dart';

class DividendRecommendation {
  final String symbol;
  final String name;
  final Decimal dividendYield;
  final Decimal dividendAmount;
  final DateTime exDividendDate;
  final DateTime buyBeforeDate;
  final String recommendation;
  final String riskLevel;
  final int confidence;

  const DividendRecommendation({
    required this.symbol,
    required this.name,
    required this.dividendYield,
    required this.dividendAmount,
    required this.exDividendDate,
    required this.buyBeforeDate,
    required this.recommendation,
    required this.riskLevel,
    required this.confidence,
  });
}
