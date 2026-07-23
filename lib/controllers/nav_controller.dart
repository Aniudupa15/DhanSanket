// lib/controllers/nav_controller.dart

import 'package:get/get.dart';

class NavController extends GetxController {
  // 0: Market, 1: Predict, 2: Portfolio, 3: Watchlist
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}