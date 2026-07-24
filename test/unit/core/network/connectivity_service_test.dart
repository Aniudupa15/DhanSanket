import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dhan_sanket/core/network/connectivity_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late MockConnectivity connectivity;
  late ConnectivityService service;

  setUp(() {
    connectivity = MockConnectivity();
    service = ConnectivityService(connectivity: connectivity);
  });

  test('checkIsOnline is true when any result is not none', () async {
    when(() => connectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.wifi]);

    expect(await service.checkIsOnline(), isTrue);
  });

  test('checkIsOnline is false when every result is none', () async {
    when(() => connectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.none]);

    expect(await service.checkIsOnline(), isFalse);
  });

  test('onStatusChanged maps the underlying stream to a bool', () async {
    when(() => connectivity.onConnectivityChanged).thenAnswer(
      (_) => Stream.fromIterable([
        [ConnectivityResult.mobile],
        [ConnectivityResult.none],
      ]),
    );

    expect(service.onStatusChanged, emitsInOrder([true, false]));
  });
}
