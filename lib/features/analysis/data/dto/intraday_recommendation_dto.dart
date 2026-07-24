import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'intraday_recommendation_dto.freezed.dart';
part 'intraday_recommendation_dto.g.dart';

@freezed
abstract class IntradayRecommendationDto with _$IntradayRecommendationDto {
  const factory IntradayRecommendationDto({
    required String symbol,
    required String name,
    @JsonKey(name: 'as_of') required DateTime asOf,
    required String signal,
    @DecimalConverter() required Decimal confidence,
    @NullableDecimalConverter() @JsonKey(name: 'entry_price') Decimal? entryPrice,
    @NullableDecimalConverter() @JsonKey(name: 'target_price') Decimal? targetPrice,
    @NullableDecimalConverter() @JsonKey(name: 'stop_loss') Decimal? stopLoss,
    @Default([]) List<String> reasoning,
  }) = _IntradayRecommendationDto;

  factory IntradayRecommendationDto.fromJson(Map<String, dynamic> json) => _$IntradayRecommendationDtoFromJson(json);
}
