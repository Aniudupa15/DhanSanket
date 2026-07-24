// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_performance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioPerformanceDto _$PortfolioPerformanceDtoFromJson(
  Map<String, dynamic> json,
) => _PortfolioPerformanceDto(
  id: json['id'] as String,
  totalInvested: const DecimalConverter().fromJson(
    json['total_invested'] as String,
  ),
  currentValue: const DecimalConverter().fromJson(
    json['current_value'] as String,
  ),
  totalPnl: const DecimalConverter().fromJson(json['total_pnl'] as String),
  totalPnlPercent: const NullableDecimalConverter().fromJson(
    json['total_pnl_percent'] as String?,
  ),
  xirrPercent: const NullableDecimalConverter().fromJson(
    json['xirr_percent'] as String?,
  ),
);

Map<String, dynamic> _$PortfolioPerformanceDtoToJson(
  _PortfolioPerformanceDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'total_invested': const DecimalConverter().toJson(instance.totalInvested),
  'current_value': const DecimalConverter().toJson(instance.currentValue),
  'total_pnl': const DecimalConverter().toJson(instance.totalPnl),
  'total_pnl_percent': const NullableDecimalConverter().toJson(
    instance.totalPnlPercent,
  ),
  'xirr_percent': const NullableDecimalConverter().toJson(instance.xirrPercent),
};
