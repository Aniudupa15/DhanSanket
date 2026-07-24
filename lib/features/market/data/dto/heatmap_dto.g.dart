// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heatmap_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HeatmapTileDto _$HeatmapTileDtoFromJson(Map<String, dynamic> json) => _HeatmapTileDto(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  lastPrice: const DecimalConverter().fromJson(json['last_price'] as String),
  changePercent: const NullableDecimalConverter().fromJson(json['change_percent'] as String?),
  volume: (json['volume'] as num).toInt(),
  bucket: json['bucket'] as String,
);

Map<String, dynamic> _$HeatmapTileDtoToJson(_HeatmapTileDto instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'last_price': const DecimalConverter().toJson(instance.lastPrice),
  'change_percent': const NullableDecimalConverter().toJson(instance.changePercent),
  'volume': instance.volume,
  'bucket': instance.bucket,
};

_HeatmapDto _$HeatmapDtoFromJson(Map<String, dynamic> json) => _HeatmapDto(
  tiles: (json['tiles'] as List<dynamic>).map((e) => HeatmapTileDto.fromJson(e as Map<String, dynamic>)).toList(),
  notes: (json['notes'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$HeatmapDtoToJson(_HeatmapDto instance) => <String, dynamic>{
  'tiles': instance.tiles,
  'notes': instance.notes,
};
