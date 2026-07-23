// lib/views/nav_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_predictor/views/portfolio_view.dart';
import 'package:stock_predictor/views/utility_view.dart';
import 'package:stock_predictor/views/watchlist_view.dart';

import '../controllers/nav_controller.dart';
import 'home_view.dart';
import 'prediction_view.dart';

class NavView extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  NavView({super.key});

  final List<Widget> _pages = [
    HomeView(),       // Index 0: Market Dashboard
    PredictionView(), // Index 1: Stock Prediction
    PortfolioView(),
    UtilityView(),// Index 2: Portfolio
    WatchlistView(),  // Index 3: Watchlist
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Obx(
            () => IndexedStack(
          index: navController.currentIndex.value,
          children: _pages,
        ),
      ),

      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: navController.changePage,
          backgroundColor: Theme.of(context).cardColor,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Market',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Predict',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Utility',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Watchlist',
            ),
          ],
        ),
      ),
    );
  }
}