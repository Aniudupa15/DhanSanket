import 'index_quote.dart';
import 'market_mover.dart';
import 'market_status.dart';
import 'news_article.dart';

class DashboardSnapshot {
  final List<MarketStatus> marketStatus;
  final List<IndexQuote> indices;
  final List<MarketMover> gainers;
  final List<MarketMover> losers;
  final List<MarketMover> mostActive;
  final List<MarketMover> fiftyTwoWeekHigh;
  final List<MarketMover> fiftyTwoWeekLow;
  final List<NewsArticle> latestNews;
  final List<String> notes;

  const DashboardSnapshot({
    required this.marketStatus,
    required this.indices,
    required this.gainers,
    required this.losers,
    required this.mostActive,
    required this.fiftyTwoWeekHigh,
    required this.fiftyTwoWeekLow,
    required this.latestNews,
    required this.notes,
  });
}
