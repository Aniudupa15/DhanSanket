// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'macd_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MacdDto _$MacdDtoFromJson(Map<String, dynamic> json) => _MacdDto(
  macd: const NullableDecimalConverter().fromJson(json['macd'] as String?),
  signal: const NullableDecimalConverter().fromJson(json['signal'] as String?),
  histogram: const NullableDecimalConverter().fromJson(
    json['histogram'] as String?,
  ),
);

Map<String, dynamic> _$MacdDtoToJson(_MacdDto instance) => <String, dynamic>{
  'macd': const NullableDecimalConverter().toJson(instance.macd),
  'signal': const NullableDecimalConverter().toJson(instance.signal),
  'histogram': const NullableDecimalConverter().toJson(instance.histogram),
};
