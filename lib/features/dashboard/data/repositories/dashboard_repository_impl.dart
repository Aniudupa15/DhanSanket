import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/dashboard_snapshot.dart';
import '../../domain/entities/index_quote.dart';
import '../../domain/entities/market_mover.dart';
import '../../domain/entities/market_status.dart';
import '../../domain/entities/news_article.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_data_source.dart';
import '../dto/dashboard_dto.dart';
import '../dto/index_quote_dto.dart';
import '../dto/market_mover_dto.dart';
import '../dto/market_status_dto.dart';
import '../dto/news_article_dto.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource _remote;

  DashboardRepositoryImpl(this._remote);

  @override
  Future<Result<DashboardSnapshot>> getDashboard() async {
    try {
      final dto = await _remote.getDashboard();
      return Success(_toEntity(dto));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  DashboardSnapshot _toEntity(DashboardDto dto) {
    return DashboardSnapshot(
      marketStatus: dto.marketStatus.map(_statusToEntity).toList(),
      indices: dto.indices.map(_indexToEntity).toList(),
      gainers: dto.gainers.map(_moverToEntity).toList(),
      losers: dto.losers.map(_moverToEntity).toList(),
      mostActive: dto.mostActive.map(_moverToEntity).toList(),
      fiftyTwoWeekHigh: dto.fiftyTwoWeekHigh.map(_moverToEntity).toList(),
      fiftyTwoWeekLow: dto.fiftyTwoWeekLow.map(_moverToEntity).toList(),
      latestNews: dto.latestNews.map(_newsToEntity).toList(),
      notes: dto.notes,
    );
  }

  MarketStatus _statusToEntity(MarketStatusDto dto) {
    return MarketStatus(market: dto.market, status: dto.status, asOf: dto.asOf);
  }

  IndexQuote _indexToEntity(IndexQuoteDto dto) {
    return IndexQuote(indexName: dto.indexName, lastPrice: dto.lastPrice, change: dto.change, changePercent: dto.changePercent);
  }

  MarketMover _moverToEntity(MarketMoverDto dto) {
    return MarketMover(
      symbol: dto.symbol,
      name: dto.name,
      lastPrice: dto.lastPrice,
      change: dto.change,
      changePercent: dto.changePercent,
      volume: dto.volume,
    );
  }

  NewsArticle _newsToEntity(NewsArticleDto dto) {
    return NewsArticle(
      headline: dto.headline,
      summary: dto.summary,
      source: dto.source,
      url: dto.url,
      category: _categoryToEntity(dto.category),
      relatedSymbols: dto.relatedSymbols,
      publishedAt: dto.publishedAt,
    );
  }

  NewsCategory _categoryToEntity(NewsCategoryDto dto) {
    return switch (dto) {
      NewsCategoryDto.market => NewsCategory.market,
      NewsCategoryDto.company => NewsCategory.company,
      NewsCategoryDto.economy => NewsCategory.economy,
      NewsCategoryDto.regulation => NewsCategory.regulation,
      NewsCategoryDto.sector => NewsCategory.sector,
    };
  }
}
