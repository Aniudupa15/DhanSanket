import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../stocks/data/mappers/stock_dto_mappers.dart';
import '../../domain/entities/comparison_entry.dart';
import '../../domain/repositories/comparison_repository.dart';
import '../datasources/comparison_remote_data_source.dart';
import '../dto/comparison_dto.dart';

class ComparisonRepositoryImpl implements ComparisonRepository {
  final ComparisonRemoteDataSource _remote;

  ComparisonRepositoryImpl(this._remote);

  @override
  Future<Result<List<ComparisonEntry>>> compare(List<String> symbols) async {
    try {
      final dto = await _remote.compare(symbols);
      return Success(dto.entries.map(_toEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  ComparisonEntry _toEntity(ComparisonEntryDto dto) {
    return ComparisonEntry(
      detail: stockDetailToEntity(dto.detail),
      indicators: indicatorsToEntity(dto.indicators),
      fundamentals: fundamentalsToEntity(dto.fundamentals),
    );
  }
}
