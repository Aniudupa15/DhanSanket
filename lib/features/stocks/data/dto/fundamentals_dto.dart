import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'fundamentals_dto.freezed.dart';
part 'fundamentals_dto.g.dart';

@freezed
abstract class FundamentalsDto with _$FundamentalsDto {
  const factory FundamentalsDto({
    required String symbol,
    @JsonKey(name: 'has_data') @Default(false) bool hasData,
    @JsonKey(name: 'latest_period_end') DateTime? latestPeriodEnd,
    @NullableDecimalConverter() @JsonKey(name: 'revenue_growth_yoy') Decimal? revenueGrowthYoy,
    @NullableDecimalConverter() @JsonKey(name: 'revenue_growth_qoq') Decimal? revenueGrowthQoq,
    @NullableDecimalConverter() @JsonKey(name: 'profit_growth_yoy') Decimal? profitGrowthYoy,
    @NullableDecimalConverter() @JsonKey(name: 'profit_growth_qoq') Decimal? profitGrowthQoq,
    @NullableDecimalConverter() @JsonKey(name: 'ttm_eps') Decimal? ttmEps,
    @NullableDecimalConverter() @JsonKey(name: 'pe_ratio') Decimal? peRatio,
    @NullableDecimalConverter() @JsonKey(name: 'dividend_yield') Decimal? dividendYield,
    @NullableDecimalConverter() @JsonKey(name: 'book_value') Decimal? bookValue,
    @NullableDecimalConverter() Decimal? roe,
    @NullableDecimalConverter() Decimal? roce,
    @NullableDecimalConverter() @JsonKey(name: 'debt_to_equity') Decimal? debtToEquity,
  }) = _FundamentalsDto;

  factory FundamentalsDto.fromJson(Map<String, dynamic> json) => _$FundamentalsDtoFromJson(json);
}
