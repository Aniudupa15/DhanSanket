// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchlistDetailDto _$WatchlistDetailDtoFromJson(Map<String, dynamic> json) => _WatchlistDetailDto(
  id: json['id'] as String,
  name: json['name'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  items: (json['items'] as List<dynamic>).map((e) => WatchlistItemDto.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$WatchlistDetailDtoToJson(_WatchlistDetailDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'created_at': instance.createdAt.toIso8601String(),
  'items': instance.items,
};
