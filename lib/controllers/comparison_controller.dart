
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_predictor/constants/api_constants.dart';
import 'dart:convert';
import '../models/comparison_model.dart';

class ComparisonController extends GetxController {
  final String baseUrl = API_BASE_URL; // Change to your API URL

  var comparedStocks = <StockComparisonModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var comparisonTickers = ''.obs;

  Future<void> compareStocks(String tickersInput) async {
    if (tickersInput.isEmpty) {
      errorMessage.value = 'Please enter at least 2 tickers';
      Get.snackbar(
        'Validation Error',
        'Please enter at least 2 tickers',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Parse tickers from comma-separated string
    final tickers = tickersInput
        .split(',')
        .map((t) => t.trim().toUpperCase())
        .where((t) => t.isNotEmpty)
        .toList();

    if (tickers.length < 2) {
      errorMessage.value = 'Please enter at least 2 tickers';
      Get.snackbar(
        'Validation Error',
        'Please enter at least 2 tickers',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (tickers.length > 10) {
      errorMessage.value = 'Maximum 10 stocks can be compared';
      Get.snackbar(
        'Validation Error',
        'Maximum 10 stocks can be compared',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';
    comparisonTickers.value = tickersInput;

    try {
      // Build query parameters
      final queryParams = tickers.map((t) => 'tickers=$t').join('&');
      final url = '$baseUrl/compare?$queryParams&period=6mo';

      print('Comparing stocks: $url');

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final stocks = data
            .map((json) => StockComparisonModel.fromJson(json))
            .toList();

        // Sort by performance rank
        stocks.sort((a, b) => a.performanceRank.compareTo(b.performanceRank));

        comparedStocks.assignAll(stocks);

        Get.snackbar(
          'Success',
          'Compared ${stocks.length} stocks',
          backgroundColor: Colors.green.shade600,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
      } else {
        final errorData = json.decode(response.body);
        throw Exception(errorData['detail'] ?? 'Failed to compare stocks');
      }
    } catch (e) {
      errorMessage.value = e.toString();
      print('Error comparing stocks: $e');

      Get.snackbar(
        'Comparison Error',
        'Failed to compare stocks: ${e.toString()}',
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Color getSignalColor(String signal) {
    switch (signal.toUpperCase()) {
      case 'BUY':
        return Colors.green;
      case 'SELL':
        return Colors.red;
      case 'HOLD':
        return Colors.orange;
      default:
        return Colors.white70;
    }
  }

  String formatMarketCap(double marketCap) {
    if (marketCap == 0) return 'N/A';

    if (marketCap >= 1e12) {
      return '₹${(marketCap / 1e12).toStringAsFixed(2)}T';
    } else if (marketCap >= 1e9) {
      return '₹${(marketCap / 1e9).toStringAsFixed(2)}B';
    } else if (marketCap >= 1e6) {
      return '₹${(marketCap / 1e6).toStringAsFixed(2)}M';
    } else if (marketCap >= 1e3) {
      return '₹${(marketCap / 1e3).toStringAsFixed(2)}K';
    } else {
      return '₹${marketCap.toStringAsFixed(2)}';
    }
  }

  void clearComparison() {
    comparedStocks.clear();
    comparisonTickers.value = '';
    errorMessage.value = '';
  }
}
