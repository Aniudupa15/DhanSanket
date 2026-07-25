import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_skeleton_loader.dart';
import '../bloc/notification_bloc.dart';
import '../bloc/notification_event.dart';
import '../bloc/notification_state.dart';
import '../widgets/notification_tile.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(const NotificationsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return switch (state) {
            NotificationInitial() || NotificationLoading() => ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: 5,
                separatorBuilder: (_, __) => const Divider(height: 1, indent: 68),
                itemBuilder: (_, __) => const StockTileSkeleton(),
              ),
            NotificationError(:final failure) => AppErrorView(
                message: failure.message,
                onRetry: () => context.read<NotificationBloc>().add(const NotificationsRequested()),
              ),
            NotificationLoaded(:final notifications) => notifications.isEmpty
                ? const AppEmptyState(
                    icon: Icons.notifications_off_outlined,
                    title: 'No notifications',
                    message: 'You have no price alert notifications or system updates right now.',
                  )
                : RefreshIndicator(
                    onRefresh: () async => context.read<NotificationBloc>().add(const NotificationsRequested()),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: notifications.length,
                      separatorBuilder: (_, __) => const Divider(height: 1, indent: 68),
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return NotificationTile(
                          notification: notification,
                          onTap: () =>
                              context.read<NotificationBloc>().add(NotificationMarkReadRequested(notification.id)),
                        );
                      },
                    ),
                  ),
          };
        },
      ),
    );
  }
}

