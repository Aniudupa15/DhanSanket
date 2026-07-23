// lib/models/market_model.dart

import 'package:flutter/material.dart';

/// --- MARKET STATUS MODEL ---
class MarketStatusModel {
  final String status;
  final String market;
  final String? closingTime;

  MarketStatusModel({
    required this.status,
    required this.market,
    this.closingTime,
  });

  factory MarketStatusModel.fromJson(Map<String, dynamic> json) {
    // Prefer 'status', fallback to 'session', otherwise 'N/A'
    final dynamic rawStatus = json['status'] ?? json['session'] ?? 'N/A';
    final String displayStatus = rawStatus?.toString() ?? 'N/A';

    return MarketStatusModel(
      status: displayStatus,
      market: (json['market'] ?? 'NSE').toString(),
      closingTime: json['closing_time']?.toString(),
    );
  }

  /// Dynamic color coding for UI
  Color get statusColor {
    final s = status.toUpperCase();
    if (s == 'OPEN') return Colors.greenAccent;
    if (s == 'CLOSED' || s == 'HOLIDAY') return Colors.redAccent;
    if (s == 'WEEKEND') return Colors.blueGrey;
    return Colors.amber;
  }
}

/// --- MARKET OVERVIEW MODEL ---
class MarketOverviewModel {
  final int advancing;
  final int declining;
  final int unchanged;
  final double advanceDeclineRatio;
  final String marketSentiment;
  final int totalVolume;
  final int stocksAnalyzed;
  final String timestamp;

  MarketOverviewModel({
    required this.advancing,
    required this.declining,
    required this.unchanged,
    required this.advanceDeclineRatio,
    required this.marketSentiment,
    required this.totalVolume,
    required this.stocksAnalyzed,
    required this.timestamp,
  });

  factory MarketOverviewModel.fromJson(Map<String, dynamic> json) {
    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      if (v is String) return int.tryParse(v) ?? 0;
      if (v is num) return v.toInt();
      return 0;
    }

    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0.0;
      if (v is num) return (v).toDouble();
      return 0.0;
    }

    return MarketOverviewModel(
      advancing: _toInt(json['advancing']),
      declining: _toInt(json['declining']),
      unchanged: _toInt(json['unchanged']),
      advanceDeclineRatio: _toDouble(json['advance_decline_ratio']),
      marketSentiment: (json['market_sentiment'] ?? 'Neutral').toString(),
      totalVolume: _toInt(json['total_volume']),
      stocksAnalyzed: _toInt(json['stocks_analyzed']),
      timestamp: (json['timestamp'] ?? '').toString(),
    );
  }
}

/// --- STOCK SUMMARY MODEL ---
class StockSummaryModel {
  final String ticker;
  final String tickerNs;
  final double currentPrice;
  final double previousClose;
  final double change;
  final double changePercent;
  final int volume;
  final double high;
  final double low;

  StockSummaryModel({
    required this.ticker,
    required this.tickerNs,
    required this.currentPrice,
    required this.previousClose,
    required this.change,
    required this.changePercent,
    required this.volume,
    required this.high,
    required this.low,
  });

  factory StockSummaryModel.fromJson(Map<String, dynamic> json) {
    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0.0;
      if (v is num) return (v).toDouble();
      return 0.0;
    }

    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      if (v is String) return int.tryParse(v) ?? 0;
      if (v is num) return v.toInt();
      return 0;
    }

    return StockSummaryModel(
      ticker: (json['ticker'] ?? 'N/A').toString(),
      tickerNs: (json['ticker_ns'] ?? 'N/A').toString(),
      currentPrice: _toDouble(json['current_price'] ?? json['price']),
      previousClose: _toDouble(json['previous_close']),
      change: _toDouble(json['change']),
      changePercent: _toDouble(json['change_percent']),
      volume: _toInt(json['volume']),
      high: _toDouble(json['high']),
      low: _toDouble(json['low']),
    );
  }
}

/// --- MARKET HOLIDAY MODEL ---
class MarketHolidayModel {
  final String date;
  final String name;

  MarketHolidayModel({required this.date, required this.name});

  factory MarketHolidayModel.fromJson(Map<String, dynamic> json) {
    return MarketHolidayModel(
      date: (json['date'] ?? 'N/A').toString(),
      name: (json['name'] ?? 'Holiday').toString(),
    );
  }
}
