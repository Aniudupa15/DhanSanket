import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/features/dividends/domain/entities/dividend_recommendation.dart';
import 'package:dhan_sanket/features/dividends/presentation/bloc/dividend_bloc.dart';
import 'package:dhan_sanket/features/dividends/presentation/bloc/dividend_event.dart';
import 'package:dhan_sanket/features/dividends/presentation/bloc/dividend_state.dart';
import 'package:dhan_sanket/features/dividends/presentation/pages/dividends_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDividendBloc extends MockBloc<DividendEvent, DividendState> implements DividendBloc {}

void main() {
  late MockDividendBloc bloc;

  final recommendation = DividendRecommendation(
    symbol: 'RELIANCE',
    name: 'Reliance Industries',
    dividendYield: Decimal.parse('2.5'),
    dividendAmount: Decimal.parse('10.0'),
    exDividendDate: DateTime(2026, 2, 1),
    buyBeforeDate: DateTime(2026, 1, 31),
    recommendation: 'Hold',
    riskLevel: 'Low',
    confidence: 80,
  );

  setUpAll(() {
    registerFallbackValue(const DividendsRequested());
  });

  setUp(() {
    bloc = MockDividendBloc();
  });

  Widget buildSubject() {
    return MaterialApp(
      home: BlocProvider<DividendBloc>.value(value: bloc, child: const DividendsPage()),
    );
  }

  testWidgets('dispatches DividendsRequested on init', (tester) async {
    when(() => bloc.state).thenReturn(const DividendInitial());
    whenListen(bloc, const Stream<DividendState>.empty(), initialState: const DividendInitial());

    await tester.pumpWidget(buildSubject());

    verify(() => bloc.add(const DividendsRequested())).called(1);
  });

  testWidgets('shows recommendations when loaded', (tester) async {
    when(() => bloc.state).thenReturn(DividendLoaded([recommendation]));
    whenListen(bloc, const Stream<DividendState>.empty(), initialState: DividendLoaded([recommendation]));

    await tester.pumpWidget(buildSubject());

    expect(find.text('RELIANCE'), findsOneWidget);
  });

  testWidgets('dispatches upcoming filter when the chip is tapped', (tester) async {
    when(() => bloc.state).thenReturn(const DividendLoaded([]));
    whenListen(bloc, const Stream<DividendState>.empty(), initialState: const DividendLoaded([]));

    await tester.pumpWidget(buildSubject());
    await tester.tap(find.text('Upcoming'));
    await tester.pump();

    verify(() => bloc.add(const DividendsRequested(upcoming: true))).called(1);
  });

  testWidgets('dispatches yield sort when the highest-yield chip is tapped', (tester) async {
    when(() => bloc.state).thenReturn(const DividendLoaded([]));
    whenListen(bloc, const Stream<DividendState>.empty(), initialState: const DividendLoaded([]));

    await tester.pumpWidget(buildSubject());
    await tester.tap(find.text('Highest Yield'));
    await tester.pump();

    verify(() => bloc.add(const DividendsRequested(sort: 'yield'))).called(1);
  });
}
