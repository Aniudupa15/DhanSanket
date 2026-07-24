import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/features/alerts/domain/entities/alert.dart';
import 'package:dhan_sanket/features/alerts/domain/entities/alert_status.dart';
import 'package:dhan_sanket/features/alerts/domain/entities/alert_type.dart';
import 'package:dhan_sanket/features/alerts/presentation/bloc/alert_bloc.dart';
import 'package:dhan_sanket/features/alerts/presentation/bloc/alert_event.dart';
import 'package:dhan_sanket/features/alerts/presentation/bloc/alert_state.dart';
import 'package:dhan_sanket/features/alerts/presentation/pages/alerts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAlertBloc extends MockBloc<AlertEvent, AlertState> implements AlertBloc {}

void main() {
  late MockAlertBloc bloc;

  setUpAll(() {
    registerFallbackValue(const AlertsRequested());
  });

  setUp(() {
    bloc = MockAlertBloc();
  });

  Widget buildSubject() {
    return MaterialApp(
      home: BlocProvider<AlertBloc>.value(value: bloc, child: const AlertsPage()),
    );
  }

  testWidgets('dispatches AlertsRequested on init', (tester) async {
    when(() => bloc.state).thenReturn(const AlertInitial());
    whenListen(bloc, const Stream<AlertState>.empty(), initialState: const AlertInitial());

    await tester.pumpWidget(buildSubject());

    verify(() => bloc.add(const AlertsRequested())).called(1);
  });

  testWidgets('shows an empty state with a create action', (tester) async {
    when(() => bloc.state).thenReturn(const AlertLoaded([]));
    whenListen(bloc, const Stream<AlertState>.empty(), initialState: const AlertLoaded([]));

    await tester.pumpWidget(buildSubject());

    expect(find.text('No alerts yet.'), findsOneWidget);
    expect(find.text('Create one'), findsOneWidget);
  });

  testWidgets('shows alerts when loaded and dispatches delete', (tester) async {
    final alerts = [
      Alert(
        id: 'a1',
        symbol: 'RELIANCE',
        alertType: AlertType.priceAbove,
        condition: {'price': Decimal.fromInt(1300)},
        status: AlertStatus.active,
        createdAt: DateTime(2026, 1, 1),
        triggeredAt: null,
      ),
    ];
    when(() => bloc.state).thenReturn(AlertLoaded(alerts));
    whenListen(bloc, const Stream<AlertState>.empty(), initialState: AlertLoaded(alerts));

    await tester.pumpWidget(buildSubject());
    expect(find.textContaining('RELIANCE'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();

    verify(() => bloc.add(const AlertDeleteRequested('a1'))).called(1);
  });
}
