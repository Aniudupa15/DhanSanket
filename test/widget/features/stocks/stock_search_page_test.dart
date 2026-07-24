import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/bootstrap/injector.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/instrument_type.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/stock_search_result.dart';
import 'package:dhan_sanket/features/stocks/domain/repositories/stock_repository.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_search_bloc.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_search_event.dart';
import 'package:dhan_sanket/features/stocks/presentation/bloc/stock_search_state.dart';
import 'package:dhan_sanket/features/stocks/presentation/pages/stock_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockStockSearchBloc extends MockBloc<StockSearchEvent, StockSearchState> implements StockSearchBloc {}

class MockStockRepository extends Mock implements StockRepository {}

void main() {
  late MockStockSearchBloc bloc;
  late MockStockRepository repository;

  setUpAll(() {
    registerFallbackValue(const StockSearchCleared());
  });

  setUp(() {
    bloc = MockStockSearchBloc();
    repository = MockStockRepository();
    when(() => repository.getSearchHistory()).thenAnswer((_) async => const Success([]));
    getIt.registerSingleton<StockRepository>(repository);
  });

  tearDown(() {
    getIt.unregister<StockRepository>();
  });

  Widget buildSubject() {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider<StockSearchBloc>.value(value: bloc, child: const StockSearchPage()),
        ),
        GoRoute(path: '/stock-detail/:symbol', builder: (context, state) => const SizedBox()),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('shows a prompt initially', (tester) async {
    when(() => bloc.state).thenReturn(const StockSearchInitial());
    whenListen(bloc, const Stream<StockSearchState>.empty(), initialState: const StockSearchInitial());

    await tester.pumpWidget(buildSubject());
    await tester.pump();

    expect(find.text('Start typing to search real NSE stocks.'), findsOneWidget);
  });

  testWidgets('shows results when loaded', (tester) async {
    const results = [
      StockSearchResult(
        symbol: 'RELIANCE',
        name: 'Reliance Industries',
        isin: null,
        series: 'EQ',
        instrumentType: InstrumentType.equity,
      ),
    ];
    when(() => bloc.state).thenReturn(const StockSearchLoaded(results));
    whenListen(bloc, const Stream<StockSearchState>.empty(), initialState: const StockSearchLoaded(results));

    await tester.pumpWidget(buildSubject());

    expect(find.text('RELIANCE'), findsOneWidget);
  });

  testWidgets('dispatches a query after debounce when typing', (tester) async {
    when(() => bloc.state).thenReturn(const StockSearchInitial());
    whenListen(bloc, const Stream<StockSearchState>.empty(), initialState: const StockSearchInitial());

    await tester.pumpWidget(buildSubject());
    await tester.pump();
    await tester.enterText(find.byType(TextField), 'reliance');
    await tester.pump(const Duration(milliseconds: 400));

    verify(() => bloc.add(const StockSearchQueryChanged('reliance'))).called(1);
  });
}
