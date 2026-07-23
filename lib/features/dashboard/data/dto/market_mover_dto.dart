import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'market_mover_dto.freezed.dart';
part 'market_mover_dto.g.dart';

@freezed
abstract class MarketMoverDto with _$MarketMoverDto {
  const factory MarketMoverDto({
    required String symbol,
    required String name,
    @DecimalConverter() @JsonKey(name: 'last_price') required Decimal lastPrice,
    @NullableDecimalConverter() Decimal? change,
    @NullableDecimalConverter() @JsonKey(name: 'change_percent') Decimal? changePercent,
    required int volume,
  }) = _MarketMoverDto;

  factory MarketMoverDto.fromJson(Map<String, dynamic> json) => _$MarketMoverDtoFromJson(json);
}
