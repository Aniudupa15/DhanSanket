import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_news_article_dto.freezed.dart';
part 'stock_news_article_dto.g.dart';

/// Same shape as the Dashboard feature's NewsArticleDto - kept as its own
/// copy per-feature (each feature owns its data layer) even though the
/// mapped domain entity (core/entities/news_article.dart) is shared.
enum StockNewsCategoryDto {
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
abstract class StockNewsArticleDto with _$StockNewsArticleDto {
  const factory StockNewsArticleDto({
    required String headline,
    String? summary,
    required String source,
    required String url,
    required StockNewsCategoryDto category,
    @JsonKey(name: 'related_symbols') required List<String> relatedSymbols,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
  }) = _StockNewsArticleDto;

  factory StockNewsArticleDto.fromJson(Map<String, dynamic> json) => _$StockNewsArticleDtoFromJson(json);
}
