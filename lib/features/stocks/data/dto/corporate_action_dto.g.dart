// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corporate_action_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CorporateActionDto _$CorporateActionDtoFromJson(Map<String, dynamic> json) => _CorporateActionDto(
  purpose: json['purpose'] as String,
  faceValue: const NullableDecimalConverter().fromJson(json['face_value'] as String?),
  exDate: json['ex_date'] == null ? null : DateTime.parse(json['ex_date'] as String),
  recordDate: json['record_date'] == null ? null : DateTime.parse(json['record_date'] as String),
  bookClosureStart: json['book_closure_start'] == null ? null : DateTime.parse(json['book_closure_start'] as String),
  bookClosureEnd: json['book_closure_end'] == null ? null : DateTime.parse(json['book_closure_end'] as String),
);

Map<String, dynamic> _$CorporateActionDtoToJson(_CorporateActionDto instance) => <String, dynamic>{
  'purpose': instance.purpose,
  'face_value': const NullableDecimalConverter().toJson(instance.faceValue),
  'ex_date': instance.exDate?.toIso8601String(),
  'record_date': instance.recordDate?.toIso8601String(),
  'book_closure_start': instance.bookClosureStart?.toIso8601String(),
  'book_closure_end': instance.bookClosureEnd?.toIso8601String(),
};
