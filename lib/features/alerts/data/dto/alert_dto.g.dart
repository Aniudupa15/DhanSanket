// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlertDto _$AlertDtoFromJson(Map<String, dynamic> json) => _AlertDto(
  id: json['id'] as String,
  symbol: json['symbol'] as String,
  alertType: $enumDecode(_$AlertTypeDtoEnumMap, json['alert_type']),
  condition: json['condition'] as Map<String, dynamic>,
  status: $enumDecode(_$AlertStatusDtoEnumMap, json['status']),
  createdAt: DateTime.parse(json['created_at'] as String),
  triggeredAt: json['triggered_at'] == null
      ? null
      : DateTime.parse(json['triggered_at'] as String),
);

Map<String, dynamic> _$AlertDtoToJson(_AlertDto instance) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'alert_type': _$AlertTypeDtoEnumMap[instance.alertType]!,
  'condition': instance.condition,
  'status': _$AlertStatusDtoEnumMap[instance.status]!,
  'created_at': instance.createdAt.toIso8601String(),
  'triggered_at': instance.triggeredAt?.toIso8601String(),
};

const _$AlertTypeDtoEnumMap = {
  AlertTypeDto.priceAbove: 'PRICE_ABOVE',
  AlertTypeDto.priceBelow: 'PRICE_BELOW',
  AlertTypeDto.percentChangeAbove: 'PERCENT_CHANGE_ABOVE',
  AlertTypeDto.percentChangeBelow: 'PERCENT_CHANGE_BELOW',
  AlertTypeDto.rsiAbove: 'RSI_ABOVE',
  AlertTypeDto.rsiBelow: 'RSI_BELOW',
  AlertTypeDto.volumeSpike: 'VOLUME_SPIKE',
  AlertTypeDto.new52WeekHigh: 'NEW_52_WEEK_HIGH',
  AlertTypeDto.new52WeekLow: 'NEW_52_WEEK_LOW',
};

const _$AlertStatusDtoEnumMap = {
  AlertStatusDto.active: 'ACTIVE',
  AlertStatusDto.triggered: 'TRIGGERED',
  AlertStatusDto.cancelled: 'CANCELLED',
};
