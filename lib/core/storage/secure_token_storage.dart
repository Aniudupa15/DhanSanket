import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/storage_keys.dart';

/// Wraps Keychain (iOS/macOS) / Keystore (Android) backed storage for the
/// JWT access + refresh tokens. On Flutter Web this package falls back to
/// browser localStorage (no OS-level secret store exists there) - an
/// accepted limitation of the platform, not a gap in this class.
class SecureTokenStorage {
  final FlutterSecureStorage _storage;

  SecureTokenStorage({FlutterSecureStorage? storage}) : _storage = storage ?? const FlutterSecureStorage();

  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    await Future.wait([
      _storage.write(key: StorageKeys.accessToken, value: accessToken),
      _storage.write(key: StorageKeys.refreshToken, value: refreshToken),
    ]);
  }

  Future<String?> getAccessToken() => _storage.read(key: StorageKeys.accessToken);

  Future<String?> getRefreshToken() => _storage.read(key: StorageKeys.refreshToken);

  Future<void> clear() async {
    await Future.wait([_storage.delete(key: StorageKeys.accessToken), _storage.delete(key: StorageKeys.refreshToken)]);
  }
}
