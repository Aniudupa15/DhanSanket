import 'dart:async';

import 'package:flutter/material.dart';

import '../market/market_hours.dart';

/// A persistent, app-wide banner (mounted in `bootstrap/app.dart` alongside
/// `OfflineBanner`, so it's visible on every screen regardless of the active
/// tab) showing the current NSE session and a countdown to the next
/// transition - e.g. "Market Open · Closes in 2h 14m".
class MarketHoursBanner extends StatefulWidget {
  const MarketHoursBanner({super.key});

  @override
  State<MarketHoursBanner> createState() => _MarketHoursBannerState();
}

class _MarketHoursBannerState extends State<MarketHoursBanner> {
  late Timer _timer;
  late MarketHoursStatus _status;

  @override
  void initState() {
    super.initState();
    _status = MarketHours.statusAt(DateTime.now());
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      setState(() => _status = MarketHours.statusAt(DateTime.now()));
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final (label, color) = switch (_status.session) {
      MarketSession.open => ('Market Open', Colors.green),
      MarketSession.preOpen => ('Pre-Market', Colors.amber),
      MarketSession.afterHours => ('After Hours', Colors.orange),
      MarketSession.closed => ('Market Closed', colorScheme.outline),
    };
    final transitionLabel = _status.isNextTransitionOpen ? 'Opens in' : 'Closes in';

    return Material(
      color: colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Icon(Icons.circle, size: 10, color: color),
            const SizedBox(width: 8),
            Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Text(
              '$transitionLabel ${_formatDuration(_status.timeUntilNextTransition)}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    if (hours > 0) return '${hours}h ${minutes}m';
    return '${minutes}m';
  }
}
