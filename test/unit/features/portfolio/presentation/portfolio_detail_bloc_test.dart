import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/core/network/live_socket_service.dart';
import 'package:dhan_sanket/features/portfolio/domain/entities/holding.dart';
import 'package:dhan_sanket/features/portfolio/domain/entities/portfolio_detail.dart';
import 'package:dhan_sanket/features/portfolio/domain/entities/portfolio_performance.dart';
import 'package:dhan_sanket/features/portfolio/domain/entities/transaction_type.dart';
import 'package:dhan_sanket/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_detail_bloc.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_detail_event.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fakes/mock_live_socket_service.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

void main() {
  late MockPortfolioRepository repository;
  late MockLiveSocketService liveSocketService;

  final detail = PortfolioDetail(id: 'p1', name: 'Main', createdAt: DateTime(2026, 1, 1), holdings: const []);
  final detailWithHolding = PortfolioDetail(
    id: 'p1',
    name: 'Main',
    createdAt: DateTime(2026, 1, 1),
    holdings: [
      Holding(
        symbol: 'RELIANCE',
        quantity: Decimal.fromInt(10),
        avgPrice: Decimal.fromInt(100),
        costBasis: Decimal.fromInt(1000),
        currentPrice: Decimal.fromInt(100),
        currentValue: Decimal.fromInt(1000),
        pnl: Decimal.zero,
        pnlPercent: Decimal.zero,
      ),
    ],
  );
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
    liveSocketService = MockLiveSocketService();
  });

  blocTest<PortfolioDetailBloc, PortfolioDetailState>(
    'emits loading then loaded when both detail and performance succeed',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => Success(detail));
      when(() => repository.getPerformance(any())).thenAnswer((_) async => Success(performance));
      return PortfolioDetailBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const PortfolioDetailRequested('p1')),
    expect: () => [isA<PortfolioDetailLoading>(), isA<PortfolioDetailLoaded>()],
  );

  blocTest<PortfolioDetailBloc, PortfolioDetailState>(
    'emits error if the performance call fails even when detail succeeds',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => Success(detail));
      when(() => repository.getPerformance(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return PortfolioDetailBloc(repository: repository, liveSocketService: liveSocketService);
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
      return PortfolioDetailBloc(repository: repository, liveSocketService: liveSocketService);
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

  blocTest<PortfolioDetailBloc, PortfolioDetailState>(
    'patches a holding\'s current price/value/pnl on a live quote',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => Success(detailWithHolding));
      when(() => repository.getPerformance(any())).thenAnswer((_) async => Success(performance));
      return PortfolioDetailBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) async {
      bloc.add(const PortfolioDetailRequested('p1'));
      await Future<void>.delayed(const Duration(milliseconds: 10));
      liveSocketService.emit(
        QuoteLiveEvent(
          symbol: 'RELIANCE',
          lastPrice: Decimal.fromInt(120),
          change: Decimal.fromInt(20),
          changePercent: Decimal.parse('20'),
          volume: 500,
          asOf: DateTime(2026, 1, 2),
        ),
      );
    },
    wait: const Duration(milliseconds: 50),
    skip: 2,
    expect: () => [isA<PortfolioDetailLoaded>()],
    verify: (bloc) {
      final state = bloc.state as PortfolioDetailLoaded;
      final holding = state.detail.holdings.single;
      expect(holding.currentPrice, Decimal.fromInt(120));
      expect(holding.currentValue, Decimal.fromInt(1200));
      expect(holding.pnl, Decimal.fromInt(200));
    },
  );
}
