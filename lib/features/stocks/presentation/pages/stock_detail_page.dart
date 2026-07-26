import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../bloc/corporate_actions_bloc.dart';
import '../bloc/corporate_actions_event.dart';
import '../bloc/corporate_actions_state.dart';
import '../bloc/fundamentals_bloc.dart';
import '../bloc/fundamentals_event.dart';
import '../bloc/fundamentals_state.dart';
import '../bloc/indicators_bloc.dart';
import '../bloc/indicators_event.dart';
import '../bloc/indicators_state.dart';
import '../bloc/price_history_bloc.dart';
import '../bloc/price_history_event.dart';
import '../bloc/price_history_state.dart';
import '../bloc/signals_bloc.dart';
import '../bloc/signals_event.dart';
import '../bloc/signals_state.dart';
import '../bloc/stock_news_bloc.dart';
import '../bloc/stock_news_event.dart';
import '../bloc/stock_news_state.dart';
import '../bloc/stock_quote_bloc.dart';
import '../bloc/stock_quote_event.dart';
import '../bloc/stock_quote_state.dart';
import '../widgets/fundamentals_table.dart';
import '../widgets/indicator_tile.dart';
import '../widgets/price_chart.dart';
import '../widgets/quote_header.dart';
import '../widgets/signal_card.dart';

const List<String> _tabTitles = ['Overview', 'Indicators', 'Signals', 'Fundamentals', 'News', 'Corp. Actions'];

class StockDetailPage extends StatefulWidget {
  final String symbol;

  const StockDetailPage({super.key, required this.symbol});

  @override
  State<StockDetailPage> createState() => _StockDetailPageState();
}

class _StockDetailPageState extends State<StockDetailPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  String _selectedRange = '1Y';

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
    final symbol = widget.symbol;
    switch (index) {
      case 0:
        final quoteBloc = context.read<StockQuoteBloc>();
        if (quoteBloc.state is StockQuoteInitial) quoteBloc.add(StockQuoteRequested(symbol));
        final historyBloc = context.read<PriceHistoryBloc>();
        if (historyBloc.state is PriceHistoryInitial) {
          historyBloc.add(PriceHistoryRequested(symbol, range: _selectedRange));
        }
      case 1:
        final bloc = context.read<IndicatorsBloc>();
        if (bloc.state is IndicatorsInitial) bloc.add(IndicatorsRequested(symbol));
      case 2:
        final bloc = context.read<SignalsBloc>();
        if (bloc.state is SignalsInitial) bloc.add(SignalsRequested(symbol));
      case 3:
        final bloc = context.read<FundamentalsBloc>();
        if (bloc.state is FundamentalsInitial) bloc.add(FundamentalsRequested(symbol));
      case 4:
        final bloc = context.read<StockNewsBloc>();
        if (bloc.state is StockNewsInitial) bloc.add(StockNewsRequested(symbol));
      case 5:
        final bloc = context.read<CorporateActionsBloc>();
        if (bloc.state is CorporateActionsInitial) bloc.add(CorporateActionsRequested(symbol));
    }
  }

  void _onRangeChanged(String range) {
    setState(() => _selectedRange = range);
    context.read<PriceHistoryBloc>().add(PriceHistoryRequested(widget.symbol, range: range));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.symbol),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _tabTitles.map((t) => Tab(text: t)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _OverviewTab(symbol: widget.symbol, selectedRange: _selectedRange, onRangeChanged: _onRangeChanged),
          _IndicatorsTab(symbol: widget.symbol),
          _SignalsTab(symbol: widget.symbol),
          _FundamentalsTab(symbol: widget.symbol),
          _NewsTab(symbol: widget.symbol),
          _CorporateActionsTab(symbol: widget.symbol),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12 + MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(top: BorderSide(color: theme.colorScheme.outlineVariant, width: 1)),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _showAddToWatchlistSheet(context, widget.symbol),
                icon: const Icon(Icons.star_outline_rounded, size: 18),
                label: const Text('Add Watchlist'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active_outlined, size: 18),
                label: const Text('Set Price Alert'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddToWatchlistSheet(BuildContext context, String symbol) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Add $symbol to Watchlist', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.star_rounded),
                title: const Text('Default Watchlist'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added $symbol to Watchlist')));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _OverviewTab extends StatelessWidget {
  final String symbol;
  final String selectedRange;
  final ValueChanged<String> onRangeChanged;

  const _OverviewTab({required this.symbol, required this.selectedRange, required this.onRangeChanged});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<StockQuoteBloc, StockQuoteState>(
            builder: (context, state) {
              return switch (state) {
                StockQuoteInitial() || StockQuoteLoading() => const SizedBox(height: 120, child: AppLoadingView()),
                StockQuoteError(:final failure) => AppErrorView(
                  message: failure.message,
                  onRetry: () => context.read<StockQuoteBloc>().add(StockQuoteRequested(symbol)),
                ),
                StockQuoteLoaded(:final detail) => QuoteHeader(detail: detail),
              };
            },
          ),
          BlocBuilder<PriceHistoryBloc, PriceHistoryState>(
            builder: (context, state) {
              return switch (state) {
                PriceHistoryInitial() || PriceHistoryLoading() => const SizedBox(height: 220, child: AppLoadingView()),
                PriceHistoryError(:final failure) => AppErrorView(
                  message: failure.message,
                  onRetry: () =>
                      context.read<PriceHistoryBloc>().add(PriceHistoryRequested(symbol, range: selectedRange)),
                ),
                PriceHistoryLoaded(:final history) => PriceChart(
                  history: history,
                  selectedRange: selectedRange,
                  onRangeChanged: onRangeChanged,
                ),
              };
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _IndicatorsTab extends StatelessWidget {
  final String symbol;

  const _IndicatorsTab({required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndicatorsBloc, IndicatorsState>(
      builder: (context, state) {
        return switch (state) {
          IndicatorsInitial() || IndicatorsLoading() => const AppLoadingView(),
          IndicatorsError(:final failure) => AppErrorView(
            message: failure.message,
            onRetry: () => context.read<IndicatorsBloc>().add(IndicatorsRequested(symbol)),
          ),
          IndicatorsLoaded(:final indicators) =>
            !indicators.hasData
                ? const Center(child: Text('Not enough price history yet for indicators.'))
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      IndicatorTile(label: 'SMA (20)', value: indicators.sma20?.toString() ?? 'N/A'),
                      IndicatorTile(label: 'SMA (50)', value: indicators.sma50?.toString() ?? 'N/A'),
                      IndicatorTile(label: 'SMA (200)', value: indicators.sma200?.toString() ?? 'N/A'),
                      IndicatorTile(label: 'EMA (20)', value: indicators.ema20?.toString() ?? 'N/A'),
                      IndicatorTile(label: 'EMA (50)', value: indicators.ema50?.toString() ?? 'N/A'),
                      IndicatorTile(label: 'RSI (14)', value: indicators.rsi14?.toString() ?? 'N/A'),
                      IndicatorTile(
                        label: 'MACD',
                        value: indicators.macd?.macd != null ? '${indicators.macd!.macd}' : 'N/A',
                      ),
                      IndicatorTile(
                        label: 'MACD Signal',
                        value: indicators.macd?.signal != null ? '${indicators.macd!.signal}' : 'N/A',
                      ),
                      IndicatorTile(
                        label: 'Bollinger Upper',
                        value: indicators.bollinger?.upper != null ? '${indicators.bollinger!.upper}' : 'N/A',
                      ),
                      IndicatorTile(
                        label: 'Bollinger Lower',
                        value: indicators.bollinger?.lower != null ? '${indicators.bollinger!.lower}' : 'N/A',
                      ),
                      IndicatorTile(label: 'VWAP (20)', value: indicators.vwap20?.toString() ?? 'N/A'),
                      IndicatorTile(label: 'ADX (14)', value: indicators.adx14?.toString() ?? 'N/A'),
                      IndicatorTile(label: 'ATR (14)', value: indicators.atr14?.toString() ?? 'N/A'),
                      IndicatorTile(
                        label: 'Supertrend',
                        value: indicators.supertrend?.value != null
                            ? '${indicators.supertrend!.value} (${indicators.supertrend!.direction == 1
                                  ? 'Up'
                                  : indicators.supertrend!.direction == -1
                                  ? 'Down'
                                  : 'N/A'})'
                            : 'N/A',
                      ),
                      IndicatorTile(
                        label: 'Stochastic RSI %K',
                        value: indicators.stochasticRsi?.k?.toString() ?? 'N/A',
                      ),
                      if (indicators.pivotPoints != null) ...[
                        const Divider(),
                        IndicatorTile(label: 'Pivot', value: indicators.pivotPoints!.pivot.toString()),
                        IndicatorTile(
                          label: 'R1 / R2 / R3',
                          value:
                              '${indicators.pivotPoints!.r1} / ${indicators.pivotPoints!.r2} / ${indicators.pivotPoints!.r3}',
                        ),
                        IndicatorTile(
                          label: 'S1 / S2 / S3',
                          value:
                              '${indicators.pivotPoints!.s1} / ${indicators.pivotPoints!.s2} / ${indicators.pivotPoints!.s3}',
                        ),
                      ],
                      const SizedBox(height: 24),
                    ],
                  ),
        };
      },
    );
  }
}

class _SignalsTab extends StatelessWidget {
  final String symbol;

  const _SignalsTab({required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignalsBloc, SignalsState>(
      builder: (context, state) {
        return switch (state) {
          SignalsInitial() || SignalsLoading() => const AppLoadingView(),
          SignalsError(:final failure) => AppErrorView(
            message: failure.message,
            onRetry: () => context.read<SignalsBloc>().add(SignalsRequested(symbol)),
          ),
          SignalsLoaded(:final intraday, :final longTerm) => ListView(
            children: [
              if (!intraday.hasData)
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Not enough price history yet for an intraday signal.'),
                )
              else
                SignalCard(
                  title: 'Intraday Signal',
                  signal: intraday.signal,
                  confidenceLabel:
                      'Confidence: ${intraday.confidence}%  |  Probability: ${intraday.probability ?? 'N/A'}%',
                  extra: [
                    if (intraday.entryPrice != null) Text('Entry: ${intraday.entryPrice}'),
                    if (intraday.targetPrice != null) Text('Target: ${intraday.targetPrice}'),
                    if (intraday.stopLoss != null) Text('Stop Loss: ${intraday.stopLoss}'),
                    if (intraday.riskRewardRatio != null) Text('Risk:Reward: ${intraday.riskRewardRatio}'),
                  ],
                  reasoning: intraday.reasoning,
                  disclaimer: intraday.disclaimer,
                ),
              if (!longTerm.hasData)
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Not enough financial data yet for a long-term signal.'),
                )
              else
                SignalCard(
                  title: 'Long-Term Signal',
                  signal: longTerm.signal,
                  confidenceLabel:
                      'Confidence: ${longTerm.confidence}%  |  Horizon: ${longTerm.investmentHorizon}  |  Risk: ${longTerm.riskLevel}',
                  extra: [
                    if (longTerm.strengths.isNotEmpty) Text('Strengths: ${longTerm.strengths.join(', ')}'),
                    if (longTerm.weaknesses.isNotEmpty) Text('Weaknesses: ${longTerm.weaknesses.join(', ')}'),
                    if (longTerm.opportunities.isNotEmpty) Text('Opportunities: ${longTerm.opportunities.join(', ')}'),
                    if (longTerm.risks.isNotEmpty) Text('Risks: ${longTerm.risks.join(', ')}'),
                  ],
                  reasoning: longTerm.reasoning,
                  disclaimer: longTerm.disclaimer,
                ),
            ],
          ),
        };
      },
    );
  }
}

class _FundamentalsTab extends StatelessWidget {
  final String symbol;

  const _FundamentalsTab({required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FundamentalsBloc, FundamentalsState>(
      builder: (context, state) {
        return switch (state) {
          FundamentalsInitial() || FundamentalsLoading() => const AppLoadingView(),
          FundamentalsError(:final failure) => AppErrorView(
            message: failure.message,
            onRetry: () => context.read<FundamentalsBloc>().add(FundamentalsRequested(symbol)),
          ),
          FundamentalsLoaded(:final fundamentals) => SingleChildScrollView(
            child: FundamentalsTable(fundamentals: fundamentals),
          ),
        };
      },
    );
  }
}

class _NewsTab extends StatelessWidget {
  final String symbol;

  const _NewsTab({required this.symbol});

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('MMM d, h:mm a');
    return BlocBuilder<StockNewsBloc, StockNewsState>(
      builder: (context, state) {
        return switch (state) {
          StockNewsInitial() || StockNewsLoading() => const AppLoadingView(),
          StockNewsError(:final failure) => AppErrorView(
            message: failure.message,
            onRetry: () => context.read<StockNewsBloc>().add(StockNewsRequested(symbol)),
          ),
          StockNewsLoaded(:final articles) =>
            articles.isEmpty
                ? const Center(child: Text('No recent news for this stock.'))
                : ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return ListTile(
                        title: Text(article.headline, maxLines: 2, overflow: TextOverflow.ellipsis),
                        subtitle: Text('${article.source} - ${formatter.format(article.publishedAt)}'),
                      );
                    },
                  ),
        };
      },
    );
  }
}

class _CorporateActionsTab extends StatelessWidget {
  final String symbol;

  const _CorporateActionsTab({required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CorporateActionsBloc, CorporateActionsState>(
      builder: (context, state) {
        return switch (state) {
          CorporateActionsInitial() || CorporateActionsLoading() => const AppLoadingView(),
          CorporateActionsError(:final failure) => AppErrorView(
            message: failure.message,
            onRetry: () => context.read<CorporateActionsBloc>().add(CorporateActionsRequested(symbol)),
          ),
          CorporateActionsLoaded(:final actions) =>
            actions.isEmpty
                ? const Center(child: Text('No corporate actions on record.'))
                : ListView.builder(
                    itemCount: actions.length,
                    itemBuilder: (context, index) {
                      final action = actions[index];
                      return ListTile(
                        title: Text(action.purpose),
                        subtitle: Text(
                          [
                            if (action.exDate != null)
                              'Ex-date: ${action.exDate!.toLocal().toString().split(' ').first}',
                            if (action.recordDate != null)
                              'Record date: ${action.recordDate!.toLocal().toString().split(' ').first}',
                          ].join('  |  '),
                        ),
                      );
                    },
                  ),
        };
      },
    );
  }
}
