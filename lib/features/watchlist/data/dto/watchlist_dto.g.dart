// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchlistDto _$WatchlistDtoFromJson(Map<String, dynamic> json) => _WatchlistDto(
  id: json['id'] as String,
  name: json['name'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  itemCount: (json['item_count'] as num).toInt(),
);

Map<String, dynamic> _$WatchlistDtoToJson(_WatchlistDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'created_at': instance.createdAt.toIso8601String(),
  'item_count': instance.itemCount,
};
