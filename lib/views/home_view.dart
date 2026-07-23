// lib/views/home_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/market_controller.dart';
import '../controllers/prediction_controller.dart';
import '../controllers/nav_controller.dart';
import '../models/market_model.dart';

class HomeView extends StatelessWidget {
  final MarketController controller = Get.put(MarketController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // NEW: Obx widget to reactively display market status
        title: Obx(() {
          final status = controller.marketStatus.value;
          return Row(
            children: [
              Text(
                'Market Dashboard',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              if (status != null) ...[
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: status.statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status.status.toUpperCase(),
                    style: GoogleFonts.poppins(
                        color: status.statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    ),
                  ),
                ),
              ]
            ],
          );
        }),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchMarketData,
            color: Colors.white70,
          )
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Obx(() {
        if (controller.isLoading.value && controller.overview.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '❌ ${controller.errorMessage.value}',
                style: GoogleFonts.poppins(color: Colors.redAccent, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // No change needed to the Market Overview card, as sentiment is already there
              _buildSectionHeader('📈 Market Overview'),
              if (controller.overview.value != null)
                _buildOverviewCard(context, controller.overview.value!),
              const SizedBox(height: 25),

              _buildSectionHeader('🚀 Top Gainers'),
              _buildStockList(context, controller.gainers, isGainer: true),
              const SizedBox(height: 25),

              _buildSectionHeader('📉 Top Losers'),
              _buildStockList(context, controller.losers, isGainer: false),
              const SizedBox(height: 40),
            ],
          ),
        );
      }),
    );
  }

  // ... (rest of the _build... helper methods remain the same)
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildOverviewCard(BuildContext context, MarketOverviewModel overview) {
    final sentimentColor = controller.getSentimentColor(overview.marketSentiment);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: sentimentColor.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            overview.marketSentiment,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: sentimentColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Advancing', overview.advancing.toString(), Colors.greenAccent),
              _buildStatItem('Declining', overview.declining.toString(), Colors.redAccent),
              _buildStatItem('Unchanged', overview.unchanged.toString(), Colors.blueGrey),
            ],
          ),

          const Divider(height: 30, color: Colors.white12),

          _buildRatioRow(
              'A/D Ratio',
              overview.advanceDeclineRatio.toStringAsFixed(2),
              Colors.cyan.shade300
          ),
          _buildRatioRow(
              'Total Volume',
              controller.formatVolume(overview.totalVolume),
              Colors.amber.shade300
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildRatioRow(String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              title,
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16)
          ),
          Text(
              value,
              style: GoogleFonts.poppins(color: color, fontWeight: FontWeight.w600, fontSize: 16)
          ),
        ],
      ),
    );
  }

  Widget _buildStockList(BuildContext context, List<StockSummaryModel> stocks, {required bool isGainer}) {
    if (stocks.isEmpty) {
      return Text(
        'No data available.',
        style: GoogleFonts.poppins(color: Colors.blueGrey),
      );
    }

    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 2);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        final stock = stocks[index];
        final Color changeColor = stock.changePercent >= 0 ? Colors.greenAccent : Colors.redAccent;
        final String sign = stock.changePercent > 0 ? '+' : '';
        final String formattedVolume = controller.formatVolume(stock.volume);

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Card(
            color: Theme.of(context).cardColor,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              leading: Container(
                width: 30,
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}',
                  style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
                ),
              ),
              title: Text(
                stock.ticker,
                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
              ),
              subtitle: Text(
                'Vol: $formattedVolume',
                style: GoogleFonts.poppins(color: Colors.white54, fontSize: 13),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    currencyFormat.format(stock.currentPrice),
                    style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '$sign${stock.changePercent.toStringAsFixed(2)}%',
                    style: GoogleFonts.poppins(color: changeColor, fontSize: 14),
                  ),
                ],
              ),
              onTap: () {
                final navController = Get.find<NavController>();
                final predictionController = Get.find<PredictionController>();

                predictionController.setTickerAndFetch(stock.ticker);
                navController.changePage(1);
              },
            ),
          ),
        );
      },
    );
  }
}