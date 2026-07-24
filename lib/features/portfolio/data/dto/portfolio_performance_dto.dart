import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'portfolio_performance_dto.freezed.dart';
part 'portfolio_performance_dto.g.dart';

@freezed
abstract class PortfolioPerformanceDto with _$PortfolioPerformanceDto {
  const factory PortfolioPerformanceDto({
    required String id,
    @DecimalConverter() @JsonKey(name: 'total_invested') required Decimal totalInvested,
    @DecimalConverter() @JsonKey(name: 'current_value') required Decimal currentValue,
    @DecimalConverter() @JsonKey(name: 'total_pnl') required Decimal totalPnl,
    @NullableDecimalConverter() @JsonKey(name: 'total_pnl_percent') Decimal? totalPnlPercent,
    @NullableDecimalConverter() @JsonKey(name: 'xirr_percent') Decimal? xirrPercent,
  }) = _PortfolioPerformanceDto;

  factory PortfolioPerformanceDto.fromJson(Map<String, dynamic> json) => _$PortfolioPerformanceDtoFromJson(json);
}
