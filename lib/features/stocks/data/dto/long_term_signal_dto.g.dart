// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'long_term_signal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LongTermSignalDto _$LongTermSignalDtoFromJson(Map<String, dynamic> json) => _LongTermSignalDto(
  symbol: json['symbol'] as String,
  hasData: json['has_data'] as bool? ?? false,
  signal: json['signal'] as String? ?? 'HOLD',
  confidence: (json['confidence'] as num?)?.toInt() ?? 0,
  investmentHorizon: json['investment_horizon'] as String? ?? 'Long-term (1-3+ years)',
  riskLevel: json['risk_level'] as String? ?? 'Unknown',
  growthPotential: json['growth_potential'] as String? ?? 'Unknown',
  strengths: (json['strengths'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  weaknesses: (json['weaknesses'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  opportunities: (json['opportunities'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  risks: (json['risks'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  reasoning: (json['reasoning'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  disclaimer: json['disclaimer'] as String,
);

Map<String, dynamic> _$LongTermSignalDtoToJson(_LongTermSignalDto instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'has_data': instance.hasData,
  'signal': instance.signal,
  'confidence': instance.confidence,
  'investment_horizon': instance.investmentHorizon,
  'risk_level': instance.riskLevel,
  'growth_potential': instance.growthPotential,
  'strengths': instance.strengths,
  'weaknesses': instance.weaknesses,
  'opportunities': instance.opportunities,
  'risks': instance.risks,
  'reasoning': instance.reasoning,
  'disclaimer': instance.disclaimer,
};
