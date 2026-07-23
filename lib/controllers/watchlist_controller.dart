// lib/controllers/watchlist_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/watchlist_model.dart';
import '../services/api_service.dart';

class WatchlistController extends GetxController {
  final ApiService _apiService = ApiService();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var watchlist = <WatchlistItemModel>[].obs;

  @override
  void onInit() {
    fetchWatchlistData();
    super.onInit();
  }

  Future<void> fetchWatchlistData() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      watchlist.assignAll(await _apiService.fetchWatchlist());
    } catch (e) {
      errorMessage.value = 'Failed to load watchlist: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addWatchlistItem({required String ticker, double? targetPrice, String? notes}) async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      await _apiService.addToWatchlist(ticker: ticker, targetPrice: targetPrice, notes: notes);
      await fetchWatchlistData();
      Get.back();
      Get.snackbar('Success', '$ticker added to watchlist!', backgroundColor: Colors.green);
    } catch (e) {
      Get.back();
      Get.snackbar('Error', 'Failed to add to watchlist: ${e.toString()}', backgroundColor: Colors.red);
    }
  }
}