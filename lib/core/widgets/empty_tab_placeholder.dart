import 'package:flutter/material.dart';

/// Shown for shell tabs whose real feature hasn't been built yet (Phase
/// 2/3). Proves the shell/tab navigation works without building the
/// feature early.
class EmptyTabPlaceholder extends StatelessWidget {
  final String label;
  final IconData icon;

  const EmptyTabPlaceholder({super.key, required this.label, this.icon = Icons.construction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: Theme.of(context).colorScheme.outline),
            const SizedBox(height: 12),
            Text('$label - coming soon', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
