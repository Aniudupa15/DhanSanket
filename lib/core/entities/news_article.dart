enum NewsCategory { market, company, economy, regulation, sector }

/// Shared across features/dashboard (latest news preview) and
/// features/stocks (per-symbol news tab) and the Phase 3 standalone news
/// feed - identical backend shape (`NewsArticleOut`) consumed from multiple
/// endpoints, so the entity lives in core/ while each feature keeps its own
/// DTO/mapping in its own data layer.
class NewsArticle {
  final String headline;
  final String? summary;
  final String source;
  final String url;
  final NewsCategory category;
  final List<String> relatedSymbols;
  final DateTime publishedAt;

  const NewsArticle({
    required this.headline,
    required this.summary,
    required this.source,
    required this.url,
    required this.category,
    required this.relatedSymbols,
    required this.publishedAt,
  });
}
