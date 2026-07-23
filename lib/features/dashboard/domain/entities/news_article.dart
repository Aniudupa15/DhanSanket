enum NewsCategory { market, company, economy, regulation, sector }

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
