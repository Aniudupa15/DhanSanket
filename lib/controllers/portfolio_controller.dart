// lib/controllers/portfolio_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/portfolio_model.dart';
import '../services/api_service.dart';

class PortfolioController extends GetxController {
  final ApiService _apiService = ApiService();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var portfolioValue = Rx<PortfolioValueModel?>(null);

  @override
  void onInit() {
    fetchPortfolioValue();
    super.onInit();
  }

  Future<void> fetchPortfolioValue() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final value = await _apiService.fetchPortfolioValue();
      portfolioValue.value = value;
    } catch (e) {
      errorMessage.value = 'Failed to load portfolio value: ${e.toString()}';
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addStock({required String ticker, required int quantity, required double buyPrice}) async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      // Assuming _apiService.addHolding exists
      await _apiService.addHolding(ticker: ticker, quantity: quantity, buyPrice: buyPrice);
      await fetchPortfolioValue();
      Get.back(); // Close dialog
      Get.snackbar('Success', '$quantity shares of $ticker added!', backgroundColor: Colors.green);
    } catch (e) {
      Get.back(); // Close dialog
      Get.snackbar('Error', 'Failed to add stock: ${e.toString()}', backgroundColor: Colors.red);
    }
  }
  Future<bool> sellHolding({
    required String ticker,
    required int quantity,
    required double sellPrice,
    String? notes,
  }) async {
    try {
      await _apiService.sellPortfolioHolding(
        ticker: ticker,
        quantity: quantity,
        sellPrice: sellPrice,
        notes: notes,
      );
      // Refresh data after successful sale
      await fetchPortfolioValue();
      Get.snackbar(
        'Success',
        'Sold $quantity shares of $ticker',
        backgroundColor: Colors.green.shade400,
        colorText: Colors.white,
      );
      return true;
    } catch (e) {
      errorMessage.value = 'Failed to sell holding: ${e.toString()}';
      Get.snackbar(
        'Error',
        'Failed to sell holding: ${e.toString()}',
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
      );
      return false;
    }
  }

  Color getPNLColor(double pnl) {
    if (pnl > 0) return Colors.greenAccent;
    if (pnl < 0) return Colors.redAccent;
    return Colors.amber;
  }
}