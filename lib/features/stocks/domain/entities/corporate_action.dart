import 'package:decimal/decimal.dart';

class CorporateAction {
  final String purpose;
  final Decimal? faceValue;
  final DateTime? exDate;
  final DateTime? recordDate;
  final DateTime? bookClosureStart;
  final DateTime? bookClosureEnd;

  const CorporateAction({
    required this.purpose,
    required this.faceValue,
    required this.exDate,
    required this.recordDate,
    required this.bookClosureStart,
    required this.bookClosureEnd,
  });
}
