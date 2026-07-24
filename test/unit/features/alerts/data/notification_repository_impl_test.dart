import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/alerts/data/datasources/notification_remote_data_source.dart';
import 'package:dhan_sanket/features/alerts/data/dto/notification_dto.dart';
import 'package:dhan_sanket/features/alerts/data/repositories/notification_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationRemoteDataSource extends Mock implements NotificationRemoteDataSource {}

void main() {
  late MockNotificationRemoteDataSource remote;
  late NotificationRepositoryImpl repository;

  setUp(() {
    remote = MockNotificationRemoteDataSource();
    repository = NotificationRepositoryImpl(remote);
  });

  test('list maps notifications, deriving isRead from a null readAt', () async {
    when(
      () => remote.list(
        unreadOnly: any(named: 'unreadOnly'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer(
      (_) async => [
        NotificationDto(
          id: 'n1',
          alertId: 'a1',
          title: 'Price alert triggered',
          message: 'RELIANCE crossed 1300',
          createdAt: DateTime(2026, 1, 1),
        ),
      ],
    );

    final result = await repository.list();

    expect(result, isA<Success>());
    final notifications = (result as Success).data;
    expect(notifications.single.isRead, isFalse);
  });

  test('markRead maps a DioException to an Error result', () async {
    when(
      () => remote.markRead(any()),
    ).thenThrow(DioException(requestOptions: RequestOptions(path: '/notifications/n1/read')));

    final result = await repository.markRead('n1');

    expect(result, isA<Error>());
  });
}
