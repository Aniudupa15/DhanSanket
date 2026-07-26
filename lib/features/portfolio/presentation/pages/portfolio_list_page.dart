import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_skeleton_loader.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../bloc/portfolio_state.dart';
import '../widgets/create_portfolio_dialog.dart';

class PortfolioListPage extends StatefulWidget {
  const PortfolioListPage({super.key});

  @override
  State<PortfolioListPage> createState() => _PortfolioListPageState();
}

class _PortfolioListPageState extends State<PortfolioListPage> {
  @override
  void initState() {
    super.initState();
    context.read<PortfolioBloc>().add(const PortfoliosRequested());
  }

  Future<void> _create() async {
    final name = await showCreatePortfolioDialog(context);
    if (name != null && mounted) {
      context.read<PortfolioBloc>().add(PortfolioCreateRequested(name));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolios'),
        actions: [
          IconButton.filledTonal(
            icon: const Icon(Icons.add, size: 20),
            tooltip: 'New portfolio',
            onPressed: _create,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
          return switch (state) {
            PortfolioInitial() || PortfolioLoading() => ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: 4,
                separatorBuilder: (_, _) => const Divider(height: 1, indent: 68),
                itemBuilder: (_, _) => const StockTileSkeleton(),
              ),
            PortfolioError(:final failure) => AppErrorView(
                message: failure.message,
                onRetry: () => context.read<PortfolioBloc>().add(const PortfoliosRequested()),
              ),
            PortfolioLoaded(:final portfolios) => portfolios.isEmpty
                ? AppEmptyState(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'No portfolios yet.',
                    message: 'Track your holdings, unrealized profit & loss, and performance across investments.',
                    actionLabel: 'Create one',
                    onAction: _create,
                  )


                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: portfolios.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final portfolio = portfolios[index];
                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: CircleAvatar(
                            backgroundColor: theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.account_balance_wallet_rounded,
                              color: theme.colorScheme.primary,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            portfolio.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            'Click to view performance & holdings',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          trailing: const Icon(Icons.chevron_right, size: 20),
                          onTap: () => context.push(RoutePaths.portfolioDetail(portfolio.id)),
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

