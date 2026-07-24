import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bootstrap/injector.dart';
import '../../../../core/error/result.dart';
import '../../../watchlist/domain/repositories/watchlist_repository.dart';
import '../../../watchlist/presentation/bloc/watchlist_bloc.dart';
import '../../../watchlist/presentation/bloc/watchlist_event.dart';
import '../../../watchlist/presentation/bloc/watchlist_state.dart';
import '../../../watchlist/presentation/widgets/create_watchlist_dialog.dart';

/// A simple picker bottom sheet, not a full page - lists the user's
/// watchlists (fetched fresh via a throwaway [WatchlistBloc] instance) with
/// a "+ New watchlist" inline option, then adds [symbol] to whichever one
/// is tapped via the shared [WatchlistRepository] directly (no need to
/// dispatch through a persistent screen's Bloc for a one-shot action).
Future<void> showAddToWatchlistSheet(BuildContext context, String symbol) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) {
      return BlocProvider(
        create: (_) => getIt<WatchlistBloc>()..add(const WatchlistsRequested()),
        child: _AddToWatchlistContent(symbol: symbol),
      );
    },
  );
}

class _AddToWatchlistContent extends StatelessWidget {
  final String symbol;

  const _AddToWatchlistContent({required this.symbol});

  Future<void> _addTo(BuildContext context, String watchlistId) async {
    final repository = getIt<WatchlistRepository>();
    final result = await repository.addItem(watchlistId, symbol);
    if (!context.mounted) return;
    Navigator.of(context).pop();
    final message = switch (result) {
      Success() => 'Added $symbol to watchlist.',
      Error() => 'Could not add $symbol to that watchlist.',
    };
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _createAndAdd(BuildContext context) async {
    final name = await showCreateWatchlistDialog(context);
    if (name == null || !context.mounted) return;
    final repository = getIt<WatchlistRepository>();
    final createResult = await repository.create(name);
    if (!context.mounted) return;
    if (createResult case Success(:final data)) {
      await _addTo(context, data.id);
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not create watchlist.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add $symbol to a watchlist', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            BlocBuilder<WatchlistBloc, WatchlistState>(
              builder: (context, state) {
                return switch (state) {
                  WatchlistLoaded(:final watchlists) =>
                    watchlists.isEmpty
                        ? const Padding(padding: EdgeInsets.all(8), child: Text('No watchlists yet.'))
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: watchlists
                                .map((w) => ListTile(title: Text(w.name), onTap: () => _addTo(context, w.id)))
                                .toList(),
                          ),
                  WatchlistError() => const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Could not load your watchlists.'),
                  ),
                  _ => const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                };
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('New watchlist'),
              onTap: () => _createAndAdd(context),
            ),
          ],
        ),
      ),
    );
  }
}
