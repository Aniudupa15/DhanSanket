import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'bollinger_dto.freezed.dart';
part 'bollinger_dto.g.dart';

@freezed
abstract class BollingerDto with _$BollingerDto {
  const factory BollingerDto({
    @NullableDecimalConverter() Decimal? upper,
    @NullableDecimalConverter() Decimal? middle,
    @NullableDecimalConverter() Decimal? lower,
  }) = _BollingerDto;

  factory BollingerDto.fromJson(Map<String, dynamic> json) => _$BollingerDtoFromJson(json);
}
