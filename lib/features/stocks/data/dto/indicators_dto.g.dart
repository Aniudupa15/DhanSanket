// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indicators_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IndicatorsDto _$IndicatorsDtoFromJson(Map<String, dynamic> json) => _IndicatorsDto(
  symbol: json['symbol'] as String,
  asOf: json['as_of'] == null ? null : DateTime.parse(json['as_of'] as String),
  hasData: json['has_data'] as bool? ?? false,
  sma20: const NullableDecimalConverter().fromJson(json['sma_20'] as String?),
  sma50: const NullableDecimalConverter().fromJson(json['sma_50'] as String?),
  sma200: const NullableDecimalConverter().fromJson(json['sma_200'] as String?),
  ema20: const NullableDecimalConverter().fromJson(json['ema_20'] as String?),
  ema50: const NullableDecimalConverter().fromJson(json['ema_50'] as String?),
  rsi14: const NullableDecimalConverter().fromJson(json['rsi_14'] as String?),
  macd: json['macd'] == null ? null : MacdDto.fromJson(json['macd'] as Map<String, dynamic>),
  bollinger: json['bollinger'] == null ? null : BollingerDto.fromJson(json['bollinger'] as Map<String, dynamic>),
  vwap20: const NullableDecimalConverter().fromJson(json['vwap_20'] as String?),
  adx14: const NullableDecimalConverter().fromJson(json['adx_14'] as String?),
  atr14: const NullableDecimalConverter().fromJson(json['atr_14'] as String?),
  supertrend: json['supertrend'] == null ? null : SupertrendDto.fromJson(json['supertrend'] as Map<String, dynamic>),
  stochasticRsi: json['stochastic_rsi'] == null
      ? null
      : StochRsiDto.fromJson(json['stochastic_rsi'] as Map<String, dynamic>),
  pivotPoints: json['pivot_points'] == null
      ? null
      : PivotPointsDto.fromJson(json['pivot_points'] as Map<String, dynamic>),
  volumeProfile:
      (json['volume_profile'] as List<dynamic>?)
          ?.map((e) => VolumeProfileBinDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pointOfControl: json['point_of_control'] == null
      ? null
      : VolumeProfileBinDto.fromJson(json['point_of_control'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IndicatorsDtoToJson(_IndicatorsDto instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'as_of': instance.asOf?.toIso8601String(),
  'has_data': instance.hasData,
  'sma_20': const NullableDecimalConverter().toJson(instance.sma20),
  'sma_50': const NullableDecimalConverter().toJson(instance.sma50),
  'sma_200': const NullableDecimalConverter().toJson(instance.sma200),
  'ema_20': const NullableDecimalConverter().toJson(instance.ema20),
  'ema_50': const NullableDecimalConverter().toJson(instance.ema50),
  'rsi_14': const NullableDecimalConverter().toJson(instance.rsi14),
  'macd': instance.macd,
  'bollinger': instance.bollinger,
  'vwap_20': const NullableDecimalConverter().toJson(instance.vwap20),
  'adx_14': const NullableDecimalConverter().toJson(instance.adx14),
  'atr_14': const NullableDecimalConverter().toJson(instance.atr14),
  'supertrend': instance.supertrend,
  'stochastic_rsi': instance.stochasticRsi,
  'pivot_points': instance.pivotPoints,
  'volume_profile': instance.volumeProfile,
  'point_of_control': instance.pointOfControl,
};
