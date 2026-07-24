import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'supertrend_dto.freezed.dart';
part 'supertrend_dto.g.dart';

@freezed
abstract class SupertrendDto with _$SupertrendDto {
  const factory SupertrendDto({
    @NullableDecimalConverter() Decimal? value,
    int? direction, // plain int (1/-1), not a Decimal - confirmed from backend schema
  }) = _SupertrendDto;

  factory SupertrendDto.fromJson(Map<String, dynamic> json) => _$SupertrendDtoFromJson(json);
}
