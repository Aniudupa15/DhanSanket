import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/intraday_recommendation.dart';
import '../../domain/entities/long_term_recommendation.dart';
import '../../domain/repositories/analysis_repository.dart';
import '../datasources/analysis_remote_data_source.dart';
import '../dto/intraday_recommendation_dto.dart';
import '../dto/long_term_recommendation_dto.dart';

class AnalysisRepositoryImpl implements AnalysisRepository {
  final AnalysisRemoteDataSource _remote;

  AnalysisRepositoryImpl(this._remote);

  @override
  Future<Result<List<IntradayRecommendation>>> getIntraday({int limit = 50, num minConfidence = 0}) async {
    try {
      final dtos = await _remote.getIntraday(limit: limit, minConfidence: minConfidence);
      return Success(dtos.map(_toIntradayEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<List<LongTermRecommendation>>> getLongTerm({
    int limit = 50,
    int minConfidence = 0,
    String? tenure,
  }) async {
    try {
      final dtos = await _remote.getLongTerm(limit: limit, minConfidence: minConfidence, tenure: tenure);
      return Success(dtos.map(_toLongTermEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  IntradayRecommendation _toIntradayEntity(IntradayRecommendationDto dto) {
    return IntradayRecommendation(
      symbol: dto.symbol,
      name: dto.name,
      asOf: dto.asOf,
      signal: dto.signal,
      confidence: dto.confidence,
      entryPrice: dto.entryPrice,
      targetPrice: dto.targetPrice,
      stopLoss: dto.stopLoss,
      reasoning: dto.reasoning,
    );
  }

  LongTermRecommendation _toLongTermEntity(LongTermRecommendationDto dto) {
    return LongTermRecommendation(
      symbol: dto.symbol,
      name: dto.name,
      asOf: dto.asOf,
      signal: dto.signal,
      confidence: dto.confidence,
      riskLevel: dto.riskLevel,
      growthPotential: dto.growthPotential,
      investmentTenure: dto.investmentTenure,
      reasoning: dto.reasoning,
    );
  }
}
