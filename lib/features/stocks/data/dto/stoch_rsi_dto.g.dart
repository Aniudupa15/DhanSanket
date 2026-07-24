// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stoch_rsi_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StochRsiDto _$StochRsiDtoFromJson(Map<String, dynamic> json) => _StochRsiDto(
  k: const NullableDecimalConverter().fromJson(json['k'] as String?),
  d: const NullableDecimalConverter().fromJson(json['d'] as String?),
);

Map<String, dynamic> _$StochRsiDtoToJson(_StochRsiDto instance) => <String, dynamic>{
  'k': const NullableDecimalConverter().toJson(instance.k),
  'd': const NullableDecimalConverter().toJson(instance.d),
};
