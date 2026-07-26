import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_skeleton_loader.dart';
import '../../domain/entities/mover_category.dart';
import '../bloc/market_movers_bloc.dart';
import '../bloc/market_movers_event.dart';
import '../bloc/market_movers_state.dart';
import '../widgets/market_mover_tile.dart';

class MarketMoversPage extends StatefulWidget {
  final MoverCategory initialCategory;

  const MarketMoversPage({super.key, this.initialCategory = MoverCategory.gainers});

  @override
  State<MarketMoversPage> createState() => _MarketMoversPageState();
}

class _MarketMoversPageState extends State<MarketMoversPage> {
  late MoverCategory _category = widget.initialCategory;

  @override
  void initState() {
    super.initState();
    context.read<MarketMoversBloc>().add(MarketMoversRequested(_category));
  }

  void _selectCategory(MoverCategory category) {
    setState(() => _category = category);
    context.read<MarketMoversBloc>().add(MarketMoversRequested(category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Market Movers')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final category in MoverCategory.values)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(_labelFor(category)),
                        selected: _category == category,
                        onSelected: (_) => _selectCategory(category),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<MarketMoversBloc, MarketMoversState>(
              builder: (context, state) {
                return switch (state) {
                  MarketMoversInitial() || MarketMoversLoading() => ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: 6,
                    separatorBuilder: (_, _) => const Divider(height: 1, indent: 68),
                    itemBuilder: (_, _) => const StockTileSkeleton(),
                  ),
                  MarketMoversError(:final failure) => AppErrorView(
                    message: failure.message,
                    onRetry: () => context.read<MarketMoversBloc>().add(MarketMoversRequested(_category)),
                  ),
                  MarketMoversLoaded(:final movers) =>
                    movers.isEmpty
                        ? const Center(child: Text('No data right now.'))
                        : ListView.builder(
                            itemCount: movers.length,
                            itemBuilder: (context, index) => MarketMoverTile(mover: movers[index]),
                          ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }

  String _labelFor(MoverCategory category) {
    return switch (category) {
      MoverCategory.gainers => 'Gainers',
      MoverCategory.losers => 'Losers',
      MoverCategory.mostActive => 'Most Active',
      MoverCategory.fiftyTwoWeekHigh => '52W High',
      MoverCategory.fiftyTwoWeekLow => '52W Low',
    };
  }
}
