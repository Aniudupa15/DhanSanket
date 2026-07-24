import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/dividend_recommendation.dart';
import '../../domain/repositories/dividend_repository.dart';
import '../datasources/dividend_remote_data_source.dart';
import '../dto/dividend_recommendation_dto.dart';

class DividendRepositoryImpl implements DividendRepository {
  final DividendRemoteDataSource _remote;

  DividendRepositoryImpl(this._remote);

  @override
  Future<Result<List<DividendRecommendation>>> list({
    bool upcoming = false,
    String sort = 'ex_date',
    int limit = 50,
  }) async {
    try {
      final dtos = await _remote.list(upcoming: upcoming, sort: sort, limit: limit);
      return Success(dtos.map(_toEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  DividendRecommendation _toEntity(DividendRecommendationDto dto) {
    return DividendRecommendation(
      symbol: dto.symbol,
      name: dto.name,
      dividendYield: dto.dividendYield,
      dividendAmount: dto.dividendAmount,
      exDividendDate: dto.exDividendDate,
      buyBeforeDate: dto.buyBeforeDate,
      recommendation: dto.recommendation,
      riskLevel: dto.riskLevel,
      confidence: dto.confidence,
    );
  }
}
