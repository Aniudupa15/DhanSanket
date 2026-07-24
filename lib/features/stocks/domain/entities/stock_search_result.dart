import 'instrument_type.dart';

class StockSearchResult {
  final String symbol;
  final String name;
  final String? isin;
  final String? series;
  final InstrumentType instrumentType;

  const StockSearchResult({
    required this.symbol,
    required this.name,
    required this.isin,
    required this.series,
    required this.instrumentType,
  });
}
