// lib/models/watchlist_model.dart

class WatchlistItemModel {
  final String ticker;
  final String addedDate;
  final double? targetPrice;
  final String? notes;

  WatchlistItemModel({
    required this.ticker,
    required this.addedDate,
    this.targetPrice,
    this.notes,
  });

  factory WatchlistItemModel.fromJson(Map<String, dynamic> json) {
    return WatchlistItemModel(
      ticker: json['ticker'] ?? 'N/A',
      addedDate: json['added_date'] ?? '',
      targetPrice: (json['target_price'] as num?)?.toDouble(),
      notes: json['notes'],
    );
  }
}