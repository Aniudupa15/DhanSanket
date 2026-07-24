// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryDto _$HistoryDtoFromJson(Map<String, dynamic> json) => _HistoryDto(
  symbol: json['symbol'] as String,
  range: json['range'] as String,
  bars: (json['bars'] as List<dynamic>)
      .map((e) => OhlcvBarDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HistoryDtoToJson(_HistoryDto instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'range': instance.range,
      'bars': instance.bars,
    };
