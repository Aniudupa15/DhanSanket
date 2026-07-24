// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intraday_recommendation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IntradayRecommendationDto _$IntradayRecommendationDtoFromJson(Map<String, dynamic> json) => _IntradayRecommendationDto(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  asOf: DateTime.parse(json['as_of'] as String),
  signal: json['signal'] as String,
  confidence: const DecimalConverter().fromJson(json['confidence'] as String),
  entryPrice: const NullableDecimalConverter().fromJson(json['entry_price'] as String?),
  targetPrice: const NullableDecimalConverter().fromJson(json['target_price'] as String?),
  stopLoss: const NullableDecimalConverter().fromJson(json['stop_loss'] as String?),
  reasoning: (json['reasoning'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
);

Map<String, dynamic> _$IntradayRecommendationDtoToJson(_IntradayRecommendationDto instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'as_of': instance.asOf.toIso8601String(),
  'signal': instance.signal,
  'confidence': const DecimalConverter().toJson(instance.confidence),
  'entry_price': const NullableDecimalConverter().toJson(instance.entryPrice),
  'target_price': const NullableDecimalConverter().toJson(instance.targetPrice),
  'stop_loss': const NullableDecimalConverter().toJson(instance.stopLoss),
  'reasoning': instance.reasoning,
};
