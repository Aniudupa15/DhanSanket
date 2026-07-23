import 'package:dio/dio.dart';

import '../constants/api_endpoints.dart';
import '../storage/secure_token_storage.dart';
import 'auth_session_notifier.dart';

/// Coordinates token-refresh attempts triggered by a 401. The backend's
/// refresh token is single-use (server-side rotation revokes it immediately
/// on use), so if two requests 401 concurrently, naively refreshing twice
/// would burn the token on the first call and force the second to fail
/// unnecessarily - this dedupes concurrent refreshes into one in-flight
/// attempt that every caller awaits.
class TokenRefreshCoordinator {
  final Dio _bareDio;
  final SecureTokenStorage _tokenStorage;
  final AuthSessionNotifier _sessionNotifier;

  Future<bool>? _inFlightRefresh;

  TokenRefreshCoordinator({
    required Dio bareDio,
    required SecureTokenStorage tokenStorage,
    required AuthSessionNotifier sessionNotifier,
  })  : _bareDio = bareDio,
        _tokenStorage = tokenStorage,
        _sessionNotifier = sessionNotifier;

  /// Resolves true if new tokens are persisted and the original request
  /// should be retried; false if the session is over and the caller should
  /// let the original 401 propagate.
  Future<bool> refresh() {
    return _inFlightRefresh ??= _performRefresh().whenComplete(() {
      _inFlightRefresh = null;
    });
  }

  Future<bool> _performRefresh() async {
    final refreshToken = await _tokenStorage.getRefreshToken();
    if (refreshToken == null) {
      await _tokenStorage.clear();
      _sessionNotifier.notifySessionExpired();
      return false;
    }

    try {
      final response = await _bareDio.post<Map<String, dynamic>>(
        ApiEndpoints.refresh,
        data: {'refresh_token': refreshToken},
      );
      final data = response.data!;
      await _tokenStorage.saveTokens(
        accessToken: data['access_token'] as String,
        refreshToken: data['refresh_token'] as String,
      );
      return true;
    } on DioException {
      await _tokenStorage.clear();
      _sessionNotifier.notifySessionExpired();
      return false;
    }
  }
}
