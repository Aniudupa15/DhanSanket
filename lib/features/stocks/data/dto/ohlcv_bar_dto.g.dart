// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ohlcv_bar_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OhlcvBarDto _$OhlcvBarDtoFromJson(Map<String, dynamic> json) => _OhlcvBarDto(
  tradeDate: DateTime.parse(json['trade_date'] as String),
  open: const DecimalConverter().fromJson(json['open'] as String),
  high: const DecimalConverter().fromJson(json['high'] as String),
  low: const DecimalConverter().fromJson(json['low'] as String),
  close: const DecimalConverter().fromJson(json['close'] as String),
  volume: (json['volume'] as num).toInt(),
);

Map<String, dynamic> _$OhlcvBarDtoToJson(_OhlcvBarDto instance) => <String, dynamic>{
  'trade_date': instance.tradeDate.toIso8601String(),
  'open': const DecimalConverter().toJson(instance.open),
  'high': const DecimalConverter().toJson(instance.high),
  'low': const DecimalConverter().toJson(instance.low),
  'close': const DecimalConverter().toJson(instance.close),
  'volume': instance.volume,
};
