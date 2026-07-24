import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'quote_dto.freezed.dart';
part 'quote_dto.g.dart';

@freezed
abstract class QuoteDto with _$QuoteDto {
  const factory QuoteDto({
    @DecimalConverter() @JsonKey(name: 'last_price') required Decimal lastPrice,
    @DecimalConverter() required Decimal change,
    @DecimalConverter() @JsonKey(name: 'change_percent') required Decimal changePercent,
    @DecimalConverter() required Decimal open,
    @DecimalConverter() required Decimal high,
    @DecimalConverter() required Decimal low,
    @DecimalConverter() @JsonKey(name: 'previous_close') required Decimal previousClose,
    required int volume,
    @JsonKey(name: 'as_of') required DateTime asOf,
  }) = _QuoteDto;

  factory QuoteDto.fromJson(Map<String, dynamic> json) => _$QuoteDtoFromJson(json);
}
