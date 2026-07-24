import 'package:decimal/decimal.dart';

class PivotPoints {
  final Decimal pivot;
  final Decimal r1;
  final Decimal r2;
  final Decimal r3;
  final Decimal s1;
  final Decimal s2;
  final Decimal s3;

  const PivotPoints({
    required this.pivot,
    required this.r1,
    required this.r2,
    required this.r3,
    required this.s1,
    required this.s2,
    required this.s3,
  });
}
