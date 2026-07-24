import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'holding_dto.freezed.dart';
part 'holding_dto.g.dart';

@freezed
abstract class HoldingDto with _$HoldingDto {
  const factory HoldingDto({
    required String symbol,
    @DecimalConverter() required Decimal quantity,
    @DecimalConverter() @JsonKey(name: 'avg_price') required Decimal avgPrice,
    @DecimalConverter() @JsonKey(name: 'cost_basis') required Decimal costBasis,
    @NullableDecimalConverter() @JsonKey(name: 'current_price') Decimal? currentPrice,
    @NullableDecimalConverter() @JsonKey(name: 'current_value') Decimal? currentValue,
    @NullableDecimalConverter() Decimal? pnl,
    @NullableDecimalConverter() @JsonKey(name: 'pnl_percent') Decimal? pnlPercent,
  }) = _HoldingDto;

  factory HoldingDto.fromJson(Map<String, dynamic> json) => _$HoldingDtoFromJson(json);
}
