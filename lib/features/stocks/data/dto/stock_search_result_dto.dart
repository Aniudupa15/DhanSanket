import 'package:freezed_annotation/freezed_annotation.dart';

import 'instrument_type_dto.dart';

part 'stock_search_result_dto.freezed.dart';
part 'stock_search_result_dto.g.dart';

@freezed
abstract class StockSearchResultDto with _$StockSearchResultDto {
  const factory StockSearchResultDto({
    required String symbol,
    required String name,
    String? isin,
    String? series,
    @JsonKey(name: 'instrument_type') required InstrumentTypeDto instrumentType,
  }) = _StockSearchResultDto;

  factory StockSearchResultDto.fromJson(Map<String, dynamic> json) => _$StockSearchResultDtoFromJson(json);
}
