import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'screener_request_dto.freezed.dart';
part 'screener_request_dto.g.dart';

@freezed
abstract class ScreenerRequestDto with _$ScreenerRequestDto {
  const factory ScreenerRequestDto({
    @NullableDecimalConverter() @JsonKey(name: 'rsi_below') Decimal? rsiBelow,
    @NullableDecimalConverter() @JsonKey(name: 'rsi_above') Decimal? rsiAbove,
    @NullableDecimalConverter() @JsonKey(name: 'price_min') Decimal? priceMin,
    @NullableDecimalConverter() @JsonKey(name: 'price_max') Decimal? priceMax,
    @JsonKey(name: 'above_sma_50') bool? aboveSma50,
    @JsonKey(name: 'min_volume') int? minVolume,
    @Default(50) int limit,
  }) = _ScreenerRequestDto;

  factory ScreenerRequestDto.fromJson(Map<String, dynamic> json) => _$ScreenerRequestDtoFromJson(json);
}
