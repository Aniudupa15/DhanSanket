import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'heatmap_dto.freezed.dart';
part 'heatmap_dto.g.dart';

@freezed
abstract class HeatmapTileDto with _$HeatmapTileDto {
  const factory HeatmapTileDto({
    required String symbol,
    required String name,
    @DecimalConverter() @JsonKey(name: 'last_price') required Decimal lastPrice,
    @NullableDecimalConverter() @JsonKey(name: 'change_percent') Decimal? changePercent,
    required int volume,
    required String bucket,
  }) = _HeatmapTileDto;

  factory HeatmapTileDto.fromJson(Map<String, dynamic> json) => _$HeatmapTileDtoFromJson(json);
}

@freezed
abstract class HeatmapDto with _$HeatmapDto {
  const factory HeatmapDto({required List<HeatmapTileDto> tiles, required List<String> notes}) = _HeatmapDto;

  factory HeatmapDto.fromJson(Map<String, dynamic> json) => _$HeatmapDtoFromJson(json);
}
