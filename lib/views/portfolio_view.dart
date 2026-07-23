// lib/views/portfolio_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controllers/market_controller.dart';
import '../controllers/portfolio_controller.dart';
import '../models/portfolio_model.dart'; // Contains HoldingModel and PortfolioValueModel

class PortfolioView extends StatelessWidget {
  final PortfolioController controller = Get.put(PortfolioController());
  final MarketController marketcontroller = Get.put(MarketController());

  PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final status = marketcontroller.marketStatus.value;
          // Determine status color locally based on status string (assuming 'OPEN'/'CLOSED' logic)
          Color statusColor = status?.status.toUpperCase() == 'OPEN' ? Colors.greenAccent : Colors.redAccent;

          return Row(
            children: [
              Text(
                'Portfolio Tracker',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              if (status != null) ...[
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status.status.toUpperCase(),
                    style: GoogleFonts.poppins(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    ),
                  ),
                ),
              ]
            ],
          );
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => Get.dialog(AddHoldingDialog()),
            color: Colors.greenAccent,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchPortfolioValue,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Obx(() {
        if (controller.isLoading.value && controller.portfolioValue.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${controller.errorMessage.value}', style: GoogleFonts.poppins(color: Colors.redAccent)));
        }
        if (controller.portfolioValue.value == null || controller.portfolioValue.value!.holdings.isEmpty) {
          return Center(child: Text('Your portfolio is empty. Add a stock!', style: GoogleFonts.poppins(color: Colors.blueGrey)));
        }

        final portfolio = controller.portfolioValue.value!;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryCard(portfolio),
              const SizedBox(height: 25),
              _buildSectionHeader('📊 Your Holdings (${portfolio.holdings.length})'),
              _buildHoldingsList(context, portfolio.holdings),
              const SizedBox(height: 40),
            ],
          ),
        );
      }),
    );
  }

  // FIXED: Changed List<PortfolioStockValueModel> to List<HoldingModel>
  Widget _buildHoldingsList(BuildContext context, List<HoldingModel> holdings) {
    final format = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 2);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: holdings.length,
      itemBuilder: (context, index) {
        final holding = holdings[index];
        final pnlColor = controller.getPNLColor(holding.profitLoss);
        final String sign = holding.profitLoss > 0 ? '+' : '';

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Card(
            color: Theme.of(context).cardColor,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                holding.ticker,
                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Qty: ${holding.quantity} @ ${format.format(holding.avgBuyPrice)}',
                    style: GoogleFonts.poppins(color: Colors.white54, fontSize: 13),
                  ),
                  Text(
                    'Invested: ${format.format(holding.investment)}',
                    style: GoogleFonts.poppins(color: Colors.white54, fontSize: 13),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    format.format(holding.currentValue),
                    style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '$sign${format.format(holding.profitLoss)} (${holding.profitLossPct.toStringAsFixed(2)}%)',
                    style: GoogleFonts.poppins(color: pnlColor, fontSize: 14),
                  ),
                ],
              ),
              onLongPress: () => _showSellHoldingDialog(context, holding),
            ),
          ),
        );
      },
    );
  }

  // FIXED: Changed PortfolioStockValueModel to HoldingModel
  void _showSellHoldingDialog(BuildContext context, HoldingModel holding) {
    final quantityController = TextEditingController();
    final sellPriceController = TextEditingController(text: holding.currentPrice.toStringAsFixed(2));
    final notesController = TextEditingController();

    Get.defaultDialog(
        title: 'Sell ${holding.ticker}',
        titleStyle: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey.shade900,
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          children: [
            Text(
              'Available to Sell: ${holding.quantity}',
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: quantityController,
              decoration: _inputDecoration(labelText: 'Quantity to Sell'),
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: sellPriceController,
              decoration: _inputDecoration(labelText: 'Sell Price'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: notesController,
              decoration: _inputDecoration(labelText: 'Notes (Optional)'),
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel', style: GoogleFonts.poppins(color: Colors.white70)),
          ),
          TextButton(
            onPressed: () async {
              final quantity = int.tryParse(quantityController.text.trim()) ?? 0;
              final sellPrice = double.tryParse(sellPriceController.text.trim()) ?? 0.0;

              if (quantity <= 0 || sellPrice <= 0 || quantity > holding.quantity) {
                Get.snackbar(
                  'Input Error',
                  'Please enter a valid Quantity (max ${holding.quantity}) and Sell Price.',
                  backgroundColor: Colors.orange.shade400,
                  colorText: Colors.white,
                );
                return;
              }

              // Close dialog before calling API
              Get.back();
              await controller.sellHolding(
                ticker: holding.ticker,
                quantity: quantity,
                sellPrice: sellPrice,
                notes: notesController.text.trim(),
              );
            },
            child: Text('Confirm Sale', style: GoogleFonts.poppins(color: Colors.redAccent)),
          ),
        ]
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSummaryCard(PortfolioValueModel portfolio) {
    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 2);
    final pnlColor = controller.getPNLColor(portfolio.totalProfitLoss);

    return Card(
      color: Get.theme.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overall Portfolio', style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14)),
            const Divider(color: Colors.white10),
            _buildSummaryRow('Total Investment', currencyFormat.format(portfolio.totalInvestment), Colors.white),
            _buildSummaryRow('Current Value', currencyFormat.format(portfolio.totalCurrentValue), Colors.white),
            const Divider(color: Colors.white10, height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total P&L', style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      currencyFormat.format(portfolio.totalProfitLoss),
                      style: GoogleFonts.poppins(color: pnlColor, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${portfolio.totalProfitLossPct.toStringAsFixed(2)}%',
                      style: GoogleFonts.poppins(color: pnlColor, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16)),
          Text(value, style: GoogleFonts.poppins(color: color, fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({required String labelText}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: GoogleFonts.poppins(color: Colors.white54),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white24),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blueAccent),
      ),
    );
  }
}

// Dialog for adding a new holding
class AddHoldingDialog extends StatelessWidget {
  final PortfolioController controller = Get.find<PortfolioController>();
  final TextEditingController tickerController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  AddHoldingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Holding', style: GoogleFonts.poppins(color: Colors.white)),
      backgroundColor: Get.theme.cardColor,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: tickerController,
              decoration: _inputDecoration('Ticker (e.g., RELIANCE)', Icons.search),
              style: GoogleFonts.poppins(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: _inputDecoration('Quantity', Icons.numbers),
              style: GoogleFonts.poppins(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: _inputDecoration('Buy Price', Icons.currency_rupee),
              style: GoogleFonts.poppins(color: Colors.white70),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel', style: GoogleFonts.poppins(color: Colors.white54)),
        ),
        ElevatedButton(
          onPressed: () {
            final ticker = tickerController.text.toUpperCase();
            final quantity = int.tryParse(quantityController.text) ?? 0;
            final price = double.tryParse(priceController.text) ?? 0.0;

            if (ticker.isNotEmpty && quantity > 0 && price > 0) {
              controller.addStock(ticker: ticker, quantity: quantity, buyPrice: price);
              Get.back();
            } else {
              Get.snackbar('Validation', 'Please enter valid values.', backgroundColor: Colors.yellow.shade800);
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text('Add', style: GoogleFonts.poppins(color: Colors.white)),
        ),
      ],
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
    );
  }
}