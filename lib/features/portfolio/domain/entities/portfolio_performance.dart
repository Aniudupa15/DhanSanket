import 'package:decimal/decimal.dart';

class PortfolioPerformance {
  final String id;
  final Decimal totalInvested;
  final Decimal currentValue;
  final Decimal totalPnl;
  final Decimal? totalPnlPercent;
  final Decimal? xirrPercent;

  const PortfolioPerformance({
    required this.id,
    required this.totalInvested,
    required this.currentValue,
    required this.totalPnl,
    required this.totalPnlPercent,
    required this.xirrPercent,
  });
}
