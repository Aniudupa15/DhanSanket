
// ============================================================
// FILE 3: lib/views/utility_view.dart (FIXED)
// ============================================================

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/comparison_controller.dart';
import '../models/market_model.dart';
import '../controllers/utility_controller.dart';

class UtilityView extends StatelessWidget {
  final ComparisonController comparisonController = Get.put(ComparisonController());
  final UtilityController utilityController = Get.put(UtilityController());

  UtilityView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Utilities & Insights',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blueAccent,
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.normal),
            tabs: const [
              Tab(text: 'Stock Compare', icon: Icon(Icons.compare_arrows)),
              Tab(text: 'Market Calendar', icon: Icon(Icons.calendar_today)),
              Tab(text: 'Automation & Tools', icon: Icon(Icons.settings_suggest)),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: TabBarView(
          children: [
            _buildStockComparisonTab(context),
            _buildMarketCalendarTab(context),
            _buildAutomationTab(context),
          ],
        ),
      ),
    );
  }

  // --- TAB 1: Stock Compare ---
  Widget _buildStockComparisonTab(BuildContext context) {
    final tickerInputController = TextEditingController(text: comparisonController.comparisonTickers.value);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Stock Selection'),
          Text(
            'Enter 2-10 stock tickers separated by commas (e.g., RELIANCE, TCS, INFY).',
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: tickerInputController,
            style: GoogleFonts.poppins(color: Colors.white),
            decoration: _inputDecoration(labelText: 'Tickers to Compare'),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => comparisonController.compareStocks(tickerInputController.text.trim()),
              icon: const Icon(Icons.search),
              label: Text('Compare Stocks', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildSectionHeader('Comparison Metrics'),
          _buildComparisonTable(context),
        ],
      ),
    );
  }

  Widget _buildComparisonTable(BuildContext context) {
    return Obx(() {
      if (comparisonController.isLoading.value) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: CircularProgressIndicator(),
          ),
        );
      }

      final data = comparisonController.comparedStocks;

      if (comparisonController.errorMessage.isNotEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                const SizedBox(height: 16),
                Text(
                  'Error: ${comparisonController.errorMessage.value}',
                  style: GoogleFonts.poppins(color: Colors.redAccent, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }

      if (data.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const Icon(Icons.compare_arrows, size: 48, color: Colors.white38),
                const SizedBox(height: 16),
                Text(
                  'Enter tickers and click Compare to view data.',
                  style: GoogleFonts.poppins(color: Colors.white54, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }

      // Define metrics to display
      final metrics = {
        'Rank': (stock) => '#${stock.performanceRank}',
        'Current Price': (stock) => '₹${stock.currentPrice.toStringAsFixed(2)}',
        'Return %': (stock) => '${stock.periodReturnPct.toStringAsFixed(2)}%',
        'Volatility': (stock) => '${stock.volatility.toStringAsFixed(2)}%',
        '52W High': (stock) => '₹${stock.high52Week.toStringAsFixed(2)}',
        '52W Low': (stock) => '₹${stock.low52Week.toStringAsFixed(2)}',
        'Avg Volume': (stock) => _formatVolume(stock.avgVolume),
        'Signal': (stock) => stock.technicalSignal,
      };

      return Card(
        color: Theme.of(context).cardColor,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.blueGrey.shade900,
            ),
            dataRowMinHeight: 48,
            dataRowMaxHeight: 60,
            columnSpacing: 20,
            horizontalMargin: 12,
            columns: [
              DataColumn(
                label: Text(
                  'Metric',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              ...data.map((stock) => DataColumn(
                label: Text(
                  stock.ticker.replaceAll('.NS', ''),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent,
                    fontSize: 13,
                  ),
                ),
              )),
            ],
            rows: metrics.keys.map((metricName) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      metricName,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  ...data.map((stock) {
                    final metricValue = metrics[metricName]!(stock);

                    Color textColor = Colors.white;

                    // Color coding based on metric type
                    if (metricName == 'Signal') {
                      textColor = comparisonController.getSignalColor(metricValue);
                    } else if (metricName == 'Return %') {
                      final returnPct = stock.periodReturnPct;
                      textColor = returnPct > 0 ? Colors.green : Colors.red;
                    } else if (metricName == 'Rank') {
                      textColor = stock.performanceRank == 1
                          ? Colors.amber
                          : Colors.white70;
                    }

                    return DataCell(
                      Text(
                        metricValue,
                        style: GoogleFonts.poppins(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: metricName == 'Signal' || metricName == 'Rank'
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    );
                  }),
                ],
              );
            }).toList(),
          ),
        ),
      );
    });
  }

// Helper function for formatting volume
  String _formatVolume(double volume) {
    if (volume >= 1e7) {
      return '${(volume / 1e7).toStringAsFixed(2)}Cr';
    } else if (volume >= 1e5) {
      return '${(volume / 1e5).toStringAsFixed(2)}L';
    } else if (volume >= 1e3) {
      return '${(volume / 1e3).toStringAsFixed(2)}K';
    } else {
      return volume.toStringAsFixed(0);
    }
  }

  // --- TAB 2: Market Calendar ---
  Widget _buildMarketCalendarTab(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.calendar_today, size: 60, color: Colors.amber),
          const SizedBox(height: 10),
          Text(
            'Market Holiday & Event Calendar',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.snackbar(
                'Coming Soon',
                'Market calendar feature will be available soon!',
                backgroundColor: Colors.cyan,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Text('Load Calendar Events', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  // --- TAB 3: Automation & Tools ---
  Widget _buildAutomationTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('📧 Email Utilities'),
          _buildEmailTools(context),
          const SizedBox(height: 25),

          _buildSectionHeader('🔔 Set Reminders'),
          _buildReminderCreation(context),
          const SizedBox(height: 25),

          _buildSectionHeader('Scheduled Reminders'),
          _buildRemindersList(context),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildEmailTools(BuildContext context) {
    final recipientController = TextEditingController(text: 'user@example.com');

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipient Email:',
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: recipientController,
            style: GoogleFonts.poppins(color: Colors.white),
            decoration: _inputDecoration(labelText: 'Recipient Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                final email = recipientController.text.trim();
                if (email.isEmpty || !email.contains('@')) {
                  Get.snackbar(
                    'Invalid Email',
                    'Please enter a valid email address',
                    backgroundColor: Colors.orange,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }
                utilityController.sendPortfolioEmail(email);
              },
              icon: const Icon(Icons.send),
              label: Text(
                'Email Portfolio Summary',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderCreation(BuildContext context) {
    final titleController = TextEditingController();
    final messageController = TextEditingController();
    final tickerController = TextEditingController();
    final dateController = TextEditingController();
    final timeController = TextEditingController(text: '09:30:00');
    final selectedType = 'GENERAL'.obs;

    final reminderTypes = ['GENERAL', 'EARNINGS', 'DIVIDEND', 'PRICE_ALERT', 'MEETING'];

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: titleController,
            decoration: _inputDecoration(labelText: 'Title'),
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: messageController,
            decoration: _inputDecoration(labelText: 'Message'),
            style: GoogleFonts.poppins(color: Colors.white),
            maxLines: 2,
          ),
          const SizedBox(height: 10),

          // Date Picker
          TextField(
            controller: dateController,
            decoration: _inputDecoration(labelText: 'Date (YYYY-MM-DD)'),
            style: GoogleFonts.poppins(color: Colors.white),
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (date != null) {
                dateController.text = DateFormat('yyyy-MM-dd').format(date);
              }
            },
          ),
          const SizedBox(height: 10),

          TextField(
            controller: timeController,
            decoration: _inputDecoration(labelText: 'Time (HH:MM:SS)'),
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          const SizedBox(height: 10),

          // Reminder Type Dropdown
          Obx(() => DropdownButtonFormField<String>(
            value: selectedType.value,
            decoration: _inputDecoration(labelText: 'Reminder Type'),
            dropdownColor: Theme.of(context).cardColor,
            style: GoogleFonts.poppins(color: Colors.white),
            items: reminderTypes.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(type, style: GoogleFonts.poppins(color: Colors.white)),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) selectedType.value = value;
            },
          )),
          const SizedBox(height: 10),

          TextField(
            controller: tickerController,
            decoration: _inputDecoration(labelText: 'Stock Ticker (Optional)'),
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                final title = titleController.text.trim();
                final message = messageController.text.trim();
                final date = dateController.text.trim();
                final time = timeController.text.trim();
                final ticker = tickerController.text.trim();

                if (title.isEmpty || message.isEmpty) {
                  Get.snackbar(
                    'Validation Error',
                    'Title and message are required',
                    backgroundColor: Colors.orange,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                if (date.isEmpty) {
                  Get.snackbar(
                    'Validation Error',
                    'Please select a date',
                    backgroundColor: Colors.orange,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                // Combine date and time in ISO format
                final reminderTime = '${date}T$time';

                utilityController.createNewReminder(
                  title: title,
                  message: message,
                  reminderTime: reminderTime,
                  reminderType: selectedType.value,
                  ticker: ticker.isEmpty ? null : ticker,
                );

                // Clear form
                titleController.clear();
                messageController.clear();
                dateController.clear();
                timeController.text = '09:30:00';
                tickerController.clear();
              },
              icon: const Icon(Icons.alarm_add),
              label: Text('Create Reminder', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRemindersList(BuildContext context) {
    return Obx(() {
      if (utilityController.isLoadingReminders.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (utilityController.reminderMessage.isNotEmpty) {
        return Center(
          child: Text(
            '❌ ${utilityController.reminderMessage.value}',
            style: GoogleFonts.poppins(color: Colors.redAccent, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        );
      }

      if (utilityController.reminders.isEmpty) {
        return Center(
          child: Text(
            'No reminders currently set.',
            style: GoogleFonts.poppins(color: Colors.white54, fontSize: 16),
          ),
        );
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: utilityController.reminders.length,
        itemBuilder: (context, index) {
          final reminder = utilityController.reminders[index];

          // Parse reminder time
          String displayTime = 'Invalid time';
          try {
            final dateTime = DateTime.parse(reminder.reminderTime);
            displayTime = DateFormat('MMM dd, yyyy HH:mm').format(dateTime);
          } catch (e) {
            displayTime = reminder.reminderTime;
          }

          // Icon based on type
          IconData icon = Icons.alarm_on;
          Color iconColor = Colors.purpleAccent.shade200;

          switch (reminder.reminderType) {
            case 'EARNINGS':
              icon = Icons.attach_money;
              iconColor = Colors.green.shade300;
              break;
            case 'DIVIDEND':
              icon = Icons.payments;
              iconColor = Colors.blue.shade300;
              break;
            case 'PRICE_ALERT':
              icon = Icons.trending_up;
              iconColor = Colors.orange.shade300;
              break;
            case 'MEETING':
              icon = Icons.event;
              iconColor = Colors.pink.shade300;
              break;
          }

          return Card(
            color: Theme.of(context).cardColor,
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Icon(icon, color: iconColor, size: 32),
              title: Text(
                reminder.title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reminder.message,
                    style: GoogleFonts.poppins(color: Colors.white70),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14, color: Colors.cyanAccent),
                      const SizedBox(width: 4),
                      Text(
                        displayTime,
                        style: GoogleFonts.poppins(
                          color: Colors.cyanAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  if (reminder.ticker != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.show_chart, size: 14, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          reminder.ticker!,
                          style: GoogleFonts.poppins(
                            color: Colors.amber,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              trailing: Chip(
                label: Text(
                  reminder.status,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: reminder.status == 'ACTIVE'
                    ? Colors.green.shade700
                    : Colors.grey.shade700,
                padding: EdgeInsets.zero,
              ),
            ),
          );
        },
      );
    });
  }

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