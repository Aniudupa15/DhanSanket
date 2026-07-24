import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../bloc/watchlist_detail_bloc.dart';
import '../bloc/watchlist_detail_event.dart';
import '../bloc/watchlist_detail_state.dart';
import '../widgets/watchlist_item_tile.dart';

class WatchlistDetailPage extends StatefulWidget {
  final String watchlistId;

  const WatchlistDetailPage({super.key, required this.watchlistId});

  @override
  State<WatchlistDetailPage> createState() => _WatchlistDetailPageState();
}

class _WatchlistDetailPageState extends State<WatchlistDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<WatchlistDetailBloc>().add(WatchlistDetailRequested(widget.watchlistId));
  }

  Future<void> _addSymbol() async {
    final controller = TextEditingController();
    final symbol = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add symbol'),
          content: TextField(
            controller: controller,
            autofocus: true,
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(labelText: 'Symbol (e.g. RELIANCE)'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
            FilledButton(
              onPressed: () {
                final value = controller.text.trim();
                if (value.isNotEmpty) Navigator.of(context).pop(value);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
    if (symbol != null && mounted) {
      context.read<WatchlistDetailBloc>().add(WatchlistItemAddRequested(widget.watchlistId, symbol.toUpperCase()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
        actions: [IconButton(icon: const Icon(Icons.add), tooltip: 'Add symbol', onPressed: _addSymbol)],
      ),
      body: BlocBuilder<WatchlistDetailBloc, WatchlistDetailState>(
        builder: (context, state) {
          return switch (state) {
            WatchlistDetailInitial() || WatchlistDetailLoading() => const AppLoadingView(),
            WatchlistDetailError(:final failure) => AppErrorView(
              message: failure.message,
              onRetry: () => context.read<WatchlistDetailBloc>().add(WatchlistDetailRequested(widget.watchlistId)),
            ),
            WatchlistDetailLoaded(:final detail) =>
              detail.items.isEmpty
                  ? const Center(child: Text('No symbols in this watchlist yet.'))
                  : ListView.builder(
                      itemCount: detail.items.length,
                      itemBuilder: (context, index) {
                        final item = detail.items[index];
                        return WatchlistItemTile(
                          item: item,
                          onTap: () => context.push(RoutePaths.stockDetail(item.symbol)),
                          onRemove: () => context.read<WatchlistDetailBloc>().add(
                            WatchlistItemRemoveRequested(widget.watchlistId, item.symbol),
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
