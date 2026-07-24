import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';
import 'bollinger_dto.dart';
import 'macd_dto.dart';
import 'pivot_points_dto.dart';
import 'stoch_rsi_dto.dart';
import 'supertrend_dto.dart';
import 'volume_profile_bin_dto.dart';

part 'indicators_dto.freezed.dart';
part 'indicators_dto.g.dart';

@freezed
abstract class IndicatorsDto with _$IndicatorsDto {
  const factory IndicatorsDto({
    required String symbol,
    @JsonKey(name: 'as_of') DateTime? asOf,
    @JsonKey(name: 'has_data') @Default(false) bool hasData,
    @NullableDecimalConverter() @JsonKey(name: 'sma_20') Decimal? sma20,
    @NullableDecimalConverter() @JsonKey(name: 'sma_50') Decimal? sma50,
    @NullableDecimalConverter() @JsonKey(name: 'sma_200') Decimal? sma200,
    @NullableDecimalConverter() @JsonKey(name: 'ema_20') Decimal? ema20,
    @NullableDecimalConverter() @JsonKey(name: 'ema_50') Decimal? ema50,
    @NullableDecimalConverter() @JsonKey(name: 'rsi_14') Decimal? rsi14,
    MacdDto? macd,
    BollingerDto? bollinger,
    @NullableDecimalConverter() @JsonKey(name: 'vwap_20') Decimal? vwap20,
    @NullableDecimalConverter() @JsonKey(name: 'adx_14') Decimal? adx14,
    @NullableDecimalConverter() @JsonKey(name: 'atr_14') Decimal? atr14,
    SupertrendDto? supertrend,
    @JsonKey(name: 'stochastic_rsi') StochRsiDto? stochasticRsi,
    @JsonKey(name: 'pivot_points') PivotPointsDto? pivotPoints,
    @JsonKey(name: 'volume_profile') @Default([]) List<VolumeProfileBinDto> volumeProfile,
    @JsonKey(name: 'point_of_control') VolumeProfileBinDto? pointOfControl,
  }) = _IndicatorsDto;

  factory IndicatorsDto.fromJson(Map<String, dynamic> json) => _$IndicatorsDtoFromJson(json);
}
