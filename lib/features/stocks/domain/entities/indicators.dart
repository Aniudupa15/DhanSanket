import 'package:decimal/decimal.dart';

import 'bollinger.dart';
import 'macd.dart';
import 'pivot_points.dart';
import 'stoch_rsi.dart';
import 'supertrend.dart';
import 'volume_profile_bin.dart';

class Indicators {
  final String symbol;
  final DateTime? asOf;
  final bool hasData;
  final Decimal? sma20;
  final Decimal? sma50;
  final Decimal? sma200;
  final Decimal? ema20;
  final Decimal? ema50;
  final Decimal? rsi14;
  final Macd? macd;
  final Bollinger? bollinger;
  final Decimal? vwap20;
  final Decimal? adx14;
  final Decimal? atr14;
  final Supertrend? supertrend;
  final StochRsi? stochasticRsi;
  final PivotPoints? pivotPoints;
  final List<VolumeProfileBin> volumeProfile;
  final VolumeProfileBin? pointOfControl;

  const Indicators({
    required this.symbol,
    required this.asOf,
    required this.hasData,
    required this.sma20,
    required this.sma50,
    required this.sma200,
    required this.ema20,
    required this.ema50,
    required this.rsi14,
    required this.macd,
    required this.bollinger,
    required this.vwap20,
    required this.adx14,
    required this.atr14,
    required this.supertrend,
    required this.stochasticRsi,
    required this.pivotPoints,
    required this.volumeProfile,
    required this.pointOfControl,
  });
}
