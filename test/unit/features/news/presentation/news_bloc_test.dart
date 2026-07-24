import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/entities/news_article.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/news/domain/repositories/news_repository.dart';
import 'package:dhan_sanket/features/news/presentation/bloc/news_bloc.dart';
import 'package:dhan_sanket/features/news/presentation/bloc/news_event.dart';
import 'package:dhan_sanket/features/news/presentation/bloc/news_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late MockNewsRepository repository;

  final article = NewsArticle(
    headline: 'Market rallies',
    summary: null,
    source: 'source.com',
    url: 'https://source.com/a',
    category: NewsCategory.market,
    relatedSymbols: [],
    publishedAt: DateTime(2026, 1, 1),
  );

  setUp(() {
    repository = MockNewsRepository();
  });

  blocTest<NewsBloc, NewsState>(
    'emits loading then loaded on a successful fetch',
    build: () {
      when(
        () => repository.getNews(
          category: any(named: 'category'),
          symbol: any(named: 'symbol'),
        ),
      ).thenAnswer((_) async => Success([article]));
      return NewsBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const NewsRequested()),
    expect: () => [const NewsLoading(), isA<NewsLoaded>()],
  );

  blocTest<NewsBloc, NewsState>(
    'emits loading then error on failure',
    build: () {
      when(
        () => repository.getNews(
          category: any(named: 'category'),
          symbol: any(named: 'symbol'),
        ),
      ).thenAnswer((_) async => const Error(NetworkFailure()));
      return NewsBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const NewsRequested()),
    expect: () => [const NewsLoading(), isA<NewsError>()],
  );
}
