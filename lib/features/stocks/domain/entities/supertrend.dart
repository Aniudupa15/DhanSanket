import 'package:decimal/decimal.dart';

class Supertrend {
  final Decimal? value;
  final int? direction; // 1 = uptrend, -1 = downtrend, null = not yet computed

  const Supertrend({required this.value, required this.direction});
}
