import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_skeleton_loader.dart';
import '../bloc/stock_search_bloc.dart';
import '../bloc/stock_search_event.dart';
import '../bloc/stock_search_state.dart';
import '../widgets/recent_searches_section.dart';

class StockSearchPage extends StatefulWidget {
  const StockSearchPage({super.key});

  @override
  State<StockSearchPage> createState() => _StockSearchPageState();
}

class _StockSearchPageState extends State<StockSearchPage> {
  final _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {});
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      context.read<StockSearchBloc>().add(StockSearchQueryChanged(value));
    });
  }

  void _clearSearch() {
    _controller.clear();
    setState(() {});
    context.read<StockSearchBloc>().add(const StockSearchQueryChanged(''));
  }

  void _onRecentSearchSelected(String query) {
    _debounce?.cancel();
    _controller.text = query;
    setState(() {});
    context.read<StockSearchBloc>().add(StockSearchQueryChanged(query));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          height: 46,
          margin: const EdgeInsets.only(right: 16),
          child: TextField(
            controller: _controller,
            autofocus: false,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Search stock symbol or company name...',
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: _clearSearch,
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
            onChanged: _onChanged,
          ),
        ),
      ),
      body: BlocBuilder<StockSearchBloc, StockSearchState>(
        builder: (context, state) {
          return switch (state) {
            StockSearchInitial() => RecentSearchesSection(onSelect: _onRecentSearchSelected),
            StockSearchLoading() => ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: 6,
                separatorBuilder: (_, _) => const Divider(height: 1, indent: 68),
                itemBuilder: (_, _) => const StockTileSkeleton(),
              ),
            StockSearchError(:final failure) => AppErrorView(
                message: failure.message,
                onRetry: () => context.read<StockSearchBloc>().add(StockSearchQueryChanged(_controller.text)),
              ),
            StockSearchLoaded(:final results) => results.isEmpty
                ? AppEmptyState(
                    icon: Icons.search_off_rounded,
                    title: 'No stocks found',
                    message: 'No matching stocks found for "${_controller.text}". Try searching with another keyword.',
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: results.length,
                    separatorBuilder: (_, _) => const Divider(height: 1, indent: 68),
                    itemBuilder: (context, index) {
                      final result = results[index];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: theme.colorScheme.primaryContainer,
                          child: Text(
                            result.symbol.length > 2 ? result.symbol.substring(0, 2) : result.symbol,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                        title: Text(
                          result.symbol,
                          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          result.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        ),
                        trailing: const Icon(Icons.chevron_right, size: 20),
                        onTap: () => context.push(RoutePaths.stockDetail(result.symbol)),
                      );
                    },
                  ),
          };
        },
      ),
    );
  }
}

