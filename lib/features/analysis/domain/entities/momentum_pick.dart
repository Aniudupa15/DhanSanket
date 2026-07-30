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
}
