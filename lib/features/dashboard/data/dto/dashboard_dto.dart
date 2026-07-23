import 'package:freezed_annotation/freezed_annotation.dart';

import 'index_quote_dto.dart';
import 'market_mover_dto.dart';
import 'market_status_dto.dart';
import 'news_article_dto.dart';

part 'dashboard_dto.freezed.dart';
part 'dashboard_dto.g.dart';

@freezed
abstract class DashboardDto with _$DashboardDto {
  const factory DashboardDto({
    @JsonKey(name: 'market_status') required List<MarketStatusDto> marketStatus,
    required List<IndexQuoteDto> indices,
    required List<MarketMoverDto> gainers,
    required List<MarketMoverDto> losers,
    @JsonKey(name: 'most_active') required List<MarketMoverDto> mostActive,
    @JsonKey(name: 'fifty_two_week_high') required List<MarketMoverDto> fiftyTwoWeekHigh,
    @JsonKey(name: 'fifty_two_week_low') required List<MarketMoverDto> fiftyTwoWeekLow,
    @JsonKey(name: 'latest_news') required List<NewsArticleDto> latestNews,
    required List<String> notes,
  }) = _DashboardDto;

  factory DashboardDto.fromJson(Map<String, dynamic> json) => _$DashboardDtoFromJson(json);
}
