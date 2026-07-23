import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'index_quote_dto.freezed.dart';
part 'index_quote_dto.g.dart';

@freezed
abstract class IndexQuoteDto with _$IndexQuoteDto {
  const factory IndexQuoteDto({
    @JsonKey(name: 'index_name') required String indexName,
    @DecimalConverter() @JsonKey(name: 'last_price') required Decimal lastPrice,
    @DecimalConverter() required Decimal change,
    @DecimalConverter() @JsonKey(name: 'change_percent') required Decimal changePercent,
  }) = _IndexQuoteDto;

  factory IndexQuoteDto.fromJson(Map<String, dynamic> json) => _$IndexQuoteDtoFromJson(json);
}
