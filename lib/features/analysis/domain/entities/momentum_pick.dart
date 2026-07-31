/// A single cross-sectional momentum pick from the backend's validated ranking
/// (`/trading/momentum/ranking`). These are LONG-TERM / positional signals -
/// the liquid universe ranked by 30-day trailing return, held ~monthly. Not
/// intraday calls.
class MomentumPick {
  final int rank;
  final String symbol;
  final String name;
  final double trailingReturnPct;
  final double lastClose;

  const MomentumPick({
    required this.rank,
    required this.symbol,
    required this.name,
    required this.trailingReturnPct,
    required this.lastClose,
  });

  /// Long-only momentum: every top-N pick is a BUY / hold candidate. A SELL only
  /// happens at the monthly rebalance when a name drops out of the top ranks.
  String get signal => 'BUY';

  /// The validated edge is a 30-day lookback, rebalanced monthly - so the honest
  /// holding horizon is about a month, re-checked at each rebalance. (Research
  /// showed holding much longer, 120d+, actually reverses the effect.)
  String get holdPeriod => '~1 month';

  /// A rank-based tilt, NOT a probability. Strongest-ranked names score a little
  /// higher, but it stays well below certainty because the strategy's historical
  /// monthly hit-rate is only ~53%. Top rank ~68%, easing to ~50% down the list.
  int get confidence => (68 - (rank - 1) * 2).clamp(50, 68);
}
