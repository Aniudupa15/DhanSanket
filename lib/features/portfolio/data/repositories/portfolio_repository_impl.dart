import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/holding.dart';
import '../../domain/entities/portfolio.dart';
import '../../domain/entities/portfolio_detail.dart';
import '../../domain/entities/portfolio_performance.dart';
import '../../domain/entities/transaction_type.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_remote_data_source.dart';
import '../dto/holding_dto.dart';
import '../dto/portfolio_detail_dto.dart';
import '../dto/portfolio_dto.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioRemoteDataSource _remote;

  PortfolioRepositoryImpl(this._remote);

  @override
  Future<Result<List<Portfolio>>> list() async {
    try {
      final dtos = await _remote.list();
      return Success(dtos.map(_toEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<Portfolio>> create(String name) async {
    try {
      return Success(_toEntity(await _remote.create(name)));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<PortfolioDetail>> getDetail(String id) async {
    try {
      return Success(_toDetailEntity(await _remote.getDetail(id)));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<PortfolioDetail>> addTransaction({
    required String portfolioId,
    required String symbol,
    required TransactionType transactionType,
    required Decimal quantity,
    required Decimal price,
    required DateTime transactionDate,
  }) async {
    try {
      final dto = await _remote.addTransaction(
        portfolioId: portfolioId,
        symbol: symbol,
        transactionType: transactionType,
        quantity: quantity,
        price: price,
        transactionDate: transactionDate,
      );
      return Success(_toDetailEntity(dto));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<PortfolioPerformance>> getPerformance(String id) async {
    try {
      final dto = await _remote.getPerformance(id);
      return Success(
        PortfolioPerformance(
          id: dto.id,
          totalInvested: dto.totalInvested,
          currentValue: dto.currentValue,
          totalPnl: dto.totalPnl,
          totalPnlPercent: dto.totalPnlPercent,
          xirrPercent: dto.xirrPercent,
        ),
      );
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  Portfolio _toEntity(PortfolioDto dto) => Portfolio(id: dto.id, name: dto.name, createdAt: dto.createdAt);

  Holding _holdingToEntity(HoldingDto dto) {
    return Holding(
      symbol: dto.symbol,
      quantity: dto.quantity,
      avgPrice: dto.avgPrice,
      costBasis: dto.costBasis,
      currentPrice: dto.currentPrice,
      currentValue: dto.currentValue,
      pnl: dto.pnl,
      pnlPercent: dto.pnlPercent,
    );
  }

  PortfolioDetail _toDetailEntity(PortfolioDetailDto dto) {
    return PortfolioDetail(
      id: dto.id,
      name: dto.name,
      createdAt: dto.createdAt,
      holdings: dto.holdings.map(_holdingToEntity).toList(),
    );
  }
}
