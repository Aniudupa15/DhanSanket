import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'intraday_signal_dto.freezed.dart';
part 'intraday_signal_dto.g.dart';

@freezed
abstract class IntradaySignalDto with _$IntradaySignalDto {
  const factory IntradaySignalDto({
    required String symbol,
    @JsonKey(name: 'as_of') DateTime? asOf,
    @JsonKey(name: 'has_data') @Default(false) bool hasData,
    @Default('HOLD') String signal,
    @DecimalConverter() required Decimal confidence,
    @NullableDecimalConverter() @JsonKey(name: 'entry_price') Decimal? entryPrice,
    @NullableDecimalConverter() @JsonKey(name: 'target_price') Decimal? targetPrice,
    @NullableDecimalConverter() @JsonKey(name: 'stop_loss') Decimal? stopLoss,
    @NullableDecimalConverter() @JsonKey(name: 'risk_reward_ratio') Decimal? riskRewardRatio,
    @NullableDecimalConverter() Decimal? probability,
    @Default([]) List<String> reasoning,
    required String disclaimer,
  }) = _IntradaySignalDto;

  factory IntradaySignalDto.fromJson(Map<String, dynamic> json) => _$IntradaySignalDtoFromJson(json);
}
