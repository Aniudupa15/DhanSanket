// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioDto _$PortfolioDtoFromJson(Map<String, dynamic> json) =>
    _PortfolioDto(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PortfolioDtoToJson(_PortfolioDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
    };
