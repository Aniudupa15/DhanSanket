import 'package:flutter/material.dart';

import '../network/connectivity_service.dart';

/// A persistent banner shown at the top of every screen while the device
/// itself has no network path - distinct from a `Failure` coming back from a
/// reachable-but-erroring server (that case is handled per-screen by
/// `AppErrorView`, which offers a retry instead of just "you're offline").
class OfflineBanner extends StatefulWidget {
  final ConnectivityService connectivityService;

  const OfflineBanner({super.key, required this.connectivityService});

  @override
  State<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends State<OfflineBanner> {
  bool? _isOnline;

  @override
  void initState() {
    super.initState();
    widget.connectivityService.checkIsOnline().then((isOnline) {
      if (mounted) setState(() => _isOnline = isOnline);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.connectivityService.onStatusChanged,
      initialData: _isOnline,
      builder: (context, snapshot) {
        final isOnline = snapshot.data ?? _isOnline ?? true;
        if (isOnline) return const SizedBox.shrink();
        return Material(
          color: Theme.of(context).colorScheme.errorContainer,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.wifi_off, size: 18, color: Theme.of(context).colorScheme.onErrorContainer),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'No internet connection',
                      style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
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
