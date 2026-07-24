import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/bootstrap/injector.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/alerts/domain/repositories/notification_repository.dart';
import 'package:dhan_sanket/features/dashboard/domain/entities/dashboard_snapshot.dart';
import 'package:dhan_sanket/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dhan_sanket/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:dhan_sanket/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:dhan_sanket/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDashboardBloc extends MockBloc<DashboardEvent, DashboardState> implements DashboardBloc {}

class MockNotificationRepository extends Mock implements NotificationRepository {}

void main() {
  late MockDashboardBloc bloc;
  late MockNotificationRepository notificationRepository;

  const snapshotWithNotes = DashboardSnapshot(
    marketStatus: [],
    indices: [],
    gainers: [],
    losers: [],
    mostActive: [],
    fiftyTwoWeekHigh: [],
    fiftyTwoWeekLow: [],
    latestNews: [],
    notes: ['Sector data is unavailable for all stocks.'],
  );

  setUp(() {
    bloc = MockDashboardBloc();
    notificationRepository = MockNotificationRepository();
    when(
      () => notificationRepository.list(unreadOnly: any(named: 'unreadOnly'), limit: any(named: 'limit')),
    ).thenAnswer((_) async => const Success([]));
    getIt.registerSingleton<NotificationRepository>(notificationRepository);
  });

  tearDown(() {
    getIt.unregister<NotificationRepository>();
  });

  Widget buildSubject() {
    return MaterialApp(home: BlocProvider<DashboardBloc>.value(value: bloc, child: const DashboardPage()));
  }

  testWidgets('shows a loading indicator while loading', (tester) async {
    when(() => bloc.state).thenReturn(const DashboardLoading());
    whenListen(bloc, const Stream<DashboardState>.empty(), initialState: const DashboardLoading());

    await tester.pumpWidget(buildSubject());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows the notes banner - visibly, not hidden - when loaded with notes present', (tester) async {
    when(() => bloc.state).thenReturn(const DashboardLoaded(snapshotWithNotes));
    whenListen(bloc, const Stream<DashboardState>.empty(), initialState: const DashboardLoaded(snapshotWithNotes));

    await tester.pumpWidget(buildSubject());
    await tester.pump();

    expect(find.text('Sector data is unavailable for all stocks.'), findsOneWidget);
  });

  testWidgets('shows an error view with a retry button on failure, which re-dispatches', (tester) async {
    when(() => bloc.state).thenReturn(const DashboardError(NetworkFailure()));
    whenListen(bloc, const Stream<DashboardState>.empty(), initialState: const DashboardError(NetworkFailure()));

    await tester.pumpWidget(buildSubject());
    await tester.pump();

    expect(find.text('Network error. Check your connection and try again.'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);

    await tester.tap(find.text('Retry'));

    verify(() => bloc.add(const DashboardRequested())).called(greaterThanOrEqualTo(1));
  });
}
