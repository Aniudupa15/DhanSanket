import '../../../../core/error/result.dart';
import '../entities/dividend_recommendation.dart';

abstract class DividendRepository {
  Future<Result<List<DividendRecommendation>>> list({bool upcoming = false, String sort = 'ex_date', int limit = 50});
}
