// lib/models/prediction_model.dart

class PredictionModel {
  final String ticker;
  final double lastClose;
  final double predictedClose;
  final double predictedReturnPct;
  final String signal;
  final double entryPrice;
  final double targetPrice;
  final double stopLoss;
  final double modelMse;
  final double directionAccuracy;

  PredictionModel({
    required this.ticker,
    required this.lastClose,
    required this.predictedClose,
    required this.predictedReturnPct,
    required this.signal,
    required this.entryPrice,
    required this.targetPrice,
    required this.stopLoss,
    required this.modelMse,
    required this.directionAccuracy,
  });

  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
      ticker: json['ticker'] ?? 'N/A',
      lastClose: (json['last_close'] as num?)?.toDouble() ?? 0.0,
      predictedClose: (json['predicted_close'] as num?)?.toDouble() ?? 0.0,
      predictedReturnPct: (json['predicted_return_pct'] as num?)?.toDouble() ?? 0.0,
      signal: json['signal'] ?? 'HOLD',
      entryPrice: (json['entry_price'] as num?)?.toDouble() ?? 0.0,
      targetPrice: (json['target_price'] as num?)?.toDouble() ?? 0.0,
      stopLoss: (json['stop_loss'] as num?)?.toDouble() ?? 0.0,
      modelMse: (json['model_mse'] as num?)?.toDouble() ?? 0.0,
      directionAccuracy: (json['direction_accuracy'] as num?)?.toDouble() ?? 0.0,
    );
  }
}