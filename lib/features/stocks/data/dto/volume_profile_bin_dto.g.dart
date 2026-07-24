// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_profile_bin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolumeProfileBinDto _$VolumeProfileBinDtoFromJson(Map<String, dynamic> json) => _VolumeProfileBinDto(
  priceLow: const DecimalConverter().fromJson(json['price_low'] as String),
  priceHigh: const DecimalConverter().fromJson(json['price_high'] as String),
  volume: (json['volume'] as num).toInt(),
);

Map<String, dynamic> _$VolumeProfileBinDtoToJson(_VolumeProfileBinDto instance) => <String, dynamic>{
  'price_low': const DecimalConverter().toJson(instance.priceLow),
  'price_high': const DecimalConverter().toJson(instance.priceHigh),
  'volume': instance.volume,
};
