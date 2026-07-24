// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screener_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScreenerRequestDto _$ScreenerRequestDtoFromJson(Map<String, dynamic> json) =>
    _ScreenerRequestDto(
      rsiBelow: const NullableDecimalConverter().fromJson(
        json['rsi_below'] as String?,
      ),
      rsiAbove: const NullableDecimalConverter().fromJson(
        json['rsi_above'] as String?,
      ),
      priceMin: const NullableDecimalConverter().fromJson(
        json['price_min'] as String?,
      ),
      priceMax: const NullableDecimalConverter().fromJson(
        json['price_max'] as String?,
      ),
      aboveSma50: json['above_sma_50'] as bool?,
      minVolume: (json['min_volume'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt() ?? 50,
    );

Map<String, dynamic> _$ScreenerRequestDtoToJson(_ScreenerRequestDto instance) =>
    <String, dynamic>{
      'rsi_below': const NullableDecimalConverter().toJson(instance.rsiBelow),
      'rsi_above': const NullableDecimalConverter().toJson(instance.rsiAbove),
      'price_min': const NullableDecimalConverter().toJson(instance.priceMin),
      'price_max': const NullableDecimalConverter().toJson(instance.priceMax),
      'above_sma_50': instance.aboveSma50,
      'min_volume': instance.minVolume,
      'limit': instance.limit,
    };
