import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../bloc/portfolio_detail_bloc.dart';
import '../bloc/portfolio_detail_event.dart';
import '../bloc/portfolio_detail_state.dart';
import '../widgets/holding_tile.dart';
import '../widgets/performance_summary_card.dart';

class PortfolioDetailPage extends StatefulWidget {
  final String portfolioId;

  const PortfolioDetailPage({super.key, required this.portfolioId});

  @override
  State<PortfolioDetailPage> createState() => _PortfolioDetailPageState();
}

class _PortfolioDetailPageState extends State<PortfolioDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<PortfolioDetailBloc>().add(PortfolioDetailRequested(widget.portfolioId));
  }

  Future<void> _addTransaction() async {
    final added = await context.push<bool>(RoutePaths.addTransaction(widget.portfolioId));
    if (added == true && mounted) {
      context.read<PortfolioDetailBloc>().add(PortfolioDetailRequested(widget.portfolioId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addTransaction,
        icon: const Icon(Icons.add),
        label: const Text('Transaction'),
      ),
      body: BlocBuilder<PortfolioDetailBloc, PortfolioDetailState>(
        builder: (context, state) {
          return switch (state) {
            PortfolioDetailInitial() || PortfolioDetailLoading() => const AppLoadingView(),
            PortfolioDetailError(:final failure) => AppErrorView(
              message: failure.message,
              onRetry: () => context.read<PortfolioDetailBloc>().add(PortfolioDetailRequested(widget.portfolioId)),
            ),
            PortfolioDetailLoaded(:final detail, :final performance) => ListView(
              children: [
                PerformanceSummaryCard(performance: performance),
                if (detail.holdings.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No holdings yet - record your first transaction.'),
                  )
                else
                  ...detail.holdings.map((holding) => HoldingTile(holding: holding)),
                const SizedBox(height: 80),
              ],
            ),
          };
        },
      ),
    );
  }
}
