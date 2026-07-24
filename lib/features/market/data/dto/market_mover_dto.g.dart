// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_mover_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketMoverDto _$MarketMoverDtoFromJson(Map<String, dynamic> json) => _MarketMoverDto(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  lastPrice: const DecimalConverter().fromJson(json['last_price'] as String),
  change: const NullableDecimalConverter().fromJson(json['change'] as String?),
  changePercent: const NullableDecimalConverter().fromJson(json['change_percent'] as String?),
  volume: (json['volume'] as num).toInt(),
);

Map<String, dynamic> _$MarketMoverDtoToJson(_MarketMoverDto instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'last_price': const DecimalConverter().toJson(instance.lastPrice),
  'change': const NullableDecimalConverter().toJson(instance.change),
  'change_percent': const NullableDecimalConverter().toJson(instance.changePercent),
  'volume': instance.volume,
};
