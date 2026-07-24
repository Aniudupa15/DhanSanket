class RoutePaths {
  RoutePaths._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String stocks = '/stocks';
  static const String watchlist = '/watchlist';
  static const String portfolio = '/portfolio';
  static const String more = '/more';

  // Top-level (pushed above the shell, hiding the bottom nav) detail routes.
  static String stockDetail(String symbol) => '/stock-detail/$symbol';
  static String watchlistDetail(String id) => '/watchlist-detail/$id';
  static String portfolioDetail(String id) => '/portfolio-detail/$id';
  static String addTransaction(String portfolioId) => '/portfolio-detail/$portfolioId/add-transaction';

  // Phase 3 - reached from Dashboard "See all" links and the More menu.
  static const String news = '/news';
  static String marketMovers(String category) => '/market/movers/$category';
  static const String marketHeatmap = '/market/heatmap';
  static const String compare = '/compare';
  static const String screener = '/screener';
  static const String alerts = '/alerts';
  static const String notifications = '/notifications';
  static const String chat = '/chat';

  // Phase 4
  static const String profile = '/profile';
}
