// lib/controllers/prediction_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/prediction_model.dart';
import '../services/api_service.dart';

class PredictionController extends GetxController {
  final ApiService _apiService = ApiService();

  // FIX: Use TextEditingController to manage text input and prevent keyboard closing.
  final tickerTextController = TextEditingController();

  var tickerInput = 'RELIANCE'.obs;
  var periodInput = '2y'.obs; // Not used in API call, but kept for UI
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var predictionResult = Rx<PredictionModel?>(null);

  @override
  void onInit() {
    tickerTextController.text = tickerInput.value;
    super.onInit();
  }

  @override
  void onClose() {
    tickerTextController.dispose();
    super.onClose();
  }

  void setTickerAndFetch(String ticker) {
    if (ticker.isEmpty) return;

    tickerInput.value = ticker.toUpperCase();
    tickerTextController.text = tickerInput.value;

    tickerTextController.selection = TextSelection.fromPosition(
        TextPosition(offset: tickerTextController.text.length)
    );

    fetchPrediction();
  }

  Future<void> fetchPrediction() async {
    final ticker = tickerTextController.text.toUpperCase();
    if (ticker.isEmpty) {
      errorMessage.value = 'Please enter a stock ticker.';
      return;
    }
    tickerInput.value = ticker;

    isLoading.value = true;
    errorMessage.value = '';
    predictionResult.value = null;

    try {
      predictionResult.value = await _apiService.fetchPrediction(ticker);
    } catch (e) {
      errorMessage.value = 'Prediction failed: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Color getSignalColor(String signal) {
    switch (signal.toUpperCase()) {
      case 'BUY':
      case 'STRONG BUY':
        return Colors.greenAccent;
      case 'SELL':
      case 'STRONG SELL':
        return Colors.redAccent;
      case 'HOLD':
      default:
        return Colors.amber;
    }
  }
}