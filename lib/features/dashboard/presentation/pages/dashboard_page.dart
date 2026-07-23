import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';
import '../widgets/dashboard_notes_banner.dart';
import '../widgets/indices_strip.dart';
import '../widgets/latest_news_preview.dart';
import '../widgets/market_mover_list_section.dart';
import '../widgets/market_status_banner.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(const DashboardRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return switch (state) {
            DashboardInitial() || DashboardLoading() => const AppLoadingView(),
            DashboardError(:final failure) => AppErrorView(
                message: failure.message,
                onRetry: () => context.read<DashboardBloc>().add(const DashboardRequested()),
              ),
            DashboardLoaded(:final snapshot) => RefreshIndicator(
                onRefresh: () async {
                  final bloc = context.read<DashboardBloc>();
                  bloc.add(const DashboardRefreshRequested());
                  await bloc.stream.firstWhere((s) => s is! DashboardLoading);
                },
                child: ListView(
                  children: [
                    const SizedBox(height: 8),
                    MarketStatusBanner(statuses: snapshot.marketStatus),
                    const SizedBox(height: 8),
                    IndicesStrip(indices: snapshot.indices),
                    MarketMoverListSection(title: 'Top Gainers', movers: snapshot.gainers),
                    MarketMoverListSection(title: 'Top Losers', movers: snapshot.losers),
                    MarketMoverListSection(title: 'Most Active', movers: snapshot.mostActive),
                    MarketMoverListSection(title: '52-Week High', movers: snapshot.fiftyTwoWeekHigh),
                    MarketMoverListSection(title: '52-Week Low', movers: snapshot.fiftyTwoWeekLow),
                    LatestNewsPreview(articles: snapshot.latestNews),
                    DashboardNotesBanner(notes: snapshot.notes),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
