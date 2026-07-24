import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/portfolio/data/datasources/portfolio_remote_data_source.dart';
import 'package:dhan_sanket/features/portfolio/data/dto/holding_dto.dart';
import 'package:dhan_sanket/features/portfolio/data/dto/portfolio_detail_dto.dart';
import 'package:dhan_sanket/features/portfolio/data/dto/portfolio_performance_dto.dart';
import 'package:dhan_sanket/features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'package:dhan_sanket/features/portfolio/domain/entities/transaction_type.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPortfolioRemoteDataSource extends Mock implements PortfolioRemoteDataSource {}

void main() {
  late MockPortfolioRemoteDataSource remote;
  late PortfolioRepositoryImpl repository;

  setUpAll(() {
    registerFallbackValue(TransactionType.buy);
    registerFallbackValue(Decimal.zero);
  });

  setUp(() {
    remote = MockPortfolioRemoteDataSource();
    repository = PortfolioRepositoryImpl(remote);
  });

  test('getDetail maps holdings with Decimal fields', () async {
    when(() => remote.getDetail(any())).thenAnswer(
      (_) async => PortfolioDetailDto(
        id: 'p1',
        name: 'Main',
        createdAt: DateTime(2026, 1, 1),
        holdings: [
          HoldingDto(
            symbol: 'RELIANCE',
            quantity: Decimal.fromInt(10),
            avgPrice: Decimal.fromInt(100),
            costBasis: Decimal.fromInt(1000),
            currentPrice: Decimal.fromInt(120),
            currentValue: Decimal.fromInt(1200),
            pnl: Decimal.fromInt(200),
            pnlPercent: Decimal.parse('20'),
          ),
        ],
      ),
    );

    final result = await repository.getDetail('p1');

    expect(result, isA<Success>());
    final detail = (result as Success).data;
    expect(detail.holdings.single.symbol, 'RELIANCE');
    expect(detail.holdings.single.pnl, Decimal.fromInt(200));
  });

  test('getPerformance maps performance fields, including nullable XIRR', () async {
    when(() => remote.getPerformance(any())).thenAnswer(
      (_) async => PortfolioPerformanceDto(
        id: 'p1',
        totalInvested: Decimal.fromInt(1000),
        currentValue: Decimal.fromInt(1200),
        totalPnl: Decimal.fromInt(200),
        totalPnlPercent: Decimal.parse('20'),
        xirrPercent: null,
      ),
    );

    final result = await repository.getPerformance('p1');

    expect(result, isA<Success>());
    final performance = (result as Success).data;
    expect(performance.totalPnl, Decimal.fromInt(200));
    expect(performance.xirrPercent, isNull);
  });

  test('addTransaction forwards fields and maps a DioException to an Error result', () async {
    when(
      () => remote.addTransaction(
        portfolioId: any(named: 'portfolioId'),
        symbol: any(named: 'symbol'),
        transactionType: any(named: 'transactionType'),
        quantity: any(named: 'quantity'),
        price: any(named: 'price'),
        transactionDate: any(named: 'transactionDate'),
      ),
    ).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/portfolios/p1/transactions'),
        type: DioExceptionType.connectionError,
      ),
    );

    final result = await repository.addTransaction(
      portfolioId: 'p1',
      symbol: 'RELIANCE',
      transactionType: TransactionType.buy,
      quantity: Decimal.fromInt(10),
      price: Decimal.fromInt(100),
      transactionDate: DateTime(2026, 1, 1),
    );

    expect(result, isA<Error>());
  });
}
