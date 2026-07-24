import 'package:decimal/decimal.dart';

import '../../../../core/error/result.dart';
import '../entities/portfolio.dart';
import '../entities/portfolio_detail.dart';
import '../entities/portfolio_performance.dart';
import '../entities/transaction_type.dart';

abstract class PortfolioRepository {
  Future<Result<List<Portfolio>>> list();
  Future<Result<Portfolio>> create(String name);
  Future<Result<PortfolioDetail>> getDetail(String id);
  Future<Result<PortfolioDetail>> addTransaction({
    required String portfolioId,
    required String symbol,
    required TransactionType transactionType,
    required Decimal quantity,
    required Decimal price,
    required DateTime transactionDate,
  });
  Future<Result<PortfolioPerformance>> getPerformance(String id);
}
