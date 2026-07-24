import 'package:decimal/decimal.dart';

class Quote {
  final Decimal lastPrice;
  final Decimal change;
  final Decimal changePercent;
  final Decimal open;
  final Decimal high;
  final Decimal low;
  final Decimal previousClose;
  final int volume;
  final DateTime asOf;

  const Quote({
    required this.lastPrice,
    required this.change,
    required this.changePercent,
    required this.open,
    required this.high,
    required this.low,
    required this.previousClose,
    required this.volume,
    required this.asOf,
  });
}
