class AppNotification {
  final String id;
  final String? alertId;
  final String title;
  final String message;
  final DateTime createdAt;
  final DateTime? readAt;

  const AppNotification({
    required this.id,
    required this.alertId,
    required this.title,
    required this.message,
    required this.createdAt,
    required this.readAt,
  });

  bool get isRead => readAt != null;
}
