import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/portfolio/domain/entities/portfolio_detail.dart';
import 'package:dhan_sanket/features/portfolio/domain/entities/portfolio_performance.dart';
import 'package:dhan_sanket/features/portfolio/domain/entities/transaction_type.dart';
import 'package:dhan_sanket/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_detail_bloc.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_detail_event.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

void main() {
  late MockPortfolioRepository repository;

  final detail = PortfolioDetail(id: 'p1', name: 'Main', createdAt: DateTime(2026, 1, 1), holdings: const []);
  final performance = PortfolioPerformance(
    id: 'p1',
    totalInvested: Decimal.zero,
    currentValue: Decimal.zero,
    totalPnl: Decimal.zero,
    totalPnlPercent: null,
    xirrPercent: null,
  );

  setUpAll(() {
    registerFallbackValue(TransactionType.buy);
    registerFallbackValue(Decimal.zero);
  });

  setUp(() {
    repository = MockPortfolioRepository();
  });

  blocTest<PortfolioDetailBloc, PortfolioDetailState>(
    'emits loading then loaded when both detail and performance succeed',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => Success(detail));
      when(() => repository.getPerformance(any())).thenAnswer((_) async => Success(performance));
      return PortfolioDetailBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const PortfolioDetailRequested('p1')),
    expect: () => [isA<PortfolioDetailLoading>(), isA<PortfolioDetailLoaded>()],
  );

  blocTest<PortfolioDetailBloc, PortfolioDetailState>(
    'emits error if the performance call fails even when detail succeeds',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => Success(detail));
      when(() => repository.getPerformance(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return PortfolioDetailBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const PortfolioDetailRequested('p1')),
    expect: () => [isA<PortfolioDetailLoading>(), isA<PortfolioDetailError>()],
  );

  blocTest<PortfolioDetailBloc, PortfolioDetailState>(
    'addTransaction refetches detail+performance on success',
    build: () {
      when(
        () => repository.addTransaction(
          portfolioId: any(named: 'portfolioId'),
          symbol: any(named: 'symbol'),
          transactionType: any(named: 'transactionType'),
          quantity: any(named: 'quantity'),
          price: any(named: 'price'),
          transactionDate: any(named: 'transactionDate'),
        ),
      ).thenAnswer((_) async => Success(detail));
      when(() => repository.getDetail(any())).thenAnswer((_) async => Success(detail));
      when(() => repository.getPerformance(any())).thenAnswer((_) async => Success(performance));
      return PortfolioDetailBloc(repository: repository);
    },
    act: (bloc) => bloc.add(
      PortfolioTransactionAddRequested(
        portfolioId: 'p1',
        symbol: 'RELIANCE',
        transactionType: TransactionType.buy,
        quantity: Decimal.fromInt(10),
        price: Decimal.fromInt(100),
        transactionDate: DateTime(2026, 1, 1),
      ),
    ),
    expect: () => [isA<PortfolioDetailLoaded>()],
  );
}
