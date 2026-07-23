// ============================================================
// FILE 1: lib/models/utility_model.dart
// ============================================================

// Model for GET /reminders response
class ReminderModel {
  final String title;
  final String message;
  final String reminderTime;
  final String reminderType;
  final String? ticker;
  final String status;

  ReminderModel({
    required this.title,
    required this.message,
    required this.reminderTime,
    required this.reminderType,
    this.ticker,
    required this.status,
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      title: json['title'] ?? 'N/A',
      message: json['message'] ?? 'N/A',
      reminderTime: json['reminder_time'] ?? 'N/A',
      reminderType: json['reminder_type'] ?? 'GENERAL',
      ticker: json['ticker'],
      status: json['status'] ?? 'ACTIVE',
    );
  }
}

// Request Body for POST /reminders
class CreateReminderRequest {
  final String title;
  final String message;
  final String reminderTime;
  final String reminderType;
  final String? ticker;

  CreateReminderRequest({
    required this.title,
    required this.message,
    required this.reminderTime,
    this.reminderType = 'GENERAL',
    this.ticker,
  });

  Map<String, dynamic> toJson() {
    final map = {
      'title': title,
      'message': message,
      'reminder_time': reminderTime,
      'reminder_type': reminderType,
    };

    if (ticker != null && ticker!.isNotEmpty) {
      map['ticker'] = ticker!;
    }

    return map;
  }
}

// Request Body for POST /email/send
class SendEmailRequest {
  final String toEmail;
  final String subject;
  final String body;
  final String? bodyHtml;

  SendEmailRequest({
    required this.toEmail,
    required this.subject,
    required this.body,
    this.bodyHtml,
  });

  Map<String, dynamic> toJson() {
    final map = {
      'to_email': toEmail,
      'subject': subject,
      'body': body,
    };

    if (bodyHtml != null) {
      map['body_html'] = bodyHtml!;
    }

    return map;
  }
}
