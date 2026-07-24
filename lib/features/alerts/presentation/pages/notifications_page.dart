import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
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
            NotificationInitial() || NotificationLoading() => const AppLoadingView(),
            NotificationError(:final failure) => AppErrorView(
              message: failure.message,
              onRetry: () => context.read<NotificationBloc>().add(const NotificationsRequested()),
            ),
            NotificationLoaded(:final notifications) =>
              notifications.isEmpty
                  ? const Center(child: Text('No notifications yet.'))
                  : RefreshIndicator(
                      onRefresh: () async => context.read<NotificationBloc>().add(const NotificationsRequested()),
                      child: ListView.builder(
                        itemCount: notifications.length,
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
