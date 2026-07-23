
// ============================================================
// FILE 2: lib/controllers/utility_controller.dart
// ============================================================

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/api_constants.dart';
import '../models/utility_model.dart';

class UtilityController extends GetxController {
  final String baseUrl = API_BASE_URL; // Change to your API URL

  var isLoadingReminders = false.obs;
  var reminderMessage = ''.obs;
  var reminders = <ReminderModel>[].obs;

  @override
  void onInit() {
    fetchReminders();
    super.onInit();
  }

  Future<void> fetchReminders() async {
    isLoadingReminders.value = true;
    reminderMessage.value = '';
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/reminders'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final remindersList = (data['reminders'] as List)
            .map((json) => ReminderModel.fromJson(json))
            .toList();
        reminders.assignAll(remindersList);
      } else {
        reminderMessage.value = 'Failed to load reminders: ${response.statusCode}';
      }
    } catch (e) {
      reminderMessage.value = 'Failed to load reminders: ${e.toString()}';
      print('Error fetching reminders: $e');
    } finally {
      isLoadingReminders.value = false;
    }
  }

  Future<bool> createNewReminder({
    required String title,
    required String message,
    required String reminderTime,
    String reminderType = 'GENERAL',
    String? ticker,
  }) async {
    try {
      final requestBody = {
        'title': title,
        'message': message,
        'reminder_time': reminderTime,
        'reminder_type': reminderType,
      };

      if (ticker != null && ticker.isNotEmpty) {
        requestBody['ticker'] = ticker;
      }

      final response = await http.post(
        Uri.parse('$baseUrl/reminders'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        // Refresh list after successful creation
        await fetchReminders();

        Get.snackbar(
          'Reminder Set',
          'New reminder "$title" scheduled.',
          backgroundColor: Colors.green.shade600,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
        return true;
      } else {
        throw Exception('Failed to create reminder: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to set reminder: ${e.toString()}',
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      return false;
    }
  }

  Future<void> sendPortfolioEmail(String recipient) async {
    try {
      Get.snackbar(
        'Sending Email',
        'Requesting portfolio summary to $recipient...',
        backgroundColor: Colors.blue.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );

      final response = await http.post(
        Uri.parse('$baseUrl/email/portfolio-summary?to_email=$recipient'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Portfolio summary emailed to $recipient.',
          backgroundColor: Colors.green.shade600,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      } else {
        throw Exception('Failed to send email: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        'Email Error',
        'Failed to send email: ${e.toString()}',
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
