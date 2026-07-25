import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../../../../core/widgets/app_skeleton_loader.dart';
import '../../domain/entities/screener_filter.dart';
import '../bloc/screener_bloc.dart';
import '../bloc/screener_event.dart';
import '../bloc/screener_state.dart';
import '../widgets/screener_result_tile.dart';


class ScreenerPage extends StatefulWidget {
  const ScreenerPage({super.key});

  @override
  State<ScreenerPage> createState() => _ScreenerPageState();
}

class _ScreenerPageState extends State<ScreenerPage> {
  final _rsiBelowController = TextEditingController();
  final _rsiAboveController = TextEditingController();
  final _priceMinController = TextEditingController();
  final _priceMaxController = TextEditingController();
  final _minVolumeController = TextEditingController();
  bool? _aboveSma50;

  @override
  void dispose() {
    _rsiBelowController.dispose();
    _rsiAboveController.dispose();
    _priceMinController.dispose();
    _priceMaxController.dispose();
    _minVolumeController.dispose();
    super.dispose();
  }

  void _submit() {
    final filter = ScreenerFilter(
      rsiBelow: Decimal.tryParse(_rsiBelowController.text),
      rsiAbove: Decimal.tryParse(_rsiAboveController.text),
      priceMin: Decimal.tryParse(_priceMinController.text),
      priceMax: Decimal.tryParse(_priceMaxController.text),
      aboveSma50: _aboveSma50,
      minVolume: int.tryParse(_minVolumeController.text),
    );
    context.read<ScreenerBloc>().add(ScreenerSubmitted(filter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Screener')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _rsiBelowController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'RSI below'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _rsiAboveController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'RSI above'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _priceMinController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Min price'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _priceMaxController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Max price'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _minVolumeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Minimum volume'),
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Above 50-day SMA'),
                  value: _aboveSma50 ?? false,
                  tristate: false,
                  onChanged: (value) => setState(() => _aboveSma50 = value == true ? true : null),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FilledButton(onPressed: _submit, child: const Text('Run Screener')),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: BlocBuilder<ScreenerBloc, ScreenerState>(
              builder: (context, state) {
                return switch (state) {
                  ScreenerInitial() => AppEmptyState(
                      icon: Icons.filter_alt_outlined,
                      title: 'Run Stock Screener',
                      message: 'Set parameters above and tap "Run Screener" to filter stocks by RSI, price range, volume, and moving averages.',
                      actionLabel: 'Run Screener',
                      onAction: _submit,
                    ),
                  ScreenerLoading() => ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      itemCount: 5,
                      separatorBuilder: (_, __) => const Divider(height: 1, indent: 68),
                      itemBuilder: (_, __) => const StockTileSkeleton(),
                    ),
                  ScreenerError(:final failure) => AppErrorView(message: failure.message, onRetry: _submit),
                  ScreenerLoaded(:final results) => results.isEmpty
                      ? const AppEmptyState(
                          icon: Icons.filter_list_off_rounded,
                          title: 'No matching stocks',
                          message: 'No stocks match your filter criteria. Try expanding the price or RSI parameters.',
                        )
                      : ListView.builder(
                          itemCount: results.length,
                          itemBuilder: (context, index) => ScreenerResultTile(result: results[index]),
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
