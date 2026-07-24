import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../stocks/data/dto/fundamentals_dto.dart';
import '../../../stocks/data/dto/indicators_dto.dart';
import '../../../stocks/data/dto/stock_detail_dto.dart';

part 'comparison_dto.freezed.dart';
part 'comparison_dto.g.dart';

@freezed
abstract class ComparisonEntryDto with _$ComparisonEntryDto {
  const factory ComparisonEntryDto({
    required StockDetailDto detail,
    required IndicatorsDto indicators,
    required FundamentalsDto fundamentals,
  }) = _ComparisonEntryDto;

  factory ComparisonEntryDto.fromJson(Map<String, dynamic> json) => _$ComparisonEntryDtoFromJson(json);
}

@freezed
abstract class ComparisonDto with _$ComparisonDto {
  const factory ComparisonDto({required List<ComparisonEntryDto> entries}) = _ComparisonDto;

  factory ComparisonDto.fromJson(Map<String, dynamic> json) => _$ComparisonDtoFromJson(json);
}
