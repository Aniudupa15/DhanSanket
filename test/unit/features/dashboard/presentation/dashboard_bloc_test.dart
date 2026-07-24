import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/core/network/live_socket_service.dart';
import 'package:dhan_sanket/features/dashboard/domain/entities/dashboard_snapshot.dart';
import 'package:dhan_sanket/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:dhan_sanket/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dhan_sanket/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:dhan_sanket/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fakes/mock_live_socket_service.dart';

class MockDashboardRepository extends Mock implements DashboardRepository {}

void main() {
  late MockDashboardRepository repository;
  late MockLiveSocketService liveSocketService;

  const emptySnapshot = DashboardSnapshot(
    marketStatus: [],
    indices: [],
    gainers: [],
    losers: [],
    mostActive: [],
    fiftyTwoWeekHigh: [],
    fiftyTwoWeekLow: [],
    latestNews: [],
    notes: [],
  );

  setUp(() {
    repository = MockDashboardRepository();
    liveSocketService = MockLiveSocketService();
  });

  blocTest<DashboardBloc, DashboardState>(
    'emits loading then loaded on success',
    build: () {
      when(() => repository.getDashboard()).thenAnswer((_) async => const Success(emptySnapshot));
      return DashboardBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const DashboardRequested()),
    expect: () => [isA<DashboardLoading>(), isA<DashboardLoaded>()],
  );

  blocTest<DashboardBloc, DashboardState>(
    'emits loading then error on failure',
    build: () {
      when(() => repository.getDashboard()).thenAnswer((_) async => const Error(NetworkFailure()));
      return DashboardBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const DashboardRequested()),
    expect: () => [isA<DashboardLoading>(), isA<DashboardError>()],
  );

  blocTest<DashboardBloc, DashboardState>(
    'refresh re-triggers loading then loaded',
    build: () {
      when(() => repository.getDashboard()).thenAnswer((_) async => const Success(emptySnapshot));
      return DashboardBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const DashboardRefreshRequested()),
    expect: () => [isA<DashboardLoading>(), isA<DashboardLoaded>()],
  );

  blocTest<DashboardBloc, DashboardState>(
    'patches gainers/losers/most-active in place on a live market snapshot',
    build: () {
      when(() => repository.getDashboard()).thenAnswer((_) async => const Success(emptySnapshot));
      return DashboardBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) async {
      bloc.add(const DashboardRequested());
      await Future<void>.delayed(const Duration(milliseconds: 10));
      liveSocketService.emit(const MarketSnapshotLiveEvent(gainers: [], losers: [], mostActive: []));
    },
    wait: const Duration(milliseconds: 50),
    skip: 2,
    expect: () => [isA<DashboardLoaded>()],
  );
}
