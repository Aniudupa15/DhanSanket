import 'package:decimal/decimal.dart';

class VolumeProfileBin {
  final Decimal priceLow;
  final Decimal priceHigh;
  final int volume;

  const VolumeProfileBin({required this.priceLow, required this.priceHigh, required this.volume});
}
