import 'package:dio/dio.dart';

import '../../../../core/entities/news_article.dart';
import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';
import '../dto/news_article_dto.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource _remote;

  NewsRepositoryImpl(this._remote);

  @override
  Future<Result<List<NewsArticle>>> getNews({
    NewsCategory? category,
    String? symbol,
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final dtos = await _remote.getNews(
        category: category == null ? null : _categoryToDto(category),
        symbol: symbol,
        limit: limit,
        offset: offset,
      );
      return Success(dtos.map(_toEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  NewsArticle _toEntity(NewsArticleDto dto) {
    return NewsArticle(
      headline: dto.headline,
      summary: dto.summary,
      source: dto.source,
      url: dto.url,
      category: _categoryToEntity(dto.category),
      relatedSymbols: dto.relatedSymbols,
      publishedAt: dto.publishedAt,
    );
  }

  NewsCategory _categoryToEntity(NewsCategoryDto dto) {
    return switch (dto) {
      NewsCategoryDto.market => NewsCategory.market,
      NewsCategoryDto.company => NewsCategory.company,
      NewsCategoryDto.economy => NewsCategory.economy,
      NewsCategoryDto.regulation => NewsCategory.regulation,
      NewsCategoryDto.sector => NewsCategory.sector,
    };
  }

  NewsCategoryDto _categoryToDto(NewsCategory category) {
    return switch (category) {
      NewsCategory.market => NewsCategoryDto.market,
      NewsCategory.company => NewsCategoryDto.company,
      NewsCategory.economy => NewsCategoryDto.economy,
      NewsCategory.regulation => NewsCategoryDto.regulation,
      NewsCategory.sector => NewsCategoryDto.sector,
    };
  }
}
