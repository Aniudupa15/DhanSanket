import 'package:flutter/material.dart';

import '../../../../bootstrap/injector.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/search_history_entry.dart';
import '../../domain/repositories/stock_repository.dart';

/// Shown only while the search field is empty (`StockSearchInitial`). Talks
/// to `StockRepository` directly rather than through `StockSearchBloc` -
/// same one-shot-direct-repository-call pattern as `AddToWatchlistSheet`,
/// since this is a small, independent side read that doesn't belong in the
/// search results Bloc's state shape.
class RecentSearchesSection extends StatefulWidget {
  final ValueChanged<String> onSelect;

  const RecentSearchesSection({super.key, required this.onSelect});

  @override
  State<RecentSearchesSection> createState() => _RecentSearchesSectionState();
}

class _RecentSearchesSectionState extends State<RecentSearchesSection> {
  List<SearchHistoryEntry>? _entries;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final result = await getIt<StockRepository>().getSearchHistory();
    if (!mounted) return;
    setState(() {
      _entries = switch (result) {
        Success(data: final entries) => entries,
        Error() => const [],
      };
    });
  }

  Future<void> _clear() async {
    await getIt<StockRepository>().clearSearchHistory();
    if (!mounted) return;
    setState(() => _entries = const []);
  }

  @override
  Widget build(BuildContext context) {
    final entries = _entries;
    if (entries == null) return const SizedBox.shrink();
    if (entries.isEmpty) {
      return const Center(child: Text('Start typing to search real NSE stocks.'));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent searches', style: Theme.of(context).textTheme.titleMedium),
              TextButton(onPressed: _clear, child: const Text('Clear')),
            ],
          ),
          Wrap(
            spacing: 8,
            children: [
              for (final entry in entries)
                ActionChip(label: Text(entry.query), onPressed: () => widget.onSelect(entry.query)),
            ],
          ),
        ],
      ),
    );
  }
}
