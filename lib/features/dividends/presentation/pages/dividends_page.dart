import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_skeleton_loader.dart';
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
      appBar: AppBar(title: const Text('Dividend Calendar & Recommendations')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  DividendInitial() || DividendLoading() => ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: 4,
                    separatorBuilder: (_, _) => const Divider(height: 1, indent: 68),
                    itemBuilder: (_, _) => const StockTileSkeleton(),
                  ),
                  DividendError(:final failure) => AppErrorView(message: failure.message, onRetry: _apply),
                  DividendLoaded(:final recommendations) =>
                    recommendations.isEmpty
                        ? const AppEmptyState(
                            icon: Icons.currency_rupee,
                            title: 'No dividend data',
                            message: 'No upcoming or high-yield dividend recommendations match your filter.',
                          )
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
