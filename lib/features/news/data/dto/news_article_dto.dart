import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article_dto.freezed.dart';
part 'news_article_dto.g.dart';

enum NewsCategoryDto {
  @JsonValue('MARKET')
  market,
  @JsonValue('COMPANY')
  company,
  @JsonValue('ECONOMY')
  economy,
  @JsonValue('REGULATION')
  regulation,
  @JsonValue('SECTOR')
  sector,
}

@freezed
abstract class NewsArticleDto with _$NewsArticleDto {
  const factory NewsArticleDto({
    required String headline,
    String? summary,
    required String source,
    required String url,
    required NewsCategoryDto category,
    @JsonKey(name: 'related_symbols') required List<String> relatedSymbols,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
  }) = _NewsArticleDto;

  factory NewsArticleDto.fromJson(Map<String, dynamic> json) => _$NewsArticleDtoFromJson(json);
}
