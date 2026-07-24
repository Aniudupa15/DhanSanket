class ApiEndpoints {
  ApiEndpoints._();

  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String refresh = '/auth/refresh';
  static const String logout = '/auth/logout';
  static const String me = '/auth/me';

  static const String dashboard = '/dashboard';

  static const String news = '/news';

  static const String marketGainers = '/market/gainers';
  static const String marketLosers = '/market/losers';
  static const String marketMostActive = '/market/most-active';
  static const String market52WeekHigh = '/market/52-week-high';
  static const String market52WeekLow = '/market/52-week-low';
  static const String marketHeatmap = '/market/heatmap';

  static const String stockCompare = '/stocks/compare';

  static const String screener = '/screener';

  static const String alerts = '/alerts';
  static String alertDetail(String id) => '/alerts/$id';

  static const String notifications = '/notifications';
  static String notificationRead(String id) => '/notifications/$id/read';

  static const String chat = '/chat';

  static const String searchHistory = '/search-history';

  static const String stockSearch = '/stocks/search';

  static String stockDetail(String symbol) => '/stocks/$symbol';
  static String stockHistory(String symbol) => '/stocks/$symbol/history';
  static String stockIndicators(String symbol) => '/stocks/$symbol/indicators';
  static String stockCorporateActions(String symbol) => '/stocks/$symbol/corporate-actions';
  static String stockIntradaySignal(String symbol) => '/stocks/$symbol/intraday-signal';
  static String stockFundamentals(String symbol) => '/stocks/$symbol/fundamentals';
  static String stockLongTermSignal(String symbol) => '/stocks/$symbol/long-term-signal';
  static String stockNews(String symbol) => '/stocks/$symbol/news';

  static const String watchlists = '/watchlists';
  static String watchlistDetail(String id) => '/watchlists/$id';
  static String watchlistItems(String id) => '/watchlists/$id/items';
  static String watchlistItem(String id, String symbol) => '/watchlists/$id/items/$symbol';

  static const String portfolios = '/portfolios';
  static String portfolioDetail(String id) => '/portfolios/$id';
  static String portfolioTransactions(String id) => '/portfolios/$id/transactions';
  static String portfolioPerformance(String id) => '/portfolios/$id/performance';
}
