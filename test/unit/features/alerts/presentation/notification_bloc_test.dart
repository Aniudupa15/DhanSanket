import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/alerts/domain/entities/app_notification.dart';
import 'package:dhan_sanket/features/alerts/domain/repositories/notification_repository.dart';
import 'package:dhan_sanket/features/alerts/presentation/bloc/notification_bloc.dart';
import 'package:dhan_sanket/features/alerts/presentation/bloc/notification_event.dart';
import 'package:dhan_sanket/features/alerts/presentation/bloc/notification_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationRepository extends Mock implements NotificationRepository {}

void main() {
  late MockNotificationRepository repository;

  final notification = AppNotification(
    id: 'n1',
    alertId: 'a1',
    title: 'Price alert triggered',
    message: 'RELIANCE crossed 1300',
    createdAt: DateTime(2026, 1, 1),
    readAt: null,
  );

  setUp(() {
    repository = MockNotificationRepository();
  });

  blocTest<NotificationBloc, NotificationState>(
    'emits loading then loaded on request',
    build: () {
      when(
        () => repository.list(
          unreadOnly: any(named: 'unreadOnly'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenAnswer((_) async => Success([notification]));
      return NotificationBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const NotificationsRequested()),
    expect: () => [const NotificationLoading(), isA<NotificationLoaded>()],
  );

  blocTest<NotificationBloc, NotificationState>(
    'markRead: refetches the list on success',
    build: () {
      when(() => repository.markRead(any())).thenAnswer((_) async => const Success(null));
      when(
        () => repository.list(
          unreadOnly: any(named: 'unreadOnly'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenAnswer((_) async => Success([notification]));
      return NotificationBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const NotificationMarkReadRequested('n1')),
    expect: () => [isA<NotificationLoaded>()],
  );

  blocTest<NotificationBloc, NotificationState>(
    'markRead: emits error without refetching on failure',
    build: () {
      when(() => repository.markRead(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return NotificationBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const NotificationMarkReadRequested('n1')),
    expect: () => [isA<NotificationError>()],
    verify: (_) {
      verifyNever(
        () => repository.list(
          unreadOnly: any(named: 'unreadOnly'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      );
    },
  );
}
