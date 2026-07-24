import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlists'),
        actions: [IconButton(icon: const Icon(Icons.add), tooltip: 'New watchlist', onPressed: _create)],
      ),
      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          return switch (state) {
            WatchlistInitial() || WatchlistLoading() => const AppLoadingView(),
            WatchlistError(:final failure) => AppErrorView(
              message: failure.message,
              onRetry: () => context.read<WatchlistBloc>().add(const WatchlistsRequested()),
            ),
            WatchlistLoaded(:final watchlists) =>
              watchlists.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('No watchlists yet.'),
                          const SizedBox(height: 12),
                          FilledButton(onPressed: _create, child: const Text('Create one')),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: watchlists.length,
                      itemBuilder: (context, index) {
                        final watchlist = watchlists[index];
                        return Dismissible(
                          key: ValueKey(watchlist.id),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Theme.of(context).colorScheme.errorContainer,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Icon(Icons.delete_outline),
                          ),
                          onDismissed: (_) => context.read<WatchlistBloc>().add(WatchlistDeleteRequested(watchlist.id)),
                          child: ListTile(
                            title: Text(watchlist.name),
                            subtitle: Text('${watchlist.itemCount} stock(s)'),
                            onTap: () => context.push(RoutePaths.watchlistDetail(watchlist.id)),
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
