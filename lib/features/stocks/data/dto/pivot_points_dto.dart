import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'pivot_points_dto.freezed.dart';
part 'pivot_points_dto.g.dart';

@freezed
abstract class PivotPointsDto with _$PivotPointsDto {
  const factory PivotPointsDto({
    @DecimalConverter() required Decimal pivot,
    @DecimalConverter() required Decimal r1,
    @DecimalConverter() required Decimal r2,
    @DecimalConverter() required Decimal r3,
    @DecimalConverter() required Decimal s1,
    @DecimalConverter() required Decimal s2,
    @DecimalConverter() required Decimal s3,
  }) = _PivotPointsDto;

  factory PivotPointsDto.fromJson(Map<String, dynamic> json) => _$PivotPointsDtoFromJson(json);
}
