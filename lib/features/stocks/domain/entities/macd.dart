import 'package:decimal/decimal.dart';

class Macd {
  final Decimal? macd;
  final Decimal? signal;
  final Decimal? histogram;

  const Macd({required this.macd, required this.signal, required this.histogram});
}
