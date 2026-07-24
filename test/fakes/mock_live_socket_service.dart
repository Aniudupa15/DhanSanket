import 'dart:async';

import 'package:dhan_sanket/core/network/live_socket_service.dart';
import 'package:mocktail/mocktail.dart';

/// `subscribe`/`unsubscribe` go through Mock's noSuchMethod (fine - they're
/// void, no stubbing needed to call them safely). `events` is overridden
/// with a real broadcast stream so Bloc constructors can `.listen()` on it
/// immediately without any `when()` setup - tests push events through
/// [emit].
class MockLiveSocketService extends Mock implements LiveSocketService {
  final StreamController<LiveEvent> _controller = StreamController<LiveEvent>.broadcast();

  @override
  Stream<LiveEvent> get events => _controller.stream;

  @override
  Stream<bool> get connectionStatus => const Stream.empty();

  void emit(LiveEvent event) => _controller.add(event);
}
