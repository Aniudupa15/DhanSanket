// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'long_term_recommendation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LongTermRecommendationDto _$LongTermRecommendationDtoFromJson(Map<String, dynamic> json) => _LongTermRecommendationDto(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  asOf: DateTime.parse(json['as_of'] as String),
  signal: json['signal'] as String,
  confidence: (json['confidence'] as num).toInt(),
  riskLevel: json['risk_level'] as String,
  growthPotential: json['growth_potential'] as String,
  investmentTenure: json['investment_tenure'] as String,
  reasoning: (json['reasoning'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
);

Map<String, dynamic> _$LongTermRecommendationDtoToJson(_LongTermRecommendationDto instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'as_of': instance.asOf.toIso8601String(),
  'signal': instance.signal,
  'confidence': instance.confidence,
  'risk_level': instance.riskLevel,
  'growth_potential': instance.growthPotential,
  'investment_tenure': instance.investmentTenure,
  'reasoning': instance.reasoning,
};
