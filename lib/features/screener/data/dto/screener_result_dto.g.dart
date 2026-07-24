// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screener_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScreenerResultDto _$ScreenerResultDtoFromJson(
  Map<String, dynamic> json,
) => _ScreenerResultDto(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  asOf: DateTime.parse(json['as_of'] as String),
  close: const DecimalConverter().fromJson(json['close'] as String),
  volume: (json['volume'] as num).toInt(),
  rsi14: const NullableDecimalConverter().fromJson(json['rsi_14'] as String?),
  sma50: const NullableDecimalConverter().fromJson(json['sma_50'] as String?),
  sma200: const NullableDecimalConverter().fromJson(json['sma_200'] as String?),
);

Map<String, dynamic> _$ScreenerResultDtoToJson(_ScreenerResultDto instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'as_of': instance.asOf.toIso8601String(),
      'close': const DecimalConverter().toJson(instance.close),
      'volume': instance.volume,
      'rsi_14': const NullableDecimalConverter().toJson(instance.rsi14),
      'sma_50': const NullableDecimalConverter().toJson(instance.sma50),
      'sma_200': const NullableDecimalConverter().toJson(instance.sma200),
    };
