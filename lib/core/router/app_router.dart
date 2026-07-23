import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/shell/presentation/pages/app_shell_page.dart';
import '../widgets/empty_tab_placeholder.dart';
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
            builder: (context, state) => const EmptyTabPlaceholder(label: 'Stocks', icon: Icons.show_chart),
          ),
          GoRoute(
            path: RoutePaths.watchlist,
            builder: (context, state) => const EmptyTabPlaceholder(label: 'Watchlist', icon: Icons.star_outline),
          ),
          GoRoute(
            path: RoutePaths.portfolio,
            builder: (context, state) =>
                const EmptyTabPlaceholder(label: 'Portfolio', icon: Icons.account_balance_wallet_outlined),
          ),
          GoRoute(
            path: RoutePaths.more,
            builder: (context, state) => const EmptyTabPlaceholder(label: 'More', icon: Icons.more_horiz),
          ),
        ],
      ),
    ],
  );

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
