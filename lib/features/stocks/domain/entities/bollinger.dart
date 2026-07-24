import 'package:decimal/decimal.dart';

class Bollinger {
  final Decimal? upper;
  final Decimal? middle;
  final Decimal? lower;

  const Bollinger({required this.upper, required this.middle, required this.lower});
}
