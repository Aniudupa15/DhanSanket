import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network/auth_interceptor.dart';
import '../core/network/auth_session_notifier.dart';
import '../core/network/connectivity_service.dart';
import '../core/network/dio_client.dart';
import '../core/network/live_socket_service.dart';
import '../core/network/token_refresh_coordinator.dart';
import '../core/router/app_router.dart';
import '../core/storage/secure_token_storage.dart';
import '../features/alerts/data/datasources/alert_remote_data_source.dart';
import '../features/alerts/data/datasources/notification_remote_data_source.dart';
import '../features/alerts/data/repositories/alert_repository_impl.dart';
import '../features/alerts/data/repositories/notification_repository_impl.dart';
import '../features/alerts/domain/repositories/alert_repository.dart';
import '../features/alerts/domain/repositories/notification_repository.dart';
import '../features/alerts/presentation/bloc/alert_bloc.dart';
import '../features/alerts/presentation/bloc/notification_bloc.dart';
import '../features/analysis/data/datasources/analysis_remote_data_source.dart';
import '../features/analysis/data/datasources/momentum_remote_data_source.dart';
import '../features/analysis/data/repositories/analysis_repository_impl.dart';
import '../features/analysis/data/repositories/momentum_repository_impl.dart';
import '../features/analysis/domain/repositories/analysis_repository.dart';
import '../features/analysis/domain/repositories/momentum_repository.dart';
import '../features/analysis/presentation/bloc/intraday_analysis_bloc.dart';
import '../features/analysis/presentation/bloc/long_term_analysis_bloc.dart';
import '../features/analysis/presentation/bloc/momentum_bloc.dart';
import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/chat/data/datasources/chat_remote_data_source.dart';
import '../features/chat/data/repositories/chat_repository_impl.dart';
import '../features/chat/domain/repositories/chat_repository.dart';
import '../features/chat/presentation/bloc/chat_bloc.dart';
import '../features/compare/data/datasources/comparison_remote_data_source.dart';
import '../features/compare/data/repositories/comparison_repository_impl.dart';
import '../features/compare/domain/repositories/comparison_repository.dart';
import '../features/compare/presentation/bloc/comparison_bloc.dart';
import '../features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import '../features/dividends/data/datasources/dividend_remote_data_source.dart';
import '../features/dividends/data/repositories/dividend_repository_impl.dart';
import '../features/dividends/domain/repositories/dividend_repository.dart';
import '../features/dividends/presentation/bloc/dividend_bloc.dart';
import '../features/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../features/dashboard/domain/repositories/dashboard_repository.dart';
import '../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../features/market/data/datasources/market_remote_data_source.dart';
import '../features/market/data/repositories/market_repository_impl.dart';
import '../features/market/domain/repositories/market_repository.dart';
import '../features/market/presentation/bloc/heatmap_bloc.dart';
import '../features/market/presentation/bloc/market_movers_bloc.dart';
import '../features/news/data/datasources/news_remote_data_source.dart';
import '../features/news/data/repositories/news_repository_impl.dart';
import '../features/news/domain/repositories/news_repository.dart';
import '../features/news/presentation/bloc/news_bloc.dart';
import '../features/portfolio/data/datasources/portfolio_remote_data_source.dart';
import '../features/portfolio/data/repositories/portfolio_repository_impl.dart';
import '../features/portfolio/domain/repositories/portfolio_repository.dart';
import '../features/portfolio/presentation/bloc/portfolio_bloc.dart';
import '../features/portfolio/presentation/bloc/portfolio_detail_bloc.dart';
import '../features/screener/data/datasources/screener_remote_data_source.dart';
import '../features/screener/data/repositories/screener_repository_impl.dart';
import '../features/screener/domain/repositories/screener_repository.dart';
import '../features/screener/presentation/bloc/screener_bloc.dart';
import '../features/stocks/data/datasources/stock_remote_data_source.dart';
import '../features/stocks/data/repositories/stock_repository_impl.dart';
import '../features/stocks/domain/repositories/stock_repository.dart';
import '../features/stocks/presentation/bloc/corporate_actions_bloc.dart';
import '../features/stocks/presentation/bloc/fundamentals_bloc.dart';
import '../features/stocks/presentation/bloc/indicators_bloc.dart';
import '../features/stocks/presentation/bloc/price_history_bloc.dart';
import '../features/stocks/presentation/bloc/signals_bloc.dart';
import '../features/stocks/presentation/bloc/stock_news_bloc.dart';
import '../features/stocks/presentation/bloc/stock_quote_bloc.dart';
import '../features/stocks/presentation/bloc/stock_search_bloc.dart';
import '../features/watchlist/data/datasources/watchlist_remote_data_source.dart';
import '../features/watchlist/data/repositories/watchlist_repository_impl.dart';
import '../features/watchlist/domain/repositories/watchlist_repository.dart';
import '../features/watchlist/presentation/bloc/watchlist_bloc.dart';
import '../features/watchlist/presentation/bloc/watchlist_detail_bloc.dart';

const _mainDio = 'mainDio';
const _bareDio = 'bareDio';

final getIt = GetIt.instance;

/// Wires every dependency this phase needs. Each new feature in Phase 2/3
/// only adds its own block here (data source -> repository -> Bloc) -
/// nothing above it needs to change.
void setupInjector() {
  getIt.registerLazySingleton<SecureTokenStorage>(() => SecureTokenStorage());
  getIt.registerLazySingleton<AuthSessionNotifier>(() => AuthSessionNotifier());
  getIt.registerLazySingleton<ConnectivityService>(() => ConnectivityService());
  getIt.registerLazySingleton<LiveSocketService>(() => LiveSocketService(tokenStorage: getIt<SecureTokenStorage>()));

  // Two Dio instances: `mainDio` (gets the auth interceptor, used by every
  // feature) and `bareDio` (no interceptor - used exclusively by
  // TokenRefreshCoordinator so a 401 on the refresh call itself can never
  // recursively trigger another refresh).
  getIt.registerLazySingleton<Dio>(() => DioClient.create(), instanceName: _mainDio);
  getIt.registerLazySingleton<Dio>(() => DioClient.createBare(), instanceName: _bareDio);

  getIt.registerLazySingleton<TokenRefreshCoordinator>(
    () => TokenRefreshCoordinator(
      bareDio: getIt<Dio>(instanceName: _bareDio),
      tokenStorage: getIt<SecureTokenStorage>(),
      sessionNotifier: getIt<AuthSessionNotifier>(),
    ),
  );

  getIt<Dio>(instanceName: _mainDio).interceptors.add(
    AuthInterceptor(
      dio: getIt<Dio>(instanceName: _mainDio),
      tokenStorage: getIt<SecureTokenStorage>(),
      refreshCoordinator: getIt<TokenRefreshCoordinator>(),
    ),
  );

  // Auth feature
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(getIt<Dio>(instanceName: _mainDio)));
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remote: getIt<AuthRemoteDataSource>(), tokenStorage: getIt<SecureTokenStorage>()),
  );
  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(repository: getIt<AuthRepository>(), sessionNotifier: getIt<AuthSessionNotifier>()),
  );

  // Dashboard feature
  getIt.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSource(getIt<Dio>(instanceName: _mainDio)),
  );
  getIt.registerLazySingleton<DashboardRepository>(() => DashboardRepositoryImpl(getIt<DashboardRemoteDataSource>()));
  getIt.registerLazySingleton<DashboardBloc>(
    () => DashboardBloc(repository: getIt<DashboardRepository>(), liveSocketService: getIt<LiveSocketService>()),
  );

  // Stocks feature - repository/datasource are stateless, safe as
  // singletons; every Bloc below is a *factory* (fresh instance per page
  // push) since search/detail pages are pushed and popped repeatedly,
  // unlike the app-lifetime Auth/Dashboard singletons above.
  getIt.registerLazySingleton<StockRemoteDataSource>(() => StockRemoteDataSource(getIt<Dio>(instanceName: _mainDio)));
  getIt.registerLazySingleton<StockRepository>(() => StockRepositoryImpl(getIt<StockRemoteDataSource>()));
  getIt.registerFactory<StockSearchBloc>(() => StockSearchBloc(repository: getIt<StockRepository>()));
  getIt.registerFactory<StockQuoteBloc>(
    () => StockQuoteBloc(repository: getIt<StockRepository>(), liveSocketService: getIt<LiveSocketService>()),
  );
  getIt.registerFactory<PriceHistoryBloc>(() => PriceHistoryBloc(repository: getIt<StockRepository>()));
  getIt.registerFactory<IndicatorsBloc>(() => IndicatorsBloc(repository: getIt<StockRepository>()));
  getIt.registerFactory<SignalsBloc>(() => SignalsBloc(repository: getIt<StockRepository>()));
  getIt.registerFactory<FundamentalsBloc>(() => FundamentalsBloc(repository: getIt<StockRepository>()));
  getIt.registerFactory<StockNewsBloc>(() => StockNewsBloc(repository: getIt<StockRepository>()));
  getIt.registerFactory<CorporateActionsBloc>(() => CorporateActionsBloc(repository: getIt<StockRepository>()));

  // Watchlist feature
  getIt.registerLazySingleton<WatchlistRemoteDataSource>(
    () => WatchlistRemoteDataSource(getIt<Dio>(instanceName: _mainDio)),
  );
  getIt.registerLazySingleton<WatchlistRepository>(() => WatchlistRepositoryImpl(getIt<WatchlistRemoteDataSource>()));
  getIt.registerFactory<WatchlistBloc>(() => WatchlistBloc(repository: getIt<WatchlistRepository>()));
  getIt.registerFactory<WatchlistDetailBloc>(
    () => WatchlistDetailBloc(repository: getIt<WatchlistRepository>(), liveSocketService: getIt<LiveSocketService>()),
  );

  // Portfolio feature
  getIt.registerLazySingleton<PortfolioRemoteDataSource>(
    () => PortfolioRemoteDataSource(getIt<Dio>(instanceName: _mainDio)),
  );
  getIt.registerLazySingleton<PortfolioRepository>(() => PortfolioRepositoryImpl(getIt<PortfolioRemoteDataSource>()));
  getIt.registerFactory<PortfolioBloc>(() => PortfolioBloc(repository: getIt<PortfolioRepository>()));
  getIt.registerFactory<PortfolioDetailBloc>(
    () => PortfolioDetailBloc(repository: getIt<PortfolioRepository>(), liveSocketService: getIt<LiveSocketService>()),
  );

  // News feature
  getIt.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSource(getIt<Dio>(instanceName: _mainDio)));
  getIt.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(getIt<NewsRemoteDataSource>()));
  getIt.registerFactory<NewsBloc>(() => NewsBloc(repository: getIt<NewsRepository>()));

  // Market feature (movers lists + heatmap)
  getIt.registerLazySingleton<MarketRemoteDataSource>(() => MarketRemoteDataSource(getIt<Dio>(instanceName: _mainDio)));
  getIt.registerLazySingleton<MarketRepository>(() => MarketRepositoryImpl(getIt<MarketRemoteDataSource>()));
  getIt.registerFactory<MarketMoversBloc>(
    () => MarketMoversBloc(repository: getIt<MarketRepository>(), liveSocketService: getIt<LiveSocketService>()),
  );
  getIt.registerFactory<HeatmapBloc>(() => HeatmapBloc(repository: getIt<MarketRepository>()));

  // Compare feature
  getIt.registerLazySingleton<ComparisonRemoteDataSource>(
    () => ComparisonRemoteDataSource(getIt<Dio>(instanceName: _mainDio)),
  );
  getIt.registerLazySingleton<ComparisonRepository>(
    () => ComparisonRepositoryImpl(getIt<ComparisonRemoteDataSource>()),
  );
  getIt.registerFactory<ComparisonBloc>(() => ComparisonBloc(repository: getIt<ComparisonRepository>()));

  // Screener feature
  getIt.registerLazySingleton<ScreenerRemoteDataSource>(
    () => ScreenerRemoteDataSource(getIt<Dio>(instanceName: _mainDio)),
  );
  getIt.registerLazySingleton<ScreenerRepository>(() => ScreenerRepositoryImpl(getIt<ScreenerRemoteDataSource>()));
  getIt.registerFactory<ScreenerBloc>(() => ScreenerBloc(repository: getIt<ScreenerRepository>()));

  // Alerts + notifications feature
  getIt.registerLazySingleton<AlertRemoteDataSource>(() => AlertRemoteDataSource(getIt<Dio>(instanceName: _mainDio)));
  getIt.registerLazySingleton<AlertRepository>(() => AlertRepositoryImpl(getIt<AlertRemoteDataSource>()));
  getIt.registerFactory<AlertBloc>(() => AlertBloc(repository: getIt<AlertRepository>()));
  getIt.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSource(getIt<Dio>(instanceName: _mainDio)),
  );
  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(getIt<NotificationRemoteDataSource>()),
  );
  getIt.registerFactory<NotificationBloc>(() => NotificationBloc(repository: getIt<NotificationRepository>()));

  // AI chat feature
  getIt.registerLazySingleton<ChatRemoteDataSource>(() => ChatRemoteDataSource(getIt<Dio>(instanceName: _mainDio)));
  getIt.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(getIt<ChatRemoteDataSource>()));
  getIt.registerFactory<ChatBloc>(() => ChatBloc(repository: getIt<ChatRepository>()));

  // Analysis feature
  getIt.registerLazySingleton<AnalysisRemoteDataSource>(
    () => AnalysisRemoteDataSource(getIt<Dio>(instanceName: _mainDio)),
  );
  getIt.registerLazySingleton<AnalysisRepository>(() => AnalysisRepositoryImpl(getIt<AnalysisRemoteDataSource>()));
  getIt.registerFactory<IntradayAnalysisBloc>(() => IntradayAnalysisBloc(repository: getIt<AnalysisRepository>()));
  getIt.registerFactory<LongTermAnalysisBloc>(() => LongTermAnalysisBloc(repository: getIt<AnalysisRepository>()));
  getIt.registerLazySingleton<MomentumRemoteDataSource>(
    () => MomentumRemoteDataSource(getIt<Dio>(instanceName: _mainDio)),
  );
  getIt.registerLazySingleton<MomentumRepository>(() => MomentumRepositoryImpl(getIt<MomentumRemoteDataSource>()));
  getIt.registerFactory<MomentumBloc>(() => MomentumBloc(repository: getIt<MomentumRepository>()));

  // Dividends feature
  getIt.registerLazySingleton<DividendRemoteDataSource>(
    () => DividendRemoteDataSource(getIt<Dio>(instanceName: _mainDio)),
  );
  getIt.registerLazySingleton<DividendRepository>(() => DividendRepositoryImpl(getIt<DividendRemoteDataSource>()));
  getIt.registerFactory<DividendBloc>(() => DividendBloc(repository: getIt<DividendRepository>()));

  // Router - depends on AuthBloc for its redirect logic and refreshListenable.
  getIt.registerLazySingleton<AppRouter>(() => AppRouter(getIt<AuthBloc>()));
}
