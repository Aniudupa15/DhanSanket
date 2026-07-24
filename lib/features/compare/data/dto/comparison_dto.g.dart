// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparison_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComparisonEntryDto _$ComparisonEntryDtoFromJson(Map<String, dynamic> json) =>
    _ComparisonEntryDto(
      detail: StockDetailDto.fromJson(json['detail'] as Map<String, dynamic>),
      indicators: IndicatorsDto.fromJson(
        json['indicators'] as Map<String, dynamic>,
      ),
      fundamentals: FundamentalsDto.fromJson(
        json['fundamentals'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ComparisonEntryDtoToJson(_ComparisonEntryDto instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'indicators': instance.indicators,
      'fundamentals': instance.fundamentals,
    };

_ComparisonDto _$ComparisonDtoFromJson(Map<String, dynamic> json) =>
    _ComparisonDto(
      entries: (json['entries'] as List<dynamic>)
          .map((e) => ComparisonEntryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComparisonDtoToJson(_ComparisonDto instance) =>
    <String, dynamic>{'entries': instance.entries};
