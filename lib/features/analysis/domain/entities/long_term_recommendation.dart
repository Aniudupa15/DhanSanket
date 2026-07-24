/// `confidence` here is a plain `int` (unlike IntradayRecommendation.confidence,
/// which is a Decimal) - confirmed directly from the backend schema.
class LongTermRecommendation {
  final String symbol;
  final String name;
  final DateTime asOf;
  final String signal;
  final int confidence;
  final String riskLevel;
  final String growthPotential;
  final String investmentTenure;
  final List<String> reasoning;

  const LongTermRecommendation({
    required this.symbol,
    required this.name,
    required this.asOf,
    required this.signal,
    required this.confidence,
    required this.riskLevel,
    required this.growthPotential,
    required this.investmentTenure,
    required this.reasoning,
  });
}
