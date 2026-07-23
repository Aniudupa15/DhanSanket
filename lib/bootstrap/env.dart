class AppConfig {
  AppConfig._();

  /// Points at the live deployed backend by default. Override for local
  /// backend development, e.g.:
  ///   flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000/api/v1   (Android emulator loopback)
  ///   flutter run --dart-define=API_BASE_URL=http://localhost:8000/api/v1 (web/desktop/iOS simulator)
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://stock-app-backend-f1oz.onrender.com/api/v1',
  );
}
