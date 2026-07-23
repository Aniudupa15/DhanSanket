// lib/controllers/market_controller.dart

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/market_model.dart';
import '../services/api_service.dart';

class MarketController extends GetxController {
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  var overview = Rx<MarketOverviewModel?>(null);
  var gainers = <StockSummaryModel>[].obs;
  var losers = <StockSummaryModel>[].obs;
  var marketStatus = Rx<MarketStatusModel?>(null); // NEW: Observable for status

  @override
  void onInit() {
    fetchMarketData();
    super.onInit();
  }

  Future<void> fetchMarketData() async {
    if (isLoading.value) return;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Use Future.wait to fetch all required data concurrently
      final results = await Future.wait([
        _apiService.fetchMarketOverview(),
        _apiService.fetchTopGainers(limit: 10),
        _apiService.fetchTopLosers(limit: 10),
        _apiService.fetchMarketStatus(), // NEW: Fetch market status
      ]);

      overview.value = results[0] as MarketOverviewModel;
      gainers.assignAll(results[1] as List<StockSummaryModel>);
      losers.assignAll(results[2] as List<StockSummaryModel>);
      marketStatus.value = results[3] as MarketStatusModel; // NEW: Store market status

    } catch (e) {
      errorMessage.value = 'Failed to load market data: ${e.toString()}';
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  // ... (getSentimentColor and formatVolume methods remain the same)
  Color getSentimentColor(String sentiment) {
    switch (sentiment.toUpperCase()) {
      case 'BULLISH':
        return Colors.greenAccent.shade400;
      case 'BEARISH':
        return Colors.redAccent.shade400;
      case 'NEUTRAL':
      default:
        return Colors.blueGrey.shade300;
    }
  }

  String formatVolume(int volume) {
    if (volume >= 1000000000) {
      return '${(volume / 1000000000).toStringAsFixed(1)}B';
    } else if (volume >= 1000000) {
      return '${(volume / 1000000).toStringAsFixed(1)}M';
    } else if (volume >= 1000) {
      return '${(volume / 1000).toStringAsFixed(1)}K';
    }
    return volume.toString();
  }
}