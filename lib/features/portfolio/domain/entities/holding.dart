import 'package:decimal/decimal.dart';

class Holding {
  final String symbol;
  final Decimal quantity;
  final Decimal avgPrice;
  final Decimal costBasis;
  final Decimal? currentPrice;
  final Decimal? currentValue;
  final Decimal? pnl;
  final Decimal? pnlPercent;

  const Holding({
    required this.symbol,
    required this.quantity,
    required this.avgPrice,
    required this.costBasis,
    required this.currentPrice,
    required this.currentValue,
    required this.pnl,
    required this.pnlPercent,
  });
}
