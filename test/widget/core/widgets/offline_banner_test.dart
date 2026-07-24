import 'package:dhan_sanket/core/network/connectivity_service.dart';
import 'package:dhan_sanket/core/widgets/offline_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConnectivityService extends Mock implements ConnectivityService {}

void main() {
  late MockConnectivityService service;

  setUp(() {
    service = MockConnectivityService();
  });

  Widget buildSubject() {
    return MaterialApp(
      home: Scaffold(body: OfflineBanner(connectivityService: service)),
    );
  }

  testWidgets('shows nothing while online', (tester) async {
    when(() => service.checkIsOnline()).thenAnswer((_) async => true);
    when(() => service.onStatusChanged).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(buildSubject());
    await tester.pump();

    expect(find.text('No internet connection'), findsNothing);
  });

  testWidgets('shows a banner once the initial check reports offline', (tester) async {
    when(() => service.checkIsOnline()).thenAnswer((_) async => false);
    when(() => service.onStatusChanged).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(buildSubject());
    await tester.pump();

    expect(find.text('No internet connection'), findsOneWidget);
  });

  testWidgets('reacts to a status change from the stream', (tester) async {
    when(() => service.checkIsOnline()).thenAnswer((_) async => true);
    when(() => service.onStatusChanged).thenAnswer((_) => Stream.value(false));

    await tester.pumpWidget(buildSubject());
    await tester.pump();

    expect(find.text('No internet connection'), findsOneWidget);
  });
}
