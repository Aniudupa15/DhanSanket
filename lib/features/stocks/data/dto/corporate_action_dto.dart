import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'corporate_action_dto.freezed.dart';
part 'corporate_action_dto.g.dart';

@freezed
abstract class CorporateActionDto with _$CorporateActionDto {
  const factory CorporateActionDto({
    required String purpose,
    @NullableDecimalConverter() @JsonKey(name: 'face_value') Decimal? faceValue,
    @JsonKey(name: 'ex_date') DateTime? exDate,
    @JsonKey(name: 'record_date') DateTime? recordDate,
    @JsonKey(name: 'book_closure_start') DateTime? bookClosureStart,
    @JsonKey(name: 'book_closure_end') DateTime? bookClosureEnd,
  }) = _CorporateActionDto;

  factory CorporateActionDto.fromJson(Map<String, dynamic> json) => _$CorporateActionDtoFromJson(json);
}
