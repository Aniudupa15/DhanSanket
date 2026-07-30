import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/momentum_pick.dart';
import '../../domain/repositories/momentum_repository.dart';
import '../datasources/momentum_remote_data_source.dart';

class MomentumRepositoryImpl implements MomentumRepository {
  final MomentumRemoteDataSource _remote;

  MomentumRepositoryImpl(this._remote);

  @override
  Future<Result<List<MomentumPick>>> getRanking({int top = 10}) async {
    try {
      return Success(await _remote.getRanking(top: top));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }
}
