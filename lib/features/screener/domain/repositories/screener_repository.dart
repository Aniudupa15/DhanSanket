import '../../../../core/error/result.dart';
import '../entities/screener_filter.dart';
import '../entities/screener_result.dart';

abstract class ScreenerRepository {
  Future<Result<List<ScreenerResult>>> screen(ScreenerFilter filter);
}
