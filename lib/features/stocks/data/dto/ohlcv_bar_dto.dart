import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'ohlcv_bar_dto.freezed.dart';
part 'ohlcv_bar_dto.g.dart';

@freezed
abstract class OhlcvBarDto with _$OhlcvBarDto {
  const factory OhlcvBarDto({
    @JsonKey(name: 'trade_date') required DateTime tradeDate,
    @DecimalConverter() required Decimal open,
    @DecimalConverter() required Decimal high,
    @DecimalConverter() required Decimal low,
    @DecimalConverter() required Decimal close,
    required int volume,
  }) = _OhlcvBarDto;

  factory OhlcvBarDto.fromJson(Map<String, dynamic> json) => _$OhlcvBarDtoFromJson(json);
}
