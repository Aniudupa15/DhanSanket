import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/alerts/data/datasources/alert_remote_data_source.dart';
import 'package:dhan_sanket/features/alerts/data/dto/alert_dto.dart';
import 'package:dhan_sanket/features/alerts/data/repositories/alert_repository_impl.dart';
import 'package:dhan_sanket/features/alerts/domain/entities/alert_type.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAlertRemoteDataSource extends Mock implements AlertRemoteDataSource {}

void main() {
  late MockAlertRemoteDataSource remote;
  late AlertRepositoryImpl repository;

  setUp(() {
    remote = MockAlertRemoteDataSource();
    repository = AlertRepositoryImpl(remote);
  });

  test('list maps alerts, including the condition map parsed to Decimal', () async {
    when(() => remote.list(status: any(named: 'status'))).thenAnswer(
      (_) async => [
        AlertDto(
          id: 'a1',
          symbol: 'RELIANCE',
          alertType: AlertTypeDto.priceAbove,
          condition: const {'price': '1300.00'},
          status: AlertStatusDto.active,
          createdAt: DateTime(2026, 1, 1),
        ),
      ],
    );

    final result = await repository.list();

    expect(result, isA<Success>());
    final alerts = (result as Success).data;
    expect(alerts.single.alertType, AlertType.priceAbove);
    expect(alerts.single.condition['price'], Decimal.parse('1300.00'));
  });

  test('create forwards the condition as stringified Decimal values', () async {
    when(
      () => remote.create(
        symbol: any(named: 'symbol'),
        alertType: any(named: 'alertType'),
        condition: any(named: 'condition'),
      ),
    ).thenAnswer(
      (_) async => AlertDto(
        id: 'a1',
        symbol: 'RELIANCE',
        alertType: AlertTypeDto.priceAbove,
        condition: const {'price': '1300'},
        status: AlertStatusDto.active,
        createdAt: DateTime(2026, 1, 1),
      ),
    );

    final result = await repository.create(
      symbol: 'RELIANCE',
      alertType: AlertType.priceAbove,
      condition: {'price': Decimal.fromInt(1300)},
    );

    expect(result, isA<Success>());
    verify(() => remote.create(symbol: 'RELIANCE', alertType: 'PRICE_ABOVE', condition: {'price': '1300'})).called(1);
  });

  test('delete maps a DioException to an Error result', () async {
    when(() => remote.delete(any())).thenThrow(DioException(requestOptions: RequestOptions(path: '/alerts/a1')));

    final result = await repository.delete('a1');

    expect(result, isA<Error>());
  });
}
