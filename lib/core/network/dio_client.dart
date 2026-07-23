import 'package:dio/dio.dart';

import '../../bootstrap/env.dart';

class DioClient {
  DioClient._();

  static BaseOptions get _baseOptions => BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: const {'Content-Type': 'application/json'},
      );

  /// The app-wide Dio instance - gets the [AuthInterceptor] attached by the
  /// DI container after construction.
  static Dio create() => Dio(_baseOptions);

  /// A separate Dio instance with no interceptors, used exclusively for the
  /// token-refresh call itself - a 401 on that call must never recursively
  /// trigger another refresh attempt.
  static Dio createBare() => Dio(_baseOptions);
}
