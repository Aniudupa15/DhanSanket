import 'package:decimal/decimal.dart';

class ScreenerFilter {
  final Decimal? rsiBelow;
  final Decimal? rsiAbove;
  final Decimal? priceMin;
  final Decimal? priceMax;
  final bool? aboveSma50;
  final int? minVolume;
  final int limit;

  const ScreenerFilter({
    this.rsiBelow,
    this.rsiAbove,
    this.priceMin,
    this.priceMax,
    this.aboveSma50,
    this.minVolume,
    this.limit = 50,
  });
}
