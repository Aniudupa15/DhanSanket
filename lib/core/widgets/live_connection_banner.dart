import 'package:flutter/material.dart';

import '../network/live_socket_service.dart';

/// Shown only once the live socket has actually dropped after being used -
/// there's no banner at app start before any screen has subscribed to
/// anything, since `LiveSocketService` connects lazily on first subscribe.
/// Distinct from [OfflineBanner]: this reflects the `/ws/live` connection
/// specifically, not general device connectivity.
class LiveConnectionBanner extends StatelessWidget {
  final LiveSocketService liveSocketService;

  const LiveConnectionBanner({super.key, required this.liveSocketService});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: liveSocketService.connectionStatus,
      builder: (context, snapshot) {
        if (snapshot.data != false) return const SizedBox.shrink();
        return Material(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.wifi_off, size: 18, color: Theme.of(context).colorScheme.onTertiaryContainer),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Reconnecting live updates...',
                      style: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
