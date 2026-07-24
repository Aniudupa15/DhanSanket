// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_news_article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockNewsArticleDto _$StockNewsArticleDtoFromJson(Map<String, dynamic> json) =>
    _StockNewsArticleDto(
      headline: json['headline'] as String,
      summary: json['summary'] as String?,
      source: json['source'] as String,
      url: json['url'] as String,
      category: $enumDecode(_$StockNewsCategoryDtoEnumMap, json['category']),
      relatedSymbols: (json['related_symbols'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      publishedAt: DateTime.parse(json['published_at'] as String),
    );

Map<String, dynamic> _$StockNewsArticleDtoToJson(
  _StockNewsArticleDto instance,
) => <String, dynamic>{
  'headline': instance.headline,
  'summary': instance.summary,
  'source': instance.source,
  'url': instance.url,
  'category': _$StockNewsCategoryDtoEnumMap[instance.category]!,
  'related_symbols': instance.relatedSymbols,
  'published_at': instance.publishedAt.toIso8601String(),
};

const _$StockNewsCategoryDtoEnumMap = {
  StockNewsCategoryDto.market: 'MARKET',
  StockNewsCategoryDto.company: 'COMPANY',
  StockNewsCategoryDto.economy: 'ECONOMY',
  StockNewsCategoryDto.regulation: 'REGULATION',
  StockNewsCategoryDto.sector: 'SECTOR',
};
