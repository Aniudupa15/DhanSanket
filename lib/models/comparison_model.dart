// lib/models/comparison_model.dart

/// Detailed comparison model for stocks.
/// Kept separate to avoid duplicate class definitions.

class StockComparisonModel {
  final String ticker;
  final double currentPrice;
  final double periodReturnPct;
  final double volatility;
  final double avgVolume;
  final double high52Week;
  final double low52Week;
  final int performanceRank;

  // Optional / calculated fields
  final double? peRatio;
  final double? marketCap;
  final String technicalSignal;

  StockComparisonModel({
    required this.ticker,
    required this.currentPrice,
    required this.periodReturnPct,
    required this.volatility,
    required this.avgVolume,
    required this.high52Week,
    required this.low52Week,
    required this.performanceRank,
    this.peRatio,
    this.marketCap,
    this.technicalSignal = 'NEUTRAL',
  });

  factory StockComparisonModel.fromJson(Map<String, dynamic> json) {
    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0.0;
      if (v is num) return (v).toDouble();
      return 0.0;
    }

    double? _toNullableDouble(dynamic v) {
      if (v == null) return null;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      if (v is String) return double.tryParse(v);
      if (v is num) return (v).toDouble();
      return null;
    }

    final periodReturn = _toDouble(json['period_return_pct'] ?? json['return_pct'] ?? 0.0);

    // Technical signal logic: you can extend this rule-set later
    String signal = 'HOLD';
    if (periodReturn > 5.0) {
      signal = 'BUY';
    } else if (periodReturn < -5.0) {
      signal = 'SELL';
    }

    return StockComparisonModel(
      ticker: (json['ticker'] ?? 'N/A').toString(),
      currentPrice: _toDouble(json['current_price'] ?? json['price']),
      periodReturnPct: periodReturn,
      volatility: _toDouble(json['volatility']),
      avgVolume: _toDouble(json['avg_volume']),
      high52Week: _toDouble(json['high_52week'] ?? json['52w_high']),
      low52Week: _toDouble(json['low_52week'] ?? json['52w_low']),
      performanceRank: (json['performance_rank'] is int)
          ? json['performance_rank'] as int
          : int.tryParse((json['performance_rank'] ?? '0').toString()) ?? 0,
      peRatio: _toNullableDouble(json['pe_ratio']),
      marketCap: _toNullableDouble(json['market_cap']),
      technicalSignal: (json['technical_signal']?.toString() ?? signal),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ticker': ticker,
      'current_price': currentPrice,
      'period_return_pct': periodReturnPct,
      'volatility': volatility,
      'avg_volume': avgVolume,
      'high_52week': high52Week,
      'low_52week': low52Week,
      'performance_rank': performanceRank,
      'pe_ratio': peRatio,
      'market_cap': marketCap,
      'technical_signal': technicalSignal,
    };
  }

  double get week52High => high52Week;
  double get week52Low => low52Week;
}
