import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/features/portfolio/domain/entities/portfolio.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_event.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_state.dart';
import 'package:dhan_sanket/features/portfolio/presentation/pages/portfolio_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockPortfolioBloc extends MockBloc<PortfolioEvent, PortfolioState> implements PortfolioBloc {}

void main() {
  late MockPortfolioBloc bloc;

  setUpAll(() {
    registerFallbackValue(const PortfoliosRequested());
  });

  setUp(() {
    bloc = MockPortfolioBloc();
    when(() => bloc.state).thenReturn(const PortfolioInitial());
    whenListen(bloc, const Stream<PortfolioState>.empty(), initialState: const PortfolioInitial());
  });

  Widget buildSubject() {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider<PortfolioBloc>.value(value: bloc, child: const PortfolioListPage()),
        ),
        GoRoute(path: '/portfolio-detail/:id', builder: (context, state) => const SizedBox()),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('dispatches PortfoliosRequested on init', (tester) async {
    await tester.pumpWidget(buildSubject());
    verify(() => bloc.add(const PortfoliosRequested())).called(1);
  });

  testWidgets('shows an empty state with a create action', (tester) async {
    when(() => bloc.state).thenReturn(const PortfolioLoaded([]));
    whenListen(bloc, const Stream<PortfolioState>.empty(), initialState: const PortfolioLoaded([]));

    await tester.pumpWidget(buildSubject());

    expect(find.text('No portfolios yet.'), findsOneWidget);
    expect(find.text('Create one'), findsOneWidget);
  });

  testWidgets('shows portfolios when loaded', (tester) async {
    final portfolios = [Portfolio(id: 'p1', name: 'Main', createdAt: DateTime(2026, 1, 1))];
    when(() => bloc.state).thenReturn(PortfolioLoaded(portfolios));
    whenListen(bloc, const Stream<PortfolioState>.empty(), initialState: PortfolioLoaded(portfolios));

    await tester.pumpWidget(buildSubject());

    expect(find.text('Main'), findsOneWidget);
  });
}
