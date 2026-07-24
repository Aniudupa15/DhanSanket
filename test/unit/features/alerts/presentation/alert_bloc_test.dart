import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/alerts/domain/entities/alert.dart';
import 'package:dhan_sanket/features/alerts/domain/entities/alert_status.dart';
import 'package:dhan_sanket/features/alerts/domain/entities/alert_type.dart';
import 'package:dhan_sanket/features/alerts/domain/repositories/alert_repository.dart';
import 'package:dhan_sanket/features/alerts/presentation/bloc/alert_bloc.dart';
import 'package:dhan_sanket/features/alerts/presentation/bloc/alert_event.dart';
import 'package:dhan_sanket/features/alerts/presentation/bloc/alert_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAlertRepository extends Mock implements AlertRepository {}

void main() {
  late MockAlertRepository repository;

  final alert = Alert(
    id: 'a1',
    symbol: 'RELIANCE',
    alertType: AlertType.priceAbove,
    condition: {'price': Decimal.fromInt(1300)},
    status: AlertStatus.active,
    createdAt: DateTime(2026, 1, 1),
    triggeredAt: null,
  );

  setUpAll(() {
    registerFallbackValue(AlertType.priceAbove);
  });

  setUp(() {
    repository = MockAlertRepository();
  });

  blocTest<AlertBloc, AlertState>(
    'emits loading then loaded on request',
    build: () {
      when(() => repository.list(status: any(named: 'status'))).thenAnswer((_) async => Success([alert]));
      return AlertBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const AlertsRequested()),
    expect: () => [const AlertLoading(), isA<AlertLoaded>()],
  );

  blocTest<AlertBloc, AlertState>(
    'create: refetches the list on success',
    build: () {
      when(
        () => repository.create(
          symbol: any(named: 'symbol'),
          alertType: any(named: 'alertType'),
          condition: any(named: 'condition'),
        ),
      ).thenAnswer((_) async => Success(alert));
      when(() => repository.list(status: any(named: 'status'))).thenAnswer((_) async => Success([alert]));
      return AlertBloc(repository: repository);
    },
    act: (bloc) => bloc.add(
      AlertCreateRequested(
        symbol: 'RELIANCE',
        alertType: AlertType.priceAbove,
        condition: {'price': Decimal.fromInt(1300)},
      ),
    ),
    expect: () => [isA<AlertLoaded>()],
  );

  blocTest<AlertBloc, AlertState>(
    'delete: emits error without refetching on failure',
    build: () {
      when(() => repository.delete(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return AlertBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const AlertDeleteRequested('a1')),
    expect: () => [isA<AlertError>()],
    verify: (_) {
      verifyNever(() => repository.list(status: any(named: 'status')));
    },
  );
}
