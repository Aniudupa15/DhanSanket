import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_dto.freezed.dart';
part 'alert_dto.g.dart';

enum AlertTypeDto {
  @JsonValue('PRICE_ABOVE')
  priceAbove,
  @JsonValue('PRICE_BELOW')
  priceBelow,
  @JsonValue('PERCENT_CHANGE_ABOVE')
  percentChangeAbove,
  @JsonValue('PERCENT_CHANGE_BELOW')
  percentChangeBelow,
  @JsonValue('RSI_ABOVE')
  rsiAbove,
  @JsonValue('RSI_BELOW')
  rsiBelow,
  @JsonValue('VOLUME_SPIKE')
  volumeSpike,
  @JsonValue('NEW_52_WEEK_HIGH')
  new52WeekHigh,
  @JsonValue('NEW_52_WEEK_LOW')
  new52WeekLow,
}

enum AlertStatusDto {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('TRIGGERED')
  triggered,
  @JsonValue('CANCELLED')
  cancelled,
}

@freezed
abstract class AlertDto with _$AlertDto {
  const factory AlertDto({
    required String id,
    required String symbol,
    @JsonKey(name: 'alert_type') required AlertTypeDto alertType,
    // Decimal values here ride whatever shape the backend serializes them as
    // (string or number) - parsed defensively in the repository mapper
    // rather than via a converter, since json_serializable converters apply
    // per-field, not per-map-value.
    required Map<String, dynamic> condition,
    required AlertStatusDto status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'triggered_at') DateTime? triggeredAt,
  }) = _AlertDto;

  factory AlertDto.fromJson(Map<String, dynamic> json) => _$AlertDtoFromJson(json);
}
