import '../../../stocks/domain/entities/fundamentals.dart';
import '../../../stocks/domain/entities/indicators.dart';
import '../../../stocks/domain/entities/stock_detail.dart';

class ComparisonEntry {
  final StockDetail detail;
  final Indicators indicators;
  final Fundamentals fundamentals;

  const ComparisonEntry({required this.detail, required this.indicators, required this.fundamentals});
}
