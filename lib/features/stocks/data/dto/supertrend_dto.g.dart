// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supertrend_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupertrendDto _$SupertrendDtoFromJson(Map<String, dynamic> json) => _SupertrendDto(
  value: const NullableDecimalConverter().fromJson(json['value'] as String?),
  direction: (json['direction'] as num?)?.toInt(),
);

Map<String, dynamic> _$SupertrendDtoToJson(_SupertrendDto instance) => <String, dynamic>{
  'value': const NullableDecimalConverter().toJson(instance.value),
  'direction': instance.direction,
};
