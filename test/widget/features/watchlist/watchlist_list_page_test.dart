import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/features/watchlist/domain/entities/watchlist.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_state.dart';
import 'package:dhan_sanket/features/watchlist/presentation/pages/watchlist_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockWatchlistBloc extends MockBloc<WatchlistEvent, WatchlistState> implements WatchlistBloc {}

void main() {
  late MockWatchlistBloc bloc;

  setUpAll(() {
    registerFallbackValue(const WatchlistsRequested());
  });

  setUp(() {
    bloc = MockWatchlistBloc();
    when(() => bloc.state).thenReturn(const WatchlistInitial());
    whenListen(bloc, const Stream<WatchlistState>.empty(), initialState: const WatchlistInitial());
  });

  Widget buildSubject() {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider<WatchlistBloc>.value(value: bloc, child: const WatchlistListPage()),
        ),
        GoRoute(path: '/watchlist-detail/:id', builder: (context, state) => const SizedBox()),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('dispatches WatchlistsRequested on init', (tester) async {
    await tester.pumpWidget(buildSubject());
    verify(() => bloc.add(const WatchlistsRequested())).called(1);
  });

  testWidgets('shows an empty state with a create action', (tester) async {
    when(() => bloc.state).thenReturn(const WatchlistLoaded([]));
    whenListen(bloc, const Stream<WatchlistState>.empty(), initialState: const WatchlistLoaded([]));

    await tester.pumpWidget(buildSubject());

    expect(find.text('No watchlists yet.'), findsOneWidget);
    expect(find.text('Create one'), findsOneWidget);
  });

  testWidgets('shows watchlists when loaded', (tester) async {
    final watchlists = [Watchlist(id: 'w1', name: 'Tech', createdAt: DateTime(2026, 1, 1), itemCount: 2)];
    when(() => bloc.state).thenReturn(WatchlistLoaded(watchlists));
    whenListen(bloc, const Stream<WatchlistState>.empty(), initialState: WatchlistLoaded(watchlists));

    await tester.pumpWidget(buildSubject());

    expect(find.text('Tech'), findsOneWidget);
    expect(find.text('2 stock(s)'), findsOneWidget);
  });
}
