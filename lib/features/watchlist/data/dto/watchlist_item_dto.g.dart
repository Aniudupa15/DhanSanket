// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchlistItemDto _$WatchlistItemDtoFromJson(Map<String, dynamic> json) => _WatchlistItemDto(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  addedAt: DateTime.parse(json['added_at'] as String),
  lastPrice: const NullableDecimalConverter().fromJson(json['last_price'] as String?),
  change: const NullableDecimalConverter().fromJson(json['change'] as String?),
  changePercent: const NullableDecimalConverter().fromJson(json['change_percent'] as String?),
);

Map<String, dynamic> _$WatchlistItemDtoToJson(_WatchlistItemDto instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'added_at': instance.addedAt.toIso8601String(),
  'last_price': const NullableDecimalConverter().toJson(instance.lastPrice),
  'change': const NullableDecimalConverter().toJson(instance.change),
  'change_percent': const NullableDecimalConverter().toJson(instance.changePercent),
};
