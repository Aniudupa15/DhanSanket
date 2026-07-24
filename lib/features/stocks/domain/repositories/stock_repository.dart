import '../../../../core/entities/news_article.dart';
import '../../../../core/error/result.dart';
import '../entities/corporate_action.dart';
import '../entities/fundamentals.dart';
import '../entities/indicators.dart';
import '../entities/intraday_signal.dart';
import '../entities/long_term_signal.dart';
import '../entities/price_history.dart';
import '../entities/search_history_entry.dart';
import '../entities/stock_detail.dart';
import '../entities/stock_search_result.dart';

/// One repository for the whole `/stocks/{symbol}/*` resource family - every
/// method maps to a single backend endpoint, kept together since they're all
/// facets of the same "one stock" concept rather than separate resources.
abstract class StockRepository {
  Future<Result<List<StockSearchResult>>> search(String query, {int limit = 20});
  Future<Result<StockDetail>> getDetail(String symbol);
  Future<Result<PriceHistory>> getHistory(String symbol, {String range = '1Y'});
  Future<Result<Indicators>> getIndicators(String symbol);
  Future<Result<List<CorporateAction>>> getCorporateActions(String symbol);
  Future<Result<IntradaySignal>> getIntradaySignal(String symbol);
  Future<Result<Fundamentals>> getFundamentals(String symbol);
  Future<Result<LongTermSignal>> getLongTermSignal(String symbol);
  Future<Result<List<NewsArticle>>> getNews(String symbol);
  Future<Result<List<SearchHistoryEntry>>> getSearchHistory();
  Future<Result<void>> clearSearchHistory();
}
