import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bootstrap/injector.dart';
import '../../features/alerts/presentation/bloc/alert_bloc.dart';
import '../../features/alerts/presentation/bloc/notification_bloc.dart';
import '../../features/alerts/presentation/pages/alerts_page.dart';
import '../../features/alerts/presentation/pages/notifications_page.dart';
import '../../features/analysis/presentation/bloc/intraday_analysis_bloc.dart';
import '../../features/analysis/presentation/bloc/long_term_analysis_bloc.dart';
import '../../features/analysis/presentation/pages/analysis_page.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/profile_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/chat/presentation/bloc/chat_bloc.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/compare/presentation/bloc/comparison_bloc.dart';
import '../../features/compare/presentation/pages/compare_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/dividends/presentation/bloc/dividend_bloc.dart';
import '../../features/dividends/presentation/pages/dividends_page.dart';
import '../../features/market/domain/entities/mover_category.dart';
import '../../features/market/presentation/bloc/heatmap_bloc.dart';
import '../../features/market/presentation/bloc/market_movers_bloc.dart';
import '../../features/market/presentation/pages/heatmap_page.dart';
import '../../features/market/presentation/pages/market_movers_page.dart';
import '../../features/more/presentation/pages/more_menu_page.dart';
import '../../features/news/presentation/bloc/news_bloc.dart';
import '../../features/news/presentation/pages/news_feed_page.dart';
import '../../features/portfolio/presentation/bloc/portfolio_bloc.dart';
import '../../features/portfolio/presentation/bloc/portfolio_detail_bloc.dart';
import '../../features/portfolio/presentation/pages/add_transaction_page.dart';
import '../../features/portfolio/presentation/pages/portfolio_detail_page.dart';
import '../../features/portfolio/presentation/pages/portfolio_list_page.dart';
import '../../features/screener/presentation/bloc/screener_bloc.dart';
import '../../features/screener/presentation/pages/screener_page.dart';
import '../../features/shell/presentation/pages/app_shell_page.dart';
import '../../features/stocks/presentation/bloc/corporate_actions_bloc.dart';
import '../../features/stocks/presentation/bloc/fundamentals_bloc.dart';
import '../../features/stocks/presentation/bloc/indicators_bloc.dart';
import '../../features/stocks/presentation/bloc/price_history_bloc.dart';
import '../../features/stocks/presentation/bloc/signals_bloc.dart';
import '../../features/stocks/presentation/bloc/stock_news_bloc.dart';
import '../../features/stocks/presentation/bloc/stock_quote_bloc.dart';
import '../../features/stocks/presentation/bloc/stock_search_bloc.dart';
import '../../features/stocks/presentation/pages/stock_detail_page.dart';
import '../../features/stocks/presentation/pages/stock_search_page.dart';
import '../../features/watchlist/presentation/bloc/watchlist_bloc.dart';
import '../../features/watchlist/presentation/bloc/watchlist_detail_bloc.dart';
import '../../features/watchlist/presentation/pages/watchlist_detail_page.dart';
import '../../features/watchlist/presentation/pages/watchlist_list_page.dart';
import 'go_router_refresh_stream.dart';
import 'route_paths.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: _redirect,
    routes: [
      GoRoute(path: RoutePaths.splash, builder: (context, state) => const SplashPage()),
      GoRoute(path: RoutePaths.login, builder: (context, state) => const LoginPage()),
      GoRoute(path: RoutePaths.register, builder: (context, state) => const RegisterPage()),
      ShellRoute(
        builder: (context, state, child) => AppShellPage(child: child),
        routes: [
          GoRoute(path: RoutePaths.dashboard, builder: (context, state) => const DashboardPage()),
          GoRoute(
            path: RoutePaths.stocks,
            builder: (context, state) =>
                BlocProvider(create: (_) => getIt<StockSearchBloc>(), child: const StockSearchPage()),
          ),
          GoRoute(
            path: RoutePaths.watchlist,
            builder: (context, state) =>
                BlocProvider(create: (_) => getIt<WatchlistBloc>(), child: const WatchlistListPage()),
          ),
          GoRoute(
            path: RoutePaths.portfolio,
            builder: (context, state) =>
                BlocProvider(create: (_) => getIt<PortfolioBloc>(), child: const PortfolioListPage()),
          ),
          GoRoute(
            path: RoutePaths.analysis,
            builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => getIt<IntradayAnalysisBloc>()),
                BlocProvider(create: (_) => getIt<LongTermAnalysisBloc>()),
              ],
              child: const AnalysisPage(),
            ),
          ),
          GoRoute(path: RoutePaths.more, builder: (context, state) => const MoreMenuPage()),
        ],
      ),
      GoRoute(
        path: RoutePaths.stockDetail(':symbol'),
        builder: (context, state) {
          final symbol = state.pathParameters['symbol']!;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<StockQuoteBloc>()),
              BlocProvider(create: (_) => getIt<PriceHistoryBloc>()),
              BlocProvider(create: (_) => getIt<IndicatorsBloc>()),
              BlocProvider(create: (_) => getIt<SignalsBloc>()),
              BlocProvider(create: (_) => getIt<FundamentalsBloc>()),
              BlocProvider(create: (_) => getIt<StockNewsBloc>()),
              BlocProvider(create: (_) => getIt<CorporateActionsBloc>()),
            ],
            child: StockDetailPage(symbol: symbol),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.watchlistDetail(':id'),
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return BlocProvider(
            create: (_) => getIt<WatchlistDetailBloc>(),
            child: WatchlistDetailPage(watchlistId: id),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.portfolioDetail(':id'),
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return BlocProvider(
            create: (_) => getIt<PortfolioDetailBloc>(),
            child: PortfolioDetailPage(portfolioId: id),
          );
        },
        routes: [
          GoRoute(
            path: 'add-transaction',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return BlocProvider(
                create: (_) => getIt<PortfolioDetailBloc>(),
                child: AddTransactionPage(portfolioId: id),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.news,
        builder: (context, state) => BlocProvider(create: (_) => getIt<NewsBloc>(), child: const NewsFeedPage()),
      ),
      GoRoute(
        path: RoutePaths.marketMovers(':category'),
        builder: (context, state) {
          final category = _categoryFromPath(state.pathParameters['category']!);
          return BlocProvider(
            create: (_) => getIt<MarketMoversBloc>(),
            child: MarketMoversPage(initialCategory: category),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.marketHeatmap,
        builder: (context, state) => BlocProvider(create: (_) => getIt<HeatmapBloc>(), child: const HeatmapPage()),
      ),
      GoRoute(
        path: RoutePaths.compare,
        builder: (context, state) => BlocProvider(create: (_) => getIt<ComparisonBloc>(), child: const ComparePage()),
      ),
      GoRoute(
        path: RoutePaths.screener,
        builder: (context, state) => BlocProvider(create: (_) => getIt<ScreenerBloc>(), child: const ScreenerPage()),
      ),
      GoRoute(
        path: RoutePaths.alerts,
        builder: (context, state) => BlocProvider(create: (_) => getIt<AlertBloc>(), child: const AlertsPage()),
      ),
      GoRoute(
        path: RoutePaths.notifications,
        builder: (context, state) =>
            BlocProvider(create: (_) => getIt<NotificationBloc>(), child: const NotificationsPage()),
      ),
      GoRoute(
        path: RoutePaths.chat,
        builder: (context, state) => BlocProvider(create: (_) => getIt<ChatBloc>(), child: const ChatPage()),
      ),
      GoRoute(path: RoutePaths.profile, builder: (context, state) => const ProfilePage()),
      GoRoute(
        path: RoutePaths.dividends,
        builder: (context, state) => BlocProvider(create: (_) => getIt<DividendBloc>(), child: const DividendsPage()),
      ),
    ],
  );

  MoverCategory _categoryFromPath(String path) {
    return switch (path) {
      'gainers' => MoverCategory.gainers,
      'losers' => MoverCategory.losers,
      'most-active' => MoverCategory.mostActive,
      'fifty-two-week-high' => MoverCategory.fiftyTwoWeekHigh,
      'fifty-two-week-low' => MoverCategory.fiftyTwoWeekLow,
      _ => MoverCategory.gainers,
    };
  }

  /// Splash (`initial`) always wins until the session-restore attempt
  /// resolves. Once resolved: authenticated users get bounced off
  /// login/register/splash to the dashboard; everyone else (unauthenticated
  /// or sessionExpired - the dashboard is gated, not a public preview) gets
  /// sent to login.
  String? _redirect(BuildContext context, GoRouterState state) {
    final status = authBloc.state.status;
    final location = state.matchedLocation;
    final isAuthRoute = location == RoutePaths.login || location == RoutePaths.register;
    final isSplash = location == RoutePaths.splash;

    if (status == AuthStatus.initial) {
      return isSplash ? null : RoutePaths.splash;
    }
    if (status == AuthStatus.authenticated) {
      return (isAuthRoute || isSplash) ? RoutePaths.dashboard : null;
    }
    return isAuthRoute ? null : RoutePaths.login;
  }
}
