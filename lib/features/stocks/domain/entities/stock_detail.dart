import 'package:decimal/decimal.dart';

import 'instrument_type.dart';
import 'quote.dart';

class StockDetail {
  final String symbol;
  final String? isin;
  final String name;
  final String? series;
  final String? sector;
  final String? industry;
  final InstrumentType instrumentType;
  final DateTime? listingDate;
  final Decimal? faceValue;
  final Quote? quote;
  final String? quoteUnavailableReason;

  const StockDetail({
    required this.symbol,
    required this.isin,
    required this.name,
    required this.series,
    required this.sector,
    required this.industry,
    required this.instrumentType,
    required this.listingDate,
    required this.faceValue,
    required this.quote,
    required this.quoteUnavailableReason,
  });
}
