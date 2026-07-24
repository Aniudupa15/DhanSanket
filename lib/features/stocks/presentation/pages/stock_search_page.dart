import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
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
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      context.read<StockSearchBloc>().add(StockSearchQueryChanged(value));
    });
  }

  void _onRecentSearchSelected(String query) {
    _debounce?.cancel();
    _controller.text = query;
    context.read<StockSearchBloc>().add(StockSearchQueryChanged(query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: false,
          decoration: const InputDecoration(hintText: 'Search stocks by symbol or name', border: InputBorder.none),
          onChanged: _onChanged,
        ),
      ),
      body: BlocBuilder<StockSearchBloc, StockSearchState>(
        builder: (context, state) {
          return switch (state) {
            StockSearchInitial() => RecentSearchesSection(onSelect: _onRecentSearchSelected),
            StockSearchLoading() => const AppLoadingView(),
            StockSearchError(:final failure) => AppErrorView(
              message: failure.message,
              onRetry: () => context.read<StockSearchBloc>().add(StockSearchQueryChanged(_controller.text)),
            ),
            StockSearchLoaded(:final results) =>
              results.isEmpty
                  ? const Center(child: Text('No stocks found.'))
                  : ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final result = results[index];
                        return ListTile(
                          title: Text(result.symbol),
                          subtitle: Text(result.name, maxLines: 1, overflow: TextOverflow.ellipsis),
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
