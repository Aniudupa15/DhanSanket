import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network/auth_interceptor.dart';
import '../core/network/auth_session_notifier.dart';
import '../core/network/dio_client.dart';
import '../core/network/token_refresh_coordinator.dart';
import '../core/router/app_router.dart';
import '../core/storage/secure_token_storage.dart';
import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import '../features/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../features/dashboard/domain/repositories/dashboard_repository.dart';
import '../features/dashboard/presentation/bloc/dashboard_bloc.dart';

const _mainDio = 'mainDio';
const _bareDio = 'bareDio';

final getIt = GetIt.instance;

/// Wires every dependency this phase needs. Each new feature in Phase 2/3
/// only adds its own block here (data source -> repository -> Bloc) -
/// nothing above it needs to change.
void setupInjector() {
  getIt.registerLazySingleton<SecureTokenStorage>(() => SecureTokenStorage());
  getIt.registerLazySingleton<AuthSessionNotifier>(() => AuthSessionNotifier());

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
  getIt.registerLazySingleton<DashboardBloc>(() => DashboardBloc(repository: getIt<DashboardRepository>()));

  // Router - depends on AuthBloc for its redirect logic and refreshListenable.
  getIt.registerLazySingleton<AppRouter>(() => AppRouter(getIt<AuthBloc>()));
}
