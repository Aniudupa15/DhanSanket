import 'package:dhan_sanket/core/entities/news_article.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/news/data/datasources/news_remote_data_source.dart';
import 'package:dhan_sanket/features/news/data/dto/news_article_dto.dart';
import 'package:dhan_sanket/features/news/data/repositories/news_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsRemoteDataSource extends Mock implements NewsRemoteDataSource {}

void main() {
  late MockNewsRemoteDataSource remote;
  late NewsRepositoryImpl repository;

  setUp(() {
    remote = MockNewsRemoteDataSource();
    repository = NewsRepositoryImpl(remote);
  });

  test('getNews maps articles and the category enum', () async {
    when(
      () => remote.getNews(
        category: any(named: 'category'),
        symbol: any(named: 'symbol'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer(
      (_) async => [
        NewsArticleDto(
          headline: 'Market rallies',
          summary: 'Stocks up today',
          source: 'economictimes.com',
          url: 'https://economictimes.com/a',
          category: NewsCategoryDto.market,
          relatedSymbols: const ['RELIANCE'],
          publishedAt: DateTime(2026, 1, 1),
        ),
      ],
    );

    final result = await repository.getNews(category: NewsCategory.market);

    expect(result, isA<Success>());
    final articles = (result as Success).data;
    expect(articles.single.headline, 'Market rallies');
    expect(articles.single.category, NewsCategory.market);
  });

  test('getNews maps a DioException to an Error result', () async {
    when(
      () => remote.getNews(
        category: any(named: 'category'),
        symbol: any(named: 'symbol'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/news'),
        type: DioExceptionType.connectionError,
      ),
    );

    final result = await repository.getNews();

    expect(result, isA<Error>());
  });
}
