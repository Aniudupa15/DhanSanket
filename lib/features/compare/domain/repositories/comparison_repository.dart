import '../../../../core/error/result.dart';
import '../entities/comparison_entry.dart';

abstract class ComparisonRepository {
  Future<Result<List<ComparisonEntry>>> compare(List<String> symbols);
}
