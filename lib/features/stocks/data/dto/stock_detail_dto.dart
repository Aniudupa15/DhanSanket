import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';
import 'instrument_type_dto.dart';
import 'quote_dto.dart';

part 'stock_detail_dto.freezed.dart';
part 'stock_detail_dto.g.dart';

@freezed
abstract class StockDetailDto with _$StockDetailDto {
  const factory StockDetailDto({
    required String symbol,
    String? isin,
    required String name,
    String? series,
    String? sector,
    String? industry,
    @JsonKey(name: 'instrument_type') required InstrumentTypeDto instrumentType,
    @JsonKey(name: 'listing_date') DateTime? listingDate,
    @NullableDecimalConverter() @JsonKey(name: 'face_value') Decimal? faceValue,
    QuoteDto? quote,
    @JsonKey(name: 'quote_unavailable_reason') String? quoteUnavailableReason,
  }) = _StockDetailDto;

  factory StockDetailDto.fromJson(Map<String, dynamic> json) => _$StockDetailDtoFromJson(json);
}
