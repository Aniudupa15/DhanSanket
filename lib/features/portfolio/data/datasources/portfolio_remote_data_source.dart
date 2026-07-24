import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../domain/entities/transaction_type.dart';
import '../dto/portfolio_detail_dto.dart';
import '../dto/portfolio_dto.dart';
import '../dto/portfolio_performance_dto.dart';

class PortfolioRemoteDataSource {
  final Dio _dio;

  PortfolioRemoteDataSource(this._dio);

  Future<List<PortfolioDto>> list() async {
    final response = await _dio.get<List<dynamic>>(ApiEndpoints.portfolios);
    return response.data!.map((e) => PortfolioDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<PortfolioDto> create(String name) async {
    final response = await _dio.post<Map<String, dynamic>>(ApiEndpoints.portfolios, data: {'name': name});
    return PortfolioDto.fromJson(response.data!);
  }

  Future<PortfolioDetailDto> getDetail(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.portfolioDetail(id));
    return PortfolioDetailDto.fromJson(response.data!);
  }

  Future<PortfolioDetailDto> addTransaction({
    required String portfolioId,
    required String symbol,
    required TransactionType transactionType,
    required Decimal quantity,
    required Decimal price,
    required DateTime transactionDate,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.portfolioTransactions(portfolioId),
      data: {
        'symbol': symbol,
        'transaction_type': transactionType == TransactionType.buy ? 'BUY' : 'SELL',
        'quantity': quantity.toString(),
        'price': price.toString(),
        'transaction_date': transactionDate.toIso8601String().split('T').first,
      },
    );
    return PortfolioDetailDto.fromJson(response.data!);
  }

  Future<PortfolioPerformanceDto> getPerformance(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.portfolioPerformance(id));
    return PortfolioPerformanceDto.fromJson(response.data!);
  }
}
