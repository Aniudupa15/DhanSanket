// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holding_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HoldingDto _$HoldingDtoFromJson(Map<String, dynamic> json) => _HoldingDto(
  symbol: json['symbol'] as String,
  quantity: const DecimalConverter().fromJson(json['quantity'] as String),
  avgPrice: const DecimalConverter().fromJson(json['avg_price'] as String),
  costBasis: const DecimalConverter().fromJson(json['cost_basis'] as String),
  currentPrice: const NullableDecimalConverter().fromJson(json['current_price'] as String?),
  currentValue: const NullableDecimalConverter().fromJson(json['current_value'] as String?),
  pnl: const NullableDecimalConverter().fromJson(json['pnl'] as String?),
  pnlPercent: const NullableDecimalConverter().fromJson(json['pnl_percent'] as String?),
);

Map<String, dynamic> _$HoldingDtoToJson(_HoldingDto instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'quantity': const DecimalConverter().toJson(instance.quantity),
  'avg_price': const DecimalConverter().toJson(instance.avgPrice),
  'cost_basis': const DecimalConverter().toJson(instance.costBasis),
  'current_price': const NullableDecimalConverter().toJson(instance.currentPrice),
  'current_value': const NullableDecimalConverter().toJson(instance.currentValue),
  'pnl': const NullableDecimalConverter().toJson(instance.pnl),
  'pnl_percent': const NullableDecimalConverter().toJson(instance.pnlPercent),
};
