// lib/views/prediction_view.dart - FIXED UI & KEYBOARD BUG

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controllers/market_controller.dart';
import '../controllers/prediction_controller.dart';
import '../models/prediction_model.dart';

class PredictionView extends StatelessWidget {
  // FIX: Helper methods are now correctly defined as private methods of this class.
  final PredictionController controller = Get.put(PredictionController());
  final MarketController marketcontroller = Get.put(MarketController());


  PredictionView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> periods = ['1y', '2y', '5y', 'max'];

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final status = marketcontroller.marketStatus.value;
          return Row(
            children: [
              Text(
                'Stock Prediction Pro',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              if (status != null) ...[
                const SizedBox(width: 10),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: BoxDecoration(
                      color: status.statusColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      status.status.toUpperCase(),
                      style: GoogleFonts.poppins(
                          color: status.statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 5
                      ),
                    ),
                  ),
                ),
              ]
            ],
          );
        }),
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputForm(context, periods),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return _buildLoadingState();
              } else if (controller.errorMessage.isNotEmpty) {
                return _buildErrorState(controller.errorMessage.value);
              } else if (controller.predictionResult.value != null) {
                return _buildPredictionResult(controller.predictionResult.value!);
              } else {
                return _buildInitialState();
              }
            }),
          ],
        ),
      ),
    );
  }

  // --- Form Widgets ---

  Widget _buildInputForm(BuildContext context, List<String> periods) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Predict Stock Signal',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),

          TextFormField(
            controller: controller.tickerTextController,
            onChanged: (value) {
              controller.tickerInput.value = value.toUpperCase();
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
              controller.fetchPrediction();
            },
            textCapitalization: TextCapitalization.characters,
            style: GoogleFonts.poppins(color: Colors.white70),
            decoration: _inputDecoration('Stock Ticker (e.g., RELIANCE)', Icons.search),
          ),

          const SizedBox(height: 15),
          _buildPeriodDropdown(periods),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: Obx(() => ElevatedButton.icon(
              onPressed: controller.isLoading.value ? null : () {
                FocusScope.of(context).unfocus();
                controller.fetchPrediction();
              },
              icon: const Icon(Icons.analytics_outlined),
              label: Text(
                controller.isLoading.value ? 'Analyzing...' : 'GET PREDICTION',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 5,
              ),
            )),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(color: Colors.white54),
      prefixIcon: Icon(icon, color: Colors.blueGrey),
      filled: true,
      fillColor: Colors.black38,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Get.theme.colorScheme.primary, width: 2),
      ),
    );
  }

  Widget _buildPeriodDropdown(List<String> periods) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: controller.periodInput.value,
          dropdownColor: Get.theme.cardColor,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.blueGrey),
          isExpanded: true,
          style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
          onChanged: (String? newValue) {
            if (newValue != null) {
              controller.periodInput.value = newValue;
            }
          },
          items: periods.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text('$value Historical Data'),
            );
          }).toList(),
        ),
      )),
    );
  }

  // --- State Widgets ---

  Widget _buildLoadingState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 15),
            Text('Processing complex ML model...', style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.red.shade700)
        ),
        child: Text(
          'Error: $message',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(color: Colors.redAccent, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Text(
          'Enter a Ticker and Period to get a prediction.',
          style: GoogleFonts.poppins(color: Colors.blueGrey, fontSize: 16),
        ),
      ),
    );
  }


  // --- Result Widget (Improved UI) ---

  Widget _buildPredictionResult(PredictionModel result) {
    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 2);
    final Color signalColor = controller.getSignalColor(result.signal);
    final String returnPrefix = result.predictedReturnPct > 0 ? '+' : '';

    return Column(
      children: [
        // Signal Card
        Card(
          color: Get.theme.cardColor,
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: signalColor, width: 3)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  result.ticker,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900
                  ),
                ),
                const Divider(color: Colors.white10, height: 25),
                Text(
                  'Trading Signal',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  result.signal,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: signalColor,
                      fontSize: 54,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 25),

        _buildSectionHeader('Prediction Details'),
        _buildDetailGrid(result, returnPrefix, signalColor, currencyFormat),

        const SizedBox(height: 25),

        _buildSectionHeader('Trade Recommendation (₹)'),
        _buildRecommendationCard(result, currencyFormat),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDetailGrid(PredictionModel result, String returnPrefix, Color signalColor, NumberFormat currencyFormat) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.8,
      children: [
        _buildMetricTile('Last Close', currencyFormat.format(result.lastClose), Colors.blueAccent),
        _buildMetricTile('Predicted Close', currencyFormat.format(result.predictedClose), Colors.amber),
        _buildMetricTile(
            'Expected Return',
            '$returnPrefix${result.predictedReturnPct.toStringAsFixed(2)}%',
            signalColor
        ),
        _buildMetricTile(
            'Model Accuracy',
            '${result.directionAccuracy.toStringAsFixed(1)}%',
            Colors.cyan
        ),
      ],
    );
  }

  Widget _buildMetricTile(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.circular(10),
          border: const Border.fromBorderSide(BorderSide.none)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(color: Colors.white54, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(PredictionModel result, NumberFormat currencyFormat) {
    return Card(
      color: Get.theme.cardColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTradePoint('Entry', currencyFormat.format(result.entryPrice), Colors.blueAccent),
            _buildTradePoint('Target', currencyFormat.format(result.targetPrice), Colors.greenAccent),
            _buildTradePoint('Stop Loss', currencyFormat.format(result.stopLoss), Colors.redAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildTradePoint(String title, String price, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 6),
        Text(
          price,
          style: GoogleFonts.poppins(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}