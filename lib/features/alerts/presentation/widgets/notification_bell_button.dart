import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../bootstrap/injector.dart';
import '../../../../core/error/result.dart';
import '../../../../core/router/route_paths.dart';
import '../../domain/repositories/notification_repository.dart';

/// One-shot unread-count fetch on build, same direct-repository pattern as
/// `RecentSearchesSection` - too small a read to justify a Bloc of its own.
class NotificationBellButton extends StatefulWidget {
  const NotificationBellButton({super.key});

  @override
  State<NotificationBellButton> createState() => _NotificationBellButtonState();
}

class _NotificationBellButtonState extends State<NotificationBellButton> {
  int _unreadCount = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final result = await getIt<NotificationRepository>().list(unreadOnly: true, limit: 100);
    if (!mounted) return;
    if (result case Success(data: final notifications)) {
      setState(() => _unreadCount = notifications.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Badge(
        label: Text('$_unreadCount'),
        isLabelVisible: _unreadCount > 0,
        child: const Icon(Icons.notifications_outlined),
      ),
      tooltip: _unreadCount > 0 ? 'Notifications, $_unreadCount unread' : 'Notifications',
      onPressed: () => context.push(RoutePaths.notifications),
    );
  }
}
