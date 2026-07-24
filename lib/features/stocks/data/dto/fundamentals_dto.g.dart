// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fundamentals_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FundamentalsDto _$FundamentalsDtoFromJson(Map<String, dynamic> json) =>
    _FundamentalsDto(
      symbol: json['symbol'] as String,
      hasData: json['has_data'] as bool? ?? false,
      latestPeriodEnd: json['latest_period_end'] == null
          ? null
          : DateTime.parse(json['latest_period_end'] as String),
      revenueGrowthYoy: const NullableDecimalConverter().fromJson(
        json['revenue_growth_yoy'] as String?,
      ),
      revenueGrowthQoq: const NullableDecimalConverter().fromJson(
        json['revenue_growth_qoq'] as String?,
      ),
      profitGrowthYoy: const NullableDecimalConverter().fromJson(
        json['profit_growth_yoy'] as String?,
      ),
      profitGrowthQoq: const NullableDecimalConverter().fromJson(
        json['profit_growth_qoq'] as String?,
      ),
      ttmEps: const NullableDecimalConverter().fromJson(
        json['ttm_eps'] as String?,
      ),
      peRatio: const NullableDecimalConverter().fromJson(
        json['pe_ratio'] as String?,
      ),
      dividendYield: const NullableDecimalConverter().fromJson(
        json['dividend_yield'] as String?,
      ),
      bookValue: const NullableDecimalConverter().fromJson(
        json['book_value'] as String?,
      ),
      roe: const NullableDecimalConverter().fromJson(json['roe'] as String?),
      roce: const NullableDecimalConverter().fromJson(json['roce'] as String?),
      debtToEquity: const NullableDecimalConverter().fromJson(
        json['debt_to_equity'] as String?,
      ),
    );

Map<String, dynamic> _$FundamentalsDtoToJson(_FundamentalsDto instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'has_data': instance.hasData,
      'latest_period_end': instance.latestPeriodEnd?.toIso8601String(),
      'revenue_growth_yoy': const NullableDecimalConverter().toJson(
        instance.revenueGrowthYoy,
      ),
      'revenue_growth_qoq': const NullableDecimalConverter().toJson(
        instance.revenueGrowthQoq,
      ),
      'profit_growth_yoy': const NullableDecimalConverter().toJson(
        instance.profitGrowthYoy,
      ),
      'profit_growth_qoq': const NullableDecimalConverter().toJson(
        instance.profitGrowthQoq,
      ),
      'ttm_eps': const NullableDecimalConverter().toJson(instance.ttmEps),
      'pe_ratio': const NullableDecimalConverter().toJson(instance.peRatio),
      'dividend_yield': const NullableDecimalConverter().toJson(
        instance.dividendYield,
      ),
      'book_value': const NullableDecimalConverter().toJson(instance.bookValue),
      'roe': const NullableDecimalConverter().toJson(instance.roe),
      'roce': const NullableDecimalConverter().toJson(instance.roce),
      'debt_to_equity': const NullableDecimalConverter().toJson(
        instance.debtToEquity,
      ),
    };
