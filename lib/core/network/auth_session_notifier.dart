import 'dart:async';

/// A minimal event bus so `core/network` (which cannot depend on
/// `features/auth`'s Bloc without inverting clean-architecture's dependency
/// direction) can still signal "the session just ended" upward. `AuthBloc`
/// subscribes to [onSessionExpired] and translates it into its own
/// `AuthSessionExpired` event; [TokenRefreshCoordinator] is the only
/// publisher.
class AuthSessionNotifier {
  final _controller = StreamController<void>.broadcast();

  Stream<void> get onSessionExpired => _controller.stream;

  void notifySessionExpired() {
    if (!_controller.isClosed) {
      _controller.add(null);
    }
  }

  void dispose() => _controller.close();
}
