import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../bloc/intraday_analysis_bloc.dart';
import '../bloc/intraday_analysis_event.dart';
import '../bloc/intraday_analysis_state.dart';
import '../bloc/long_term_analysis_bloc.dart';
import '../bloc/long_term_analysis_event.dart';
import '../bloc/long_term_analysis_state.dart';
import '../widgets/intraday_recommendation_tile.dart';
import '../widgets/long_term_recommendation_tile.dart';

const List<String> _tabTitles = ['Intraday', 'Long-Term'];

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabTitles.length, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) _fetchForTab(_tabController.index);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchForTab(0));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _fetchForTab(int index) {
    switch (index) {
      case 0:
        final bloc = context.read<IntradayAnalysisBloc>();
        if (bloc.state is IntradayAnalysisInitial) bloc.add(const IntradayAnalysisRequested());
      case 1:
        final bloc = context.read<LongTermAnalysisBloc>();
        if (bloc.state is LongTermAnalysisInitial) bloc.add(const LongTermAnalysisRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabTitles.map((t) => Tab(text: t)).toList(),
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [_IntradayTab(), _LongTermTab()]),
    );
  }
}

class _IntradayTab extends StatelessWidget {
  const _IntradayTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntradayAnalysisBloc, IntradayAnalysisState>(
      builder: (context, state) {
        return switch (state) {
          IntradayAnalysisInitial() || IntradayAnalysisLoading() => const AppLoadingView(),
          IntradayAnalysisError(:final failure) => AppErrorView(
            message: failure.message,
            onRetry: () => context.read<IntradayAnalysisBloc>().add(const IntradayAnalysisRequested()),
          ),
          IntradayAnalysisLoaded(:final recommendations) =>
            recommendations.isEmpty
                ? const Center(child: Text('No intraday recommendations right now.'))
                : RefreshIndicator(
                    onRefresh: () async => context.read<IntradayAnalysisBloc>().add(const IntradayAnalysisRequested()),
                    child: ListView.builder(
                      itemCount: recommendations.length,
                      itemBuilder: (context, index) => IntradayRecommendationTile(
                        recommendation: recommendations[index],
                        onTap: () => context.push(RoutePaths.stockDetail(recommendations[index].symbol)),
                      ),
                    ),
                  ),
        };
      },
    );
  }
}

class _LongTermTab extends StatelessWidget {
  const _LongTermTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LongTermAnalysisBloc, LongTermAnalysisState>(
      builder: (context, state) {
        return switch (state) {
          LongTermAnalysisInitial() || LongTermAnalysisLoading() => const AppLoadingView(),
          LongTermAnalysisError(:final failure) => AppErrorView(
            message: failure.message,
            onRetry: () => context.read<LongTermAnalysisBloc>().add(const LongTermAnalysisRequested()),
          ),
          LongTermAnalysisLoaded(:final recommendations) =>
            recommendations.isEmpty
                ? const Center(child: Text('No long-term recommendations right now.'))
                : RefreshIndicator(
                    onRefresh: () async => context.read<LongTermAnalysisBloc>().add(const LongTermAnalysisRequested()),
                    child: ListView.builder(
                      itemCount: recommendations.length,
                      itemBuilder: (context, index) => LongTermRecommendationTile(
                        recommendation: recommendations[index],
                        onTap: () => context.push(RoutePaths.stockDetail(recommendations[index].symbol)),
                      ),
                    ),
                  ),
        };
      },
    );
  }
}
