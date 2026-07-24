import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/alert.dart';
import '../../domain/entities/alert_status.dart';
import '../../domain/entities/alert_type.dart';
import '../../domain/repositories/alert_repository.dart';
import '../datasources/alert_remote_data_source.dart';
import '../dto/alert_dto.dart';

class AlertRepositoryImpl implements AlertRepository {
  final AlertRemoteDataSource _remote;

  AlertRepositoryImpl(this._remote);

  @override
  Future<Result<List<Alert>>> list({AlertStatus? status}) async {
    try {
      final dtos = await _remote.list(status: status == null ? null : _statusToDto(status));
      return Success(dtos.map(_toEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<Alert>> create({
    required String symbol,
    required AlertType alertType,
    required Map<String, Decimal> condition,
  }) async {
    try {
      final dto = await _remote.create(
        symbol: symbol,
        alertType: _typeToQueryValue(alertType),
        condition: condition.map((key, value) => MapEntry(key, value.toString())),
      );
      return Success(_toEntity(dto));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      await _remote.delete(id);
      return const Success(null);
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  Alert _toEntity(AlertDto dto) {
    return Alert(
      id: dto.id,
      symbol: dto.symbol,
      alertType: _typeToEntity(dto.alertType),
      condition: dto.condition.map((key, value) => MapEntry(key, Decimal.parse(value.toString()))),
      status: _statusToEntity(dto.status),
      createdAt: dto.createdAt,
      triggeredAt: dto.triggeredAt,
    );
  }

  AlertType _typeToEntity(AlertTypeDto dto) {
    return switch (dto) {
      AlertTypeDto.priceAbove => AlertType.priceAbove,
      AlertTypeDto.priceBelow => AlertType.priceBelow,
      AlertTypeDto.percentChangeAbove => AlertType.percentChangeAbove,
      AlertTypeDto.percentChangeBelow => AlertType.percentChangeBelow,
      AlertTypeDto.rsiAbove => AlertType.rsiAbove,
      AlertTypeDto.rsiBelow => AlertType.rsiBelow,
      AlertTypeDto.volumeSpike => AlertType.volumeSpike,
      AlertTypeDto.new52WeekHigh => AlertType.new52WeekHigh,
      AlertTypeDto.new52WeekLow => AlertType.new52WeekLow,
    };
  }

  String _typeToQueryValue(AlertType type) {
    return switch (type) {
      AlertType.priceAbove => 'PRICE_ABOVE',
      AlertType.priceBelow => 'PRICE_BELOW',
      AlertType.percentChangeAbove => 'PERCENT_CHANGE_ABOVE',
      AlertType.percentChangeBelow => 'PERCENT_CHANGE_BELOW',
      AlertType.rsiAbove => 'RSI_ABOVE',
      AlertType.rsiBelow => 'RSI_BELOW',
      AlertType.volumeSpike => 'VOLUME_SPIKE',
      AlertType.new52WeekHigh => 'NEW_52_WEEK_HIGH',
      AlertType.new52WeekLow => 'NEW_52_WEEK_LOW',
    };
  }

  AlertStatus _statusToEntity(AlertStatusDto dto) {
    return switch (dto) {
      AlertStatusDto.active => AlertStatus.active,
      AlertStatusDto.triggered => AlertStatus.triggered,
      AlertStatusDto.cancelled => AlertStatus.cancelled,
    };
  }

  AlertStatusDto _statusToDto(AlertStatus status) {
    return switch (status) {
      AlertStatus.active => AlertStatusDto.active,
      AlertStatus.triggered => AlertStatusDto.triggered,
      AlertStatus.cancelled => AlertStatusDto.cancelled,
    };
  }
}
