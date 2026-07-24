// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bollinger_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BollingerDto _$BollingerDtoFromJson(
  Map<String, dynamic> json,
) => _BollingerDto(
  upper: const NullableDecimalConverter().fromJson(json['upper'] as String?),
  middle: const NullableDecimalConverter().fromJson(json['middle'] as String?),
  lower: const NullableDecimalConverter().fromJson(json['lower'] as String?),
);

Map<String, dynamic> _$BollingerDtoToJson(_BollingerDto instance) =>
    <String, dynamic>{
      'upper': const NullableDecimalConverter().toJson(instance.upper),
      'middle': const NullableDecimalConverter().toJson(instance.middle),
      'lower': const NullableDecimalConverter().toJson(instance.lower),
    };
