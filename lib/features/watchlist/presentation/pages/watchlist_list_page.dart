import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_skeleton_loader.dart';
import '../bloc/watchlist_bloc.dart';
import '../bloc/watchlist_event.dart';
import '../bloc/watchlist_state.dart';
import '../widgets/create_watchlist_dialog.dart';

class WatchlistListPage extends StatefulWidget {
  const WatchlistListPage({super.key});

  @override
  State<WatchlistListPage> createState() => _WatchlistListPageState();
}

class _WatchlistListPageState extends State<WatchlistListPage> {
  @override
  void initState() {
    super.initState();
    context.read<WatchlistBloc>().add(const WatchlistsRequested());
  }

  Future<void> _create() async {
    final name = await showCreateWatchlistDialog(context);
    if (name != null && mounted) {
      context.read<WatchlistBloc>().add(WatchlistCreateRequested(name));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlists'),
        actions: [
          IconButton.filledTonal(
            icon: const Icon(Icons.add, size: 20),
            tooltip: 'New watchlist',
            onPressed: _create,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          return switch (state) {
            WatchlistInitial() || WatchlistLoading() => ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: 5,
                separatorBuilder: (_, __) => const Divider(height: 1, indent: 68),
                itemBuilder: (_, __) => const StockTileSkeleton(),
              ),
            WatchlistError(:final failure) => AppErrorView(
                message: failure.message,
                onRetry: () => context.read<WatchlistBloc>().add(const WatchlistsRequested()),
              ),
            WatchlistLoaded(:final watchlists) => watchlists.isEmpty
                ? AppEmptyState(
                    icon: Icons.star_outline_rounded,
                    title: 'No watchlists yet.',
                    message: 'Create custom watchlists to track your favorite stocks in real-time.',
                    actionLabel: 'Create one',
                    onAction: _create,
                  )


                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: watchlists.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final watchlist = watchlists[index];
                      return Dismissible(
                        key: ValueKey(watchlist.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.delete_outline,
                            color: theme.colorScheme.onErrorContainer,
                          ),
                        ),
                        onDismissed: (_) => context.read<WatchlistBloc>().add(WatchlistDeleteRequested(watchlist.id)),
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            leading: CircleAvatar(
                              backgroundColor: theme.colorScheme.primaryContainer,
                              child: Icon(
                                Icons.star_rounded,
                                color: theme.colorScheme.primary,
                                size: 20,
                              ),
                            ),
                            title: Text(
                              watchlist.name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              '${watchlist.itemCount} stock(s)',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            trailing: const Icon(Icons.chevron_right, size: 20),
                            onTap: () => context.push(RoutePaths.watchlistDetail(watchlist.id)),
                          ),
                        ),
                      );
                    },
                  ),
          };
        },
      ),
    );
  }
}

