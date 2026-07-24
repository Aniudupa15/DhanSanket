import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'stoch_rsi_dto.freezed.dart';
part 'stoch_rsi_dto.g.dart';

@freezed
abstract class StochRsiDto with _$StochRsiDto {
  const factory StochRsiDto({@NullableDecimalConverter() Decimal? k, @NullableDecimalConverter() Decimal? d}) =
      _StochRsiDto;

  factory StochRsiDto.fromJson(Map<String, dynamic> json) => _$StochRsiDtoFromJson(json);
}
