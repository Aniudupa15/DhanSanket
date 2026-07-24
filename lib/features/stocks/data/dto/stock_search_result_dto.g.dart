// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_search_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockSearchResultDto _$StockSearchResultDtoFromJson(
  Map<String, dynamic> json,
) => _StockSearchResultDto(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  isin: json['isin'] as String?,
  series: json['series'] as String?,
  instrumentType: $enumDecode(
    _$InstrumentTypeDtoEnumMap,
    json['instrument_type'],
  ),
);

Map<String, dynamic> _$StockSearchResultDtoToJson(
  _StockSearchResultDto instance,
) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'isin': instance.isin,
  'series': instance.series,
  'instrument_type': _$InstrumentTypeDtoEnumMap[instance.instrumentType]!,
};

const _$InstrumentTypeDtoEnumMap = {
  InstrumentTypeDto.equity: 'EQUITY',
  InstrumentTypeDto.etf: 'ETF',
  InstrumentTypeDto.reit: 'REIT',
  InstrumentTypeDto.invit: 'INVIT',
};
