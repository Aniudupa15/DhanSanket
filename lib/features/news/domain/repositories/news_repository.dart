import '../../../../core/entities/news_article.dart';
import '../../../../core/error/result.dart';

abstract class NewsRepository {
  Future<Result<List<NewsArticle>>> getNews({NewsCategory? category, String? symbol, int limit = 20, int offset = 0});
}
