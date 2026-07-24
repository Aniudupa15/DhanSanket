import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'macd_dto.freezed.dart';
part 'macd_dto.g.dart';

@freezed
abstract class MacdDto with _$MacdDto {
  const factory MacdDto({
    @NullableDecimalConverter() Decimal? macd,
    @NullableDecimalConverter() Decimal? signal,
    @NullableDecimalConverter() Decimal? histogram,
  }) = _MacdDto;

  factory MacdDto.fromJson(Map<String, dynamic> json) => _$MacdDtoFromJson(json);
}
