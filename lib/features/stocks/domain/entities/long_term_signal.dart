/// `confidence` here is a plain `int` (unlike IntradaySignal.confidence,
/// which is a Decimal) - confirmed directly from the backend schema.
class LongTermSignal {
  final String symbol;
  final bool hasData;
  final String signal;
  final int confidence;
  final String investmentHorizon;
  final String riskLevel;
  final String growthPotential;
  final List<String> strengths;
  final List<String> weaknesses;
  final List<String> opportunities;
  final List<String> risks;
  final List<String> reasoning;
  final String disclaimer;

  const LongTermSignal({
    required this.symbol,
    required this.hasData,
    required this.signal,
    required this.confidence,
    required this.investmentHorizon,
    required this.riskLevel,
    required this.growthPotential,
    required this.strengths,
    required this.weaknesses,
    required this.opportunities,
    required this.risks,
    required this.reasoning,
    required this.disclaimer,
  });
}
