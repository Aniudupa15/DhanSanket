import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../bloc/heatmap_bloc.dart';
import '../bloc/heatmap_event.dart';
import '../bloc/heatmap_state.dart';
import '../widgets/heatmap_tile_widget.dart';

class HeatmapPage extends StatefulWidget {
  const HeatmapPage({super.key});

  @override
  State<HeatmapPage> createState() => _HeatmapPageState();
}

class _HeatmapPageState extends State<HeatmapPage> {
  @override
  void initState() {
    super.initState();
    context.read<HeatmapBloc>().add(const HeatmapRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Market Heatmap')),
      body: BlocBuilder<HeatmapBloc, HeatmapState>(
        builder: (context, state) {
          return switch (state) {
            HeatmapInitial() || HeatmapLoading() => const AppLoadingView(),
            HeatmapError(:final failure) => AppErrorView(
              message: failure.message,
              onRetry: () => context.read<HeatmapBloc>().add(const HeatmapRequested()),
            ),
            HeatmapLoaded(:final heatmap) => Column(
              children: [
                if (heatmap.notes.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(heatmap.notes.join(' '), style: Theme.of(context).textTheme.bodySmall),
                  ),
                Expanded(
                  child: heatmap.tiles.isEmpty
                      ? const Center(child: Text('No data right now.'))
                      : GridView.builder(
                          padding: const EdgeInsets.all(8),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                            childAspectRatio: 1.3,
                          ),
                          itemCount: heatmap.tiles.length,
                          itemBuilder: (context, index) => HeatmapTileWidget(tile: heatmap.tiles[index]),
                        ),
                ),
              ],
            ),
          };
        },
      ),
    );
  }
}
