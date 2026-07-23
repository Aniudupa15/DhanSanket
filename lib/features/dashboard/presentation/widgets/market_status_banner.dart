import 'package:flutter/material.dart';

import '../../domain/entities/market_status.dart';

class MarketStatusBanner extends StatelessWidget {
  final List<MarketStatus> statuses;

  const MarketStatusBanner({super.key, required this.statuses});

  @override
  Widget build(BuildContext context) {
    if (statuses.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: statuses.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final status = statuses[index];
          final isOpen = status.status.toLowerCase() == 'open';
          return Chip(
            label: Text('${status.market}: ${status.status}'),
            avatar: Icon(
              isOpen ? Icons.circle : Icons.circle_outlined,
              size: 12,
              color: isOpen ? Colors.green : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
