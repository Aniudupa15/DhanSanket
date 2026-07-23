import 'package:decimal/decimal.dart';

class IndexQuote {
  final String indexName;
  final Decimal lastPrice;
  final Decimal change;
  final Decimal changePercent;

  const IndexQuote({
    required this.indexName,
    required this.lastPrice,
    required this.change,
    required this.changePercent,
  });
}
