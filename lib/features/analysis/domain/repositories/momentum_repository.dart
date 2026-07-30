import '../../../../core/error/result.dart';
import '../entities/momentum_pick.dart';

abstract class MomentumRepository {
  Future<Result<List<MomentumPick>>> getRanking({int top = 10});
}
