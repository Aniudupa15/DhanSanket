import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/screener_filter.dart';
import '../../domain/entities/screener_result.dart';
import '../../domain/repositories/screener_repository.dart';
import '../datasources/screener_remote_data_source.dart';
import '../dto/screener_request_dto.dart';
import '../dto/screener_result_dto.dart';

class ScreenerRepositoryImpl implements ScreenerRepository {
  final ScreenerRemoteDataSource _remote;

  ScreenerRepositoryImpl(this._remote);

  @override
  Future<Result<List<ScreenerResult>>> screen(ScreenerFilter filter) async {
    try {
      final request = ScreenerRequestDto(
        rsiBelow: filter.rsiBelow,
        rsiAbove: filter.rsiAbove,
        priceMin: filter.priceMin,
        priceMax: filter.priceMax,
        aboveSma50: filter.aboveSma50,
        minVolume: filter.minVolume,
        limit: filter.limit,
      );
      final dtos = await _remote.screen(request);
      return Success(dtos.map(_toEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  ScreenerResult _toEntity(ScreenerResultDto dto) {
    return ScreenerResult(
      symbol: dto.symbol,
      name: dto.name,
      asOf: dto.asOf,
      close: dto.close,
      volume: dto.volume,
      rsi14: dto.rsi14,
      sma50: dto.sma50,
      sma200: dto.sma200,
    );
  }
}
