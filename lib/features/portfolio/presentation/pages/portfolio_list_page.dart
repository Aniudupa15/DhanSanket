import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolios'),
        actions: [IconButton(icon: const Icon(Icons.add), tooltip: 'New portfolio', onPressed: _create)],
      ),
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
          return switch (state) {
            PortfolioInitial() || PortfolioLoading() => const AppLoadingView(),
            PortfolioError(:final failure) => AppErrorView(
              message: failure.message,
              onRetry: () => context.read<PortfolioBloc>().add(const PortfoliosRequested()),
            ),
            PortfolioLoaded(:final portfolios) =>
              portfolios.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('No portfolios yet.'),
                          const SizedBox(height: 12),
                          FilledButton(onPressed: _create, child: const Text('Create one')),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: portfolios.length,
                      itemBuilder: (context, index) {
                        final portfolio = portfolios[index];
                        return ListTile(
                          title: Text(portfolio.name),
                          onTap: () => context.push(RoutePaths.portfolioDetail(portfolio.id)),
                        );
                      },
                    ),
          };
        },
      ),
    );
  }
}
