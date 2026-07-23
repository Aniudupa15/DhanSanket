// lib/views/watchlist_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controllers/market_controller.dart';
import '../controllers/watchlist_controller.dart';
import '../models/watchlist_model.dart';

class WatchlistView extends StatelessWidget {
  final WatchlistController controller = Get.put(WatchlistController());
  final MarketController marketcontroller = Get.put(MarketController());


  WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final status = marketcontroller.marketStatus.value;
          return Row(
            children: [
              Text(
                'Watchlist',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => Get.dialog(AddWatchlistDialog()),
            color: Colors.blueAccent,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchWatchlistData,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${controller.errorMessage.value}', style: GoogleFonts.poppins(color: Colors.redAccent)));
        }
        if (controller.watchlist.isEmpty) {
          return Center(child: Text('Your watchlist is empty. Add a stock to track!', style: GoogleFonts.poppins(color: Colors.blueGrey)));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.watchlist.length,
          itemBuilder: (context, index) {
            final item = controller.watchlist[index];
            return _buildWatchlistItem(item);
          },
        );
      }),
    );
  }

  Widget _buildWatchlistItem(WatchlistItemModel item) {
    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 2);
    final targetPrice = item.targetPrice != null ? currencyFormat.format(item.targetPrice) : 'N/A';

    return Card(
      color: Get.theme.cardColor,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: const Icon(Icons.star, color: Colors.amber),
        title: Text(
          item.ticker,
          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Target Price: $targetPrice',
              style: GoogleFonts.poppins(color: Colors.white54, fontSize: 14),
            ),
            if (item.notes != null && item.notes!.isNotEmpty)
              Text(
                'Notes: ${item.notes}',
                style: GoogleFonts.poppins(color: Colors.cyan.shade200, fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
        onTap: () {
          // Future implementation: Navigate to detailed analysis view
          Get.snackbar(item.ticker, 'Target: $targetPrice', backgroundColor: Colors.blue.shade800);
        },
      ),
    );
  }
}

// Dialog for adding a new watchlist item
class AddWatchlistDialog extends StatelessWidget {
  final WatchlistController controller = Get.find<WatchlistController>();
  final TextEditingController tickerController = TextEditingController();
  final TextEditingController targetPriceController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  AddWatchlistDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add to Watchlist', style: GoogleFonts.poppins(color: Colors.white)),
      backgroundColor: Get.theme.cardColor,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: tickerController,
              decoration: _inputDecoration('Ticker (e.g., INFY)', Icons.search),
              style: GoogleFonts.poppins(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: targetPriceController,
              keyboardType: TextInputType.number,
              decoration: _inputDecoration('Target Price (Optional)', Icons.currency_rupee),
              style: GoogleFonts.poppins(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: notesController,
              decoration: _inputDecoration('Notes (Optional)', Icons.edit),
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
            final targetPrice = double.tryParse(targetPriceController.text);
            final notes = notesController.text.trim().isNotEmpty ? notesController.text.trim() : null;

            if (ticker.isNotEmpty) {
              controller.addWatchlistItem(ticker: ticker, targetPrice: targetPrice, notes: notes);
              Get.back();
            } else {
              Get.snackbar('Validation', 'Please enter a ticker symbol.', backgroundColor: Colors.yellow.shade800);
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
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