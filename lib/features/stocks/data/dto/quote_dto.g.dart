// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuoteDto _$QuoteDtoFromJson(Map<String, dynamic> json) => _QuoteDto(
  lastPrice: const DecimalConverter().fromJson(json['last_price'] as String),
  change: const DecimalConverter().fromJson(json['change'] as String),
  changePercent: const DecimalConverter().fromJson(
    json['change_percent'] as String,
  ),
  open: const DecimalConverter().fromJson(json['open'] as String),
  high: const DecimalConverter().fromJson(json['high'] as String),
  low: const DecimalConverter().fromJson(json['low'] as String),
  previousClose: const DecimalConverter().fromJson(
    json['previous_close'] as String,
  ),
  volume: (json['volume'] as num).toInt(),
  asOf: DateTime.parse(json['as_of'] as String),
);

Map<String, dynamic> _$QuoteDtoToJson(_QuoteDto instance) => <String, dynamic>{
  'last_price': const DecimalConverter().toJson(instance.lastPrice),
  'change': const DecimalConverter().toJson(instance.change),
  'change_percent': const DecimalConverter().toJson(instance.changePercent),
  'open': const DecimalConverter().toJson(instance.open),
  'high': const DecimalConverter().toJson(instance.high),
  'low': const DecimalConverter().toJson(instance.low),
  'previous_close': const DecimalConverter().toJson(instance.previousClose),
  'volume': instance.volume,
  'as_of': instance.asOf.toIso8601String(),
};
