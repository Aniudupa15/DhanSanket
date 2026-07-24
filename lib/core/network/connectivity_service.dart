import 'package:connectivity_plus/connectivity_plus.dart';

/// Wraps `connectivity_plus` behind a plain `bool` (online/offline) stream -
/// the rest of the app never needs to know about the underlying
/// `ConnectivityResult` list shape.
class ConnectivityService {
  final Connectivity _connectivity;

  ConnectivityService({Connectivity? connectivity}) : _connectivity = connectivity ?? Connectivity();

  Stream<bool> get onStatusChanged => _connectivity.onConnectivityChanged.map((results) => _isOnline(results));

  Future<bool> checkIsOnline() async {
    final results = await _connectivity.checkConnectivity();
    return _isOnline(results);
  }

  bool _isOnline(List<ConnectivityResult> results) => results.any((r) => r != ConnectivityResult.none);
}
