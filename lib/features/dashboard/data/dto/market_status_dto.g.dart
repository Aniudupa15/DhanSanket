// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketStatusDto _$MarketStatusDtoFromJson(Map<String, dynamic> json) =>
    _MarketStatusDto(
      market: json['market'] as String,
      status: json['status'] as String,
      asOf: json['as_of'] as String,
    );

Map<String, dynamic> _$MarketStatusDtoToJson(_MarketStatusDto instance) =>
    <String, dynamic>{
      'market': instance.market,
      'status': instance.status,
      'as_of': instance.asOf,
    };
