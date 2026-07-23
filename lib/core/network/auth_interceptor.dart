import 'package:dio/dio.dart';

import '../constants/api_endpoints.dart';
import '../storage/secure_token_storage.dart';
import 'token_refresh_coordinator.dart';

/// Attaches the stored access token to every outgoing request except the
/// auth endpoints that don't need/want one. On a 401, attempts exactly one
/// token refresh (via [TokenRefreshCoordinator], which dedupes concurrent
/// attempts) and retries the original request once. If the refresh itself
/// fails, the original 401 propagates unchanged - by that point the
/// coordinator has already cleared tokens and fired session-expired.
class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final SecureTokenStorage _tokenStorage;
  final TokenRefreshCoordinator _refreshCoordinator;

  static const _noAuthPaths = {
    ApiEndpoints.register,
    ApiEndpoints.login,
    ApiEndpoints.refresh,
  };

  AuthInterceptor({
    required Dio dio,
    required SecureTokenStorage tokenStorage,
    required TokenRefreshCoordinator refreshCoordinator,
  })  : _dio = dio,
        _tokenStorage = tokenStorage,
        _refreshCoordinator = refreshCoordinator;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!_noAuthPaths.contains(options.path)) {
      final accessToken = await _tokenStorage.getAccessToken();
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final isAuthFailure = err.response?.statusCode == 401;
    final isRetryableRequest = !_noAuthPaths.contains(err.requestOptions.path);

    if (isAuthFailure && isRetryableRequest) {
      final refreshed = await _refreshCoordinator.refresh();
      if (refreshed) {
        try {
          handler.resolve(await _retry(err.requestOptions));
          return;
        } on DioException catch (retryError) {
          handler.next(retryError);
          return;
        }
      }
    }
    handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final accessToken = await _tokenStorage.getAccessToken();
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        if (accessToken != null) 'Authorization': 'Bearer $accessToken',
      },
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
