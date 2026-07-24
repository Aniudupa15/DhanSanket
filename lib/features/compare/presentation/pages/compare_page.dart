import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../bloc/comparison_bloc.dart';
import '../bloc/comparison_event.dart';
import '../bloc/comparison_state.dart';
import '../widgets/comparison_table.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({super.key});

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  final _symbolController = TextEditingController();
  final List<String> _symbols = [];

  static const _minSymbols = 2;
  static const _maxSymbols = 5;

  @override
  void dispose() {
    _symbolController.dispose();
    super.dispose();
  }

  void _addSymbol() {
    final raw = _symbolController.text.trim().toUpperCase();
    if (raw.isEmpty || _symbols.contains(raw) || _symbols.length >= _maxSymbols) return;
    setState(() {
      _symbols.add(raw);
      _symbolController.clear();
    });
  }

  void _removeSymbol(String symbol) {
    setState(() => _symbols.remove(symbol));
  }

  void _compare() {
    context.read<ComparisonBloc>().add(ComparisonRequested(List.of(_symbols)));
  }

  @override
  Widget build(BuildContext context) {
    final canCompare = _symbols.length >= _minSymbols && _symbols.length <= _maxSymbols;
    return Scaffold(
      appBar: AppBar(title: const Text('Compare Stocks')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _symbolController,
                    textCapitalization: TextCapitalization.characters,
                    decoration: const InputDecoration(labelText: 'Add a symbol (e.g. RELIANCE)'),
                    onSubmitted: (_) => _addSymbol(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(icon: const Icon(Icons.add_circle), tooltip: 'Add symbol', onPressed: _addSymbol),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final symbol in _symbols) Chip(label: Text(symbol), onDeleted: () => _removeSymbol(symbol)),
              ],
            ),
            const SizedBox(height: 12),
            FilledButton(onPressed: canCompare ? _compare : null, child: const Text('Compare')),
            Text('Pick 2-5 symbols to compare.', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<ComparisonBloc, ComparisonState>(
                builder: (context, state) {
                  return switch (state) {
                    ComparisonInitial() => const Center(child: Text('Add symbols above and tap Compare.')),
                    ComparisonLoading() => const AppLoadingView(),
                    ComparisonError(:final failure) => AppErrorView(message: failure.message, onRetry: _compare),
                    ComparisonLoaded(:final entries) => ComparisonTable(entries: entries),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
