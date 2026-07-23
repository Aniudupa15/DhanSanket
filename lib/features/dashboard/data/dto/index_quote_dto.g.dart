// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_quote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IndexQuoteDto _$IndexQuoteDtoFromJson(Map<String, dynamic> json) =>
    _IndexQuoteDto(
      indexName: json['index_name'] as String,
      lastPrice: const DecimalConverter().fromJson(
        json['last_price'] as String,
      ),
      change: const DecimalConverter().fromJson(json['change'] as String),
      changePercent: const DecimalConverter().fromJson(
        json['change_percent'] as String,
      ),
    );

Map<String, dynamic> _$IndexQuoteDtoToJson(_IndexQuoteDto instance) =>
    <String, dynamic>{
      'index_name': instance.indexName,
      'last_price': const DecimalConverter().toJson(instance.lastPrice),
      'change': const DecimalConverter().toJson(instance.change),
      'change_percent': const DecimalConverter().toJson(instance.changePercent),
    };
