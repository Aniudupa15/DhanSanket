import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../bloc/dividend_bloc.dart';
import '../bloc/dividend_event.dart';
import '../bloc/dividend_state.dart';
import '../widgets/dividend_recommendation_tile.dart';

class DividendsPage extends StatefulWidget {
  const DividendsPage({super.key});

  @override
  State<DividendsPage> createState() => _DividendsPageState();
}

class _DividendsPageState extends State<DividendsPage> {
  bool _upcomingOnly = false;
  String _sort = 'ex_date';

  @override
  void initState() {
    super.initState();
    context.read<DividendBloc>().add(const DividendsRequested());
  }

  void _apply() {
    context.read<DividendBloc>().add(DividendsRequested(upcoming: _upcomingOnly, sort: _sort));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dividends')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChoiceChip(
                    label: const Text('Upcoming'),
                    selected: _upcomingOnly,
                    onSelected: (selected) {
                      setState(() => _upcomingOnly = selected);
                      _apply();
                    },
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('Highest Yield'),
                    selected: _sort == 'yield',
                    onSelected: (selected) {
                      setState(() => _sort = selected ? 'yield' : 'ex_date');
                      _apply();
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<DividendBloc, DividendState>(
              builder: (context, state) {
                return switch (state) {
                  DividendInitial() || DividendLoading() => const AppLoadingView(),
                  DividendError(:final failure) => AppErrorView(message: failure.message, onRetry: _apply),
                  DividendLoaded(:final recommendations) =>
                    recommendations.isEmpty
                        ? const Center(child: Text('No dividend data right now.'))
                        : RefreshIndicator(
                            onRefresh: () async => _apply(),
                            child: ListView.builder(
                              itemCount: recommendations.length,
                              itemBuilder: (context, index) => DividendRecommendationTile(
                                recommendation: recommendations[index],
                                onTap: () => context.push(RoutePaths.stockDetail(recommendations[index].symbol)),
                              ),
                            ),
                          ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
