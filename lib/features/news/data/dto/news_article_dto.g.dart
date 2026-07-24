// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsArticleDto _$NewsArticleDtoFromJson(Map<String, dynamic> json) =>
    _NewsArticleDto(
      headline: json['headline'] as String,
      summary: json['summary'] as String?,
      source: json['source'] as String,
      url: json['url'] as String,
      category: $enumDecode(_$NewsCategoryDtoEnumMap, json['category']),
      relatedSymbols: (json['related_symbols'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      publishedAt: DateTime.parse(json['published_at'] as String),
    );

Map<String, dynamic> _$NewsArticleDtoToJson(_NewsArticleDto instance) =>
    <String, dynamic>{
      'headline': instance.headline,
      'summary': instance.summary,
      'source': instance.source,
      'url': instance.url,
      'category': _$NewsCategoryDtoEnumMap[instance.category]!,
      'related_symbols': instance.relatedSymbols,
      'published_at': instance.publishedAt.toIso8601String(),
    };

const _$NewsCategoryDtoEnumMap = {
  NewsCategoryDto.market: 'MARKET',
  NewsCategoryDto.company: 'COMPANY',
  NewsCategoryDto.economy: 'ECONOMY',
  NewsCategoryDto.regulation: 'REGULATION',
  NewsCategoryDto.sector: 'SECTOR',
};
