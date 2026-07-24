import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'screener_result_dto.freezed.dart';
part 'screener_result_dto.g.dart';

@freezed
abstract class ScreenerResultDto with _$ScreenerResultDto {
  const factory ScreenerResultDto({
    required String symbol,
    required String name,
    @JsonKey(name: 'as_of') required DateTime asOf,
    @DecimalConverter() required Decimal close,
    required int volume,
    @NullableDecimalConverter() @JsonKey(name: 'rsi_14') Decimal? rsi14,
    @NullableDecimalConverter() @JsonKey(name: 'sma_50') Decimal? sma50,
    @NullableDecimalConverter() @JsonKey(name: 'sma_200') Decimal? sma200,
  }) = _ScreenerResultDto;

  factory ScreenerResultDto.fromJson(Map<String, dynamic> json) => _$ScreenerResultDtoFromJson(json);
}
