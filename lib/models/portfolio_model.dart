// lib/models/portfolio_model.dart

class HoldingModel {
  final String ticker;
  final int quantity;
  final double avgBuyPrice;
  final double currentPrice;
  final double investment;
  final double currentValue;
  final double profitLoss;
  final double profitLossPct;

  HoldingModel({
    required this.ticker,
    required this.quantity,
    required this.avgBuyPrice,
    required this.currentPrice,
    required this.investment,
    required this.currentValue,
    required this.profitLoss,
    required this.profitLossPct,
  });

  factory HoldingModel.fromJson(Map<String, dynamic> json) {
    return HoldingModel(
      ticker: json['ticker'] ?? 'N/A',
      quantity: json['quantity'] ?? 0,
      avgBuyPrice: (json['avg_buy_price'] as num?)?.toDouble() ?? 0.0,
      currentPrice: (json['current_price'] as num?)?.toDouble() ?? 0.0,
      investment: (json['investment'] as num?)?.toDouble() ?? 0.0,
      currentValue: (json['current_value'] as num?)?.toDouble() ?? 0.0,
      profitLoss: (json['profit_loss'] as num?)?.toDouble() ?? 0.0,
      profitLossPct: (json['profit_loss_pct'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class PortfolioValueModel {
  final double totalInvestment;
  final double totalCurrentValue;
  final double totalProfitLoss;
  final double totalProfitLossPct;
  final List<HoldingModel> holdings;

  PortfolioValueModel({
    required this.totalInvestment,
    required this.totalCurrentValue,
    required this.totalProfitLoss,
    required this.totalProfitLossPct,
    required this.holdings,
  });

  factory PortfolioValueModel.fromJson(Map<String, dynamic> json) {
    var holdingsList = json['holdings'] as List? ?? [];
    List<HoldingModel> holdings = holdingsList.map((i) => HoldingModel.fromJson(i)).toList();

    return PortfolioValueModel(
      totalInvestment: (json['total_investment'] as num?)?.toDouble() ?? 0.0,
      totalCurrentValue: (json['total_current_value'] as num?)?.toDouble() ?? 0.0,
      totalProfitLoss: (json['total_profit_loss'] as num?)?.toDouble() ?? 0.0,
      totalProfitLossPct: (json['total_profit_loss_pct'] as num?)?.toDouble() ?? 0.0,
      holdings: holdings,
    );
  }
}

// lib/models/portfolio_model.dart

// ... (existing PortfolioStockValueModel, PortfolioValueModel, AddHoldingRequest) ...

// --- NEW REQUEST BODY FOR SELLING HOLDINGS ---
class SellHoldingRequest {
  final String ticker;
  final int quantity;
  final double sellPrice;
  final String? sellDate;
  final String? notes;

  SellHoldingRequest({
    required this.ticker,
    required this.quantity,
    required this.sellPrice,
    this.sellDate,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'ticker': ticker,
      'quantity': quantity,
      'sell_price': sellPrice,
      if (sellDate != null) 'sell_date': sellDate,
      if (notes != null) 'notes': notes,
    };
  }
}
