// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dividend_recommendation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DividendRecommendationDto _$DividendRecommendationDtoFromJson(Map<String, dynamic> json) => _DividendRecommendationDto(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  dividendYield: const DecimalConverter().fromJson(json['dividend_yield'] as String),
  dividendAmount: const DecimalConverter().fromJson(json['dividend_amount'] as String),
  exDividendDate: DateTime.parse(json['ex_dividend_date'] as String),
  buyBeforeDate: DateTime.parse(json['buy_before_date'] as String),
  recommendation: json['recommendation'] as String,
  riskLevel: json['risk_level'] as String,
  confidence: (json['confidence'] as num).toInt(),
);

Map<String, dynamic> _$DividendRecommendationDtoToJson(_DividendRecommendationDto instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'dividend_yield': const DecimalConverter().toJson(instance.dividendYield),
  'dividend_amount': const DecimalConverter().toJson(instance.dividendAmount),
  'ex_dividend_date': instance.exDividendDate.toIso8601String(),
  'buy_before_date': instance.buyBeforeDate.toIso8601String(),
  'recommendation': instance.recommendation,
  'risk_level': instance.riskLevel,
  'confidence': instance.confidence,
};
