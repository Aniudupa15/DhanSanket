import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_skeleton_loader.dart';
import '../bloc/alert_bloc.dart';
import '../bloc/alert_event.dart';
import '../bloc/alert_state.dart';
import '../widgets/alert_tile.dart';
import '../widgets/create_alert_dialog.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  @override
  void initState() {
    super.initState();
    context.read<AlertBloc>().add(const AlertsRequested());
  }

  Future<void> _create() async {
    final result = await showCreateAlertDialog(context);
    if (result != null && mounted) {
      context.read<AlertBloc>().add(
        AlertCreateRequested(symbol: result.symbol, alertType: result.alertType, condition: result.condition),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price Alerts'),
        actions: [
          IconButton.filledTonal(icon: const Icon(Icons.add, size: 20), tooltip: 'New alert', onPressed: _create),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<AlertBloc, AlertState>(
        builder: (context, state) {
          return switch (state) {
            AlertInitial() || AlertLoading() => ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: 4,
              separatorBuilder: (_, _) => const Divider(height: 1, indent: 68),
              itemBuilder: (_, _) => const StockTileSkeleton(),
            ),
            AlertError(:final failure) => AppErrorView(
              message: failure.message,
              onRetry: () => context.read<AlertBloc>().add(const AlertsRequested()),
            ),
            AlertLoaded(:final alerts) =>
              alerts.isEmpty
                  ? AppEmptyState(
                      icon: Icons.notifications_active_outlined,
                      title: 'No alerts yet.',
                      message:
                          'Get push notifications when your target stock prices or technical conditions are triggered.',
                      actionLabel: 'Create one',
                      onAction: _create,
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: alerts.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final alert = alerts[index];
                        return AlertTile(
                          alert: alert,
                          onDelete: () => context.read<AlertBloc>().add(AlertDeleteRequested(alert.id)),
                        );
                      },
                    ),
          };
        },
      ),
    );
  }
}
