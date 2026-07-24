import 'package:decimal/decimal.dart';

/// `bookValue`/`roe`/`roce`/`debtToEquity` are always null today (no
/// confirmed free data source on the backend) but the fields are kept -
/// the UI renders them as "N/A", never hides the row, matching the
/// backend's own "documented gap, not silently faked" philosophy.
class Fundamentals {
  final String symbol;
  final bool hasData;
  final DateTime? latestPeriodEnd;
  final Decimal? revenueGrowthYoy;
  final Decimal? revenueGrowthQoq;
  final Decimal? profitGrowthYoy;
  final Decimal? profitGrowthQoq;
  final Decimal? ttmEps;
  final Decimal? peRatio;
  final Decimal? dividendYield;
  final Decimal? bookValue;
  final Decimal? roe;
  final Decimal? roce;
  final Decimal? debtToEquity;

  const Fundamentals({
    required this.symbol,
    required this.hasData,
    required this.latestPeriodEnd,
    required this.revenueGrowthYoy,
    required this.revenueGrowthQoq,
    required this.profitGrowthYoy,
    required this.profitGrowthQoq,
    required this.ttmEps,
    required this.peRatio,
    required this.dividendYield,
    required this.bookValue,
    required this.roe,
    required this.roce,
    required this.debtToEquity,
  });
}
