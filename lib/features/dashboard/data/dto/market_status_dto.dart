import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_status_dto.freezed.dart';
part 'market_status_dto.g.dart';

@freezed
abstract class MarketStatusDto with _$MarketStatusDto {
  const factory MarketStatusDto({
    required String market,
    required String status,
    @JsonKey(name: 'as_of') required String asOf,
  }) = _MarketStatusDto;

  factory MarketStatusDto.fromJson(Map<String, dynamic> json) => _$MarketStatusDtoFromJson(json);
}
