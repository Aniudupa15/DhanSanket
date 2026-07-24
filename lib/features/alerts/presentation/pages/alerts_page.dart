import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
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
        title: const Text('Alerts'),
        actions: [IconButton(icon: const Icon(Icons.add), tooltip: 'New alert', onPressed: _create)],
      ),
      body: BlocBuilder<AlertBloc, AlertState>(
        builder: (context, state) {
          return switch (state) {
            AlertInitial() || AlertLoading() => const AppLoadingView(),
            AlertError(:final failure) => AppErrorView(
              message: failure.message,
              onRetry: () => context.read<AlertBloc>().add(const AlertsRequested()),
            ),
            AlertLoaded(:final alerts) =>
              alerts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('No alerts yet.'),
                          const SizedBox(height: 12),
                          FilledButton(onPressed: _create, child: const Text('Create one')),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: alerts.length,
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
