import 'package:decimal/decimal.dart';

class OhlcvBar {
  final DateTime tradeDate;
  final Decimal open;
  final Decimal high;
  final Decimal low;
  final Decimal close;
  final int volume;

  const OhlcvBar({
    required this.tradeDate,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });
}
