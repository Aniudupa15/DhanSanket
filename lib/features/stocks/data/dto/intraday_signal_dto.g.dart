// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intraday_signal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IntradaySignalDto _$IntradaySignalDtoFromJson(Map<String, dynamic> json) => _IntradaySignalDto(
  symbol: json['symbol'] as String,
  asOf: json['as_of'] == null ? null : DateTime.parse(json['as_of'] as String),
  hasData: json['has_data'] as bool? ?? false,
  signal: json['signal'] as String? ?? 'HOLD',
  confidence: const DecimalConverter().fromJson(json['confidence'] as String),
  entryPrice: const NullableDecimalConverter().fromJson(json['entry_price'] as String?),
  targetPrice: const NullableDecimalConverter().fromJson(json['target_price'] as String?),
  stopLoss: const NullableDecimalConverter().fromJson(json['stop_loss'] as String?),
  riskRewardRatio: const NullableDecimalConverter().fromJson(json['risk_reward_ratio'] as String?),
  probability: const NullableDecimalConverter().fromJson(json['probability'] as String?),
  reasoning: (json['reasoning'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  disclaimer: json['disclaimer'] as String,
);

Map<String, dynamic> _$IntradaySignalDtoToJson(_IntradaySignalDto instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'as_of': instance.asOf?.toIso8601String(),
  'has_data': instance.hasData,
  'signal': instance.signal,
  'confidence': const DecimalConverter().toJson(instance.confidence),
  'entry_price': const NullableDecimalConverter().toJson(instance.entryPrice),
  'target_price': const NullableDecimalConverter().toJson(instance.targetPrice),
  'stop_loss': const NullableDecimalConverter().toJson(instance.stopLoss),
  'risk_reward_ratio': const NullableDecimalConverter().toJson(instance.riskRewardRatio),
  'probability': const NullableDecimalConverter().toJson(instance.probability),
  'reasoning': instance.reasoning,
  'disclaimer': instance.disclaimer,
};
