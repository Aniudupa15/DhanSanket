import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/network/connectivity_service.dart';
import '../core/router/app_router.dart';
import '../core/theme/app_theme.dart';
import '../core/widgets/offline_banner.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'injector.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // .value, not create: - these are app-lifetime singletons owned by
        // get_it; BlocProvider must not auto-close them when this widget
        // unmounts (it never does in this app's lifetime, but .value is the
        // correct pattern regardless).
        BlocProvider<AuthBloc>.value(value: getIt<AuthBloc>()),
        BlocProvider<DashboardBloc>.value(value: getIt<DashboardBloc>()),
      ],
      child: MaterialApp.router(
        title: 'DhanSanket',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        routerConfig: getIt<AppRouter>().router,
        builder: (context, child) {
          return Column(
            children: [
              OfflineBanner(connectivityService: getIt<ConnectivityService>()),
              Expanded(child: child ?? const SizedBox.shrink()),
            ],
          );
        },
      ),
    );
  }
}
