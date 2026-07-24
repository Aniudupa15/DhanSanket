import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'volume_profile_bin_dto.freezed.dart';
part 'volume_profile_bin_dto.g.dart';

@freezed
abstract class VolumeProfileBinDto with _$VolumeProfileBinDto {
  const factory VolumeProfileBinDto({
    @DecimalConverter() @JsonKey(name: 'price_low') required Decimal priceLow,
    @DecimalConverter() @JsonKey(name: 'price_high') required Decimal priceHigh,
    required int volume,
  }) = _VolumeProfileBinDto;

  factory VolumeProfileBinDto.fromJson(Map<String, dynamic> json) => _$VolumeProfileBinDtoFromJson(json);
}
