// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioDetailDto _$PortfolioDetailDtoFromJson(Map<String, dynamic> json) =>
    _PortfolioDetailDto(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      holdings: (json['holdings'] as List<dynamic>)
          .map((e) => HoldingDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PortfolioDetailDtoToJson(_PortfolioDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'holdings': instance.holdings,
    };
