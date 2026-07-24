import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/entities/news_article.dart';
import 'package:dhan_sanket/features/news/presentation/bloc/news_bloc.dart';
import 'package:dhan_sanket/features/news/presentation/bloc/news_event.dart';
import 'package:dhan_sanket/features/news/presentation/bloc/news_state.dart';
import 'package:dhan_sanket/features/news/presentation/pages/news_feed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsBloc extends MockBloc<NewsEvent, NewsState> implements NewsBloc {}

void main() {
  late MockNewsBloc bloc;

  setUpAll(() {
    registerFallbackValue(const NewsRequested());
  });

  setUp(() {
    bloc = MockNewsBloc();
  });

  Widget buildSubject() {
    return MaterialApp(
      home: BlocProvider<NewsBloc>.value(value: bloc, child: const NewsFeedPage()),
    );
  }

  testWidgets('dispatches NewsRequested on init', (tester) async {
    when(() => bloc.state).thenReturn(const NewsInitial());
    whenListen(bloc, const Stream<NewsState>.empty(), initialState: const NewsInitial());

    await tester.pumpWidget(buildSubject());

    verify(() => bloc.add(const NewsRequested())).called(1);
  });

  testWidgets('shows articles when loaded', (tester) async {
    final articles = [
      NewsArticle(
        headline: 'Market rallies',
        summary: null,
        source: 'source.com',
        url: 'https://source.com/a',
        category: NewsCategory.market,
        relatedSymbols: const [],
        publishedAt: DateTime(2026, 1, 1),
      ),
    ];
    when(() => bloc.state).thenReturn(NewsLoaded(articles));
    whenListen(bloc, const Stream<NewsState>.empty(), initialState: NewsLoaded(articles));

    await tester.pumpWidget(buildSubject());

    expect(find.text('Market rallies'), findsOneWidget);
  });

  testWidgets('dispatches a category filter when a chip is tapped', (tester) async {
    when(() => bloc.state).thenReturn(const NewsLoaded([]));
    whenListen(bloc, const Stream<NewsState>.empty(), initialState: const NewsLoaded([]));

    await tester.pumpWidget(buildSubject());
    await tester.tap(find.text('Company'));
    await tester.pump();

    verify(() => bloc.add(const NewsRequested(category: NewsCategory.company))).called(1);
  });
}
