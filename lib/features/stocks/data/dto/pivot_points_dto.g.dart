// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pivot_points_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PivotPointsDto _$PivotPointsDtoFromJson(Map<String, dynamic> json) =>
    _PivotPointsDto(
      pivot: const DecimalConverter().fromJson(json['pivot'] as String),
      r1: const DecimalConverter().fromJson(json['r1'] as String),
      r2: const DecimalConverter().fromJson(json['r2'] as String),
      r3: const DecimalConverter().fromJson(json['r3'] as String),
      s1: const DecimalConverter().fromJson(json['s1'] as String),
      s2: const DecimalConverter().fromJson(json['s2'] as String),
      s3: const DecimalConverter().fromJson(json['s3'] as String),
    );

Map<String, dynamic> _$PivotPointsDtoToJson(_PivotPointsDto instance) =>
    <String, dynamic>{
      'pivot': const DecimalConverter().toJson(instance.pivot),
      'r1': const DecimalConverter().toJson(instance.r1),
      'r2': const DecimalConverter().toJson(instance.r2),
      'r3': const DecimalConverter().toJson(instance.r3),
      's1': const DecimalConverter().toJson(instance.s1),
      's2': const DecimalConverter().toJson(instance.s2),
      's3': const DecimalConverter().toJson(instance.s3),
    };
