// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockDetailDto _$StockDetailDtoFromJson(Map<String, dynamic> json) =>
    _StockDetailDto(
      symbol: json['symbol'] as String,
      isin: json['isin'] as String?,
      name: json['name'] as String,
      series: json['series'] as String?,
      sector: json['sector'] as String?,
      industry: json['industry'] as String?,
      instrumentType: $enumDecode(
        _$InstrumentTypeDtoEnumMap,
        json['instrument_type'],
      ),
      listingDate: json['listing_date'] == null
          ? null
          : DateTime.parse(json['listing_date'] as String),
      faceValue: const NullableDecimalConverter().fromJson(
        json['face_value'] as String?,
      ),
      quote: json['quote'] == null
          ? null
          : QuoteDto.fromJson(json['quote'] as Map<String, dynamic>),
      quoteUnavailableReason: json['quote_unavailable_reason'] as String?,
    );

Map<String, dynamic> _$StockDetailDtoToJson(_StockDetailDto instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'isin': instance.isin,
      'name': instance.name,
      'series': instance.series,
      'sector': instance.sector,
      'industry': instance.industry,
      'instrument_type': _$InstrumentTypeDtoEnumMap[instance.instrumentType]!,
      'listing_date': instance.listingDate?.toIso8601String(),
      'face_value': const NullableDecimalConverter().toJson(instance.faceValue),
      'quote': instance.quote,
      'quote_unavailable_reason': instance.quoteUnavailableReason,
    };

const _$InstrumentTypeDtoEnumMap = {
  InstrumentTypeDto.equity: 'EQUITY',
  InstrumentTypeDto.etf: 'ETF',
  InstrumentTypeDto.reit: 'REIT',
  InstrumentTypeDto.invit: 'INVIT',
};
