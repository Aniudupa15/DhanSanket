import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/features/analysis/domain/entities/intraday_recommendation.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/intraday_analysis_bloc.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/intraday_analysis_event.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/intraday_analysis_state.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/long_term_analysis_bloc.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/long_term_analysis_event.dart';
import 'package:dhan_sanket/features/analysis/presentation/bloc/long_term_analysis_state.dart';
import 'package:dhan_sanket/features/analysis/presentation/pages/analysis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIntradayAnalysisBloc extends MockBloc<IntradayAnalysisEvent, IntradayAnalysisState>
    implements IntradayAnalysisBloc {}

class MockLongTermAnalysisBloc extends MockBloc<LongTermAnalysisEvent, LongTermAnalysisState>
    implements LongTermAnalysisBloc {}

void main() {
  late MockIntradayAnalysisBloc intradayBloc;
  late MockLongTermAnalysisBloc longTermBloc;

  setUpAll(() {
    registerFallbackValue(const IntradayAnalysisRequested());
    registerFallbackValue(const LongTermAnalysisRequested());
  });

  setUp(() {
    intradayBloc = MockIntradayAnalysisBloc();
    longTermBloc = MockLongTermAnalysisBloc();
  });

  Widget buildSubject() {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<IntradayAnalysisBloc>.value(value: intradayBloc),
          BlocProvider<LongTermAnalysisBloc>.value(value: longTermBloc),
        ],
        child: const AnalysisPage(),
      ),
    );
  }

  testWidgets('dispatches IntradayAnalysisRequested on init', (tester) async {
    when(() => intradayBloc.state).thenReturn(const IntradayAnalysisInitial());
    whenListen(
      intradayBloc,
      const Stream<IntradayAnalysisState>.empty(),
      initialState: const IntradayAnalysisInitial(),
    );
    when(() => longTermBloc.state).thenReturn(const LongTermAnalysisInitial());
    whenListen(
      longTermBloc,
      const Stream<LongTermAnalysisState>.empty(),
      initialState: const LongTermAnalysisInitial(),
    );

    await tester.pumpWidget(buildSubject());

    verify(() => intradayBloc.add(const IntradayAnalysisRequested())).called(1);
  });

  testWidgets('shows intraday recommendations when loaded', (tester) async {
    final recommendation = IntradayRecommendation(
      symbol: 'RELIANCE',
      name: 'Reliance Industries',
      asOf: DateTime(2026, 1, 1),
      signal: 'BUY',
      confidence: Decimal.parse('75'),
      entryPrice: Decimal.parse('2500'),
      targetPrice: Decimal.parse('2600'),
      stopLoss: Decimal.parse('2450'),
      reasoning: const [],
    );
    when(() => intradayBloc.state).thenReturn(IntradayAnalysisLoaded([recommendation]));
    whenListen(
      intradayBloc,
      const Stream<IntradayAnalysisState>.empty(),
      initialState: IntradayAnalysisLoaded([recommendation]),
    );
    when(() => longTermBloc.state).thenReturn(const LongTermAnalysisInitial());
    whenListen(
      longTermBloc,
      const Stream<LongTermAnalysisState>.empty(),
      initialState: const LongTermAnalysisInitial(),
    );

    await tester.pumpWidget(buildSubject());

    expect(find.text('RELIANCE'), findsOneWidget);
  });

  testWidgets('dispatches LongTermAnalysisRequested when switching to the Long-Term tab', (tester) async {
    when(() => intradayBloc.state).thenReturn(const IntradayAnalysisLoaded([]));
    whenListen(
      intradayBloc,
      const Stream<IntradayAnalysisState>.empty(),
      initialState: const IntradayAnalysisLoaded([]),
    );
    when(() => longTermBloc.state).thenReturn(const LongTermAnalysisInitial());
    whenListen(
      longTermBloc,
      const Stream<LongTermAnalysisState>.empty(),
      initialState: const LongTermAnalysisInitial(),
    );

    await tester.pumpWidget(buildSubject());
    await tester.tap(find.text('Long-Term'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump();

    verify(() => longTermBloc.add(const LongTermAnalysisRequested())).called(1);
  });
}
