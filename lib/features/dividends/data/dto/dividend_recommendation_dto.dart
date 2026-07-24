import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'dividend_recommendation_dto.freezed.dart';
part 'dividend_recommendation_dto.g.dart';

@freezed
abstract class DividendRecommendationDto with _$DividendRecommendationDto {
  const factory DividendRecommendationDto({
    required String symbol,
    required String name,
    @DecimalConverter() @JsonKey(name: 'dividend_yield') required Decimal dividendYield,
    @DecimalConverter() @JsonKey(name: 'dividend_amount') required Decimal dividendAmount,
    @JsonKey(name: 'ex_dividend_date') required DateTime exDividendDate,
    @JsonKey(name: 'buy_before_date') required DateTime buyBeforeDate,
    required String recommendation,
    @JsonKey(name: 'risk_level') required String riskLevel,
    required int confidence,
  }) = _DividendRecommendationDto;

  factory DividendRecommendationDto.fromJson(Map<String, dynamic> json) => _$DividendRecommendationDtoFromJson(json);
}
