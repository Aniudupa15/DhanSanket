import '../../../../core/error/result.dart';
import '../entities/intraday_recommendation.dart';
import '../entities/long_term_recommendation.dart';

abstract class AnalysisRepository {
  Future<Result<List<IntradayRecommendation>>> getIntraday({int limit = 50, num minConfidence = 0});

  Future<Result<List<LongTermRecommendation>>> getLongTerm({int limit = 50, int minConfidence = 0, String? tenure});
}
