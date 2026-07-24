import 'package:dio/dio.dart';

import '../../../../core/entities/news_article.dart';
import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/corporate_action.dart';
import '../../domain/entities/fundamentals.dart';
import '../../domain/entities/indicators.dart';
import '../../domain/entities/intraday_signal.dart';
import '../../domain/entities/long_term_signal.dart';
import '../../domain/entities/ohlcv_bar.dart';
import '../../domain/entities/price_history.dart';
import '../../domain/entities/search_history_entry.dart';
import '../../domain/entities/stock_detail.dart';
import '../../domain/entities/stock_search_result.dart';
import '../../domain/repositories/stock_repository.dart';
import '../datasources/stock_remote_data_source.dart';
import '../dto/corporate_action_dto.dart';
import '../dto/ohlcv_bar_dto.dart';
import '../dto/search_history_entry_dto.dart';
import '../dto/stock_news_article_dto.dart';
import '../dto/stock_search_result_dto.dart';
import '../mappers/stock_dto_mappers.dart';

class StockRepositoryImpl implements StockRepository {
  final StockRemoteDataSource _remote;

  StockRepositoryImpl(this._remote);

  @override
  Future<Result<List<StockSearchResult>>> search(String query, {int limit = 20}) async {
    try {
      final dtos = await _remote.search(query, limit: limit);
      return Success(dtos.map(_searchResultToEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<StockDetail>> getDetail(String symbol) async {
    try {
      return Success(stockDetailToEntity(await _remote.getDetail(symbol)));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<PriceHistory>> getHistory(String symbol, {String range = '1Y'}) async {
    try {
      final dto = await _remote.getHistory(symbol, range: range);
      return Success(PriceHistory(symbol: dto.symbol, range: dto.range, bars: dto.bars.map(_barToEntity).toList()));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<Indicators>> getIndicators(String symbol) async {
    try {
      return Success(indicatorsToEntity(await _remote.getIndicators(symbol)));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<List<CorporateAction>>> getCorporateActions(String symbol) async {
    try {
      final dtos = await _remote.getCorporateActions(symbol);
      return Success(dtos.map(_corporateActionToEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<IntradaySignal>> getIntradaySignal(String symbol) async {
    try {
      final dto = await _remote.getIntradaySignal(symbol);
      return Success(
        IntradaySignal(
          symbol: dto.symbol,
          asOf: dto.asOf,
          hasData: dto.hasData,
          signal: dto.signal,
          confidence: dto.confidence,
          entryPrice: dto.entryPrice,
          targetPrice: dto.targetPrice,
          stopLoss: dto.stopLoss,
          riskRewardRatio: dto.riskRewardRatio,
          probability: dto.probability,
          reasoning: dto.reasoning,
          disclaimer: dto.disclaimer,
        ),
      );
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<Fundamentals>> getFundamentals(String symbol) async {
    try {
      return Success(fundamentalsToEntity(await _remote.getFundamentals(symbol)));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<LongTermSignal>> getLongTermSignal(String symbol) async {
    try {
      final dto = await _remote.getLongTermSignal(symbol);
      return Success(
        LongTermSignal(
          symbol: dto.symbol,
          hasData: dto.hasData,
          signal: dto.signal,
          confidence: dto.confidence,
          investmentHorizon: dto.investmentHorizon,
          riskLevel: dto.riskLevel,
          growthPotential: dto.growthPotential,
          strengths: dto.strengths,
          weaknesses: dto.weaknesses,
          opportunities: dto.opportunities,
          risks: dto.risks,
          reasoning: dto.reasoning,
          disclaimer: dto.disclaimer,
        ),
      );
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<List<NewsArticle>>> getNews(String symbol) async {
    try {
      final dtos = await _remote.getNews(symbol);
      return Success(dtos.map(_newsToEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<List<SearchHistoryEntry>>> getSearchHistory() async {
    try {
      final dtos = await _remote.getSearchHistory();
      return Success(dtos.map(_searchHistoryToEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> clearSearchHistory() async {
    try {
      await _remote.clearSearchHistory();
      return const Success(null);
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  // --- mapping helpers ---

  OhlcvBar _barToEntity(OhlcvBarDto dto) {
    return OhlcvBar(
      tradeDate: dto.tradeDate,
      open: dto.open,
      high: dto.high,
      low: dto.low,
      close: dto.close,
      volume: dto.volume,
    );
  }

  StockSearchResult _searchResultToEntity(StockSearchResultDto dto) {
    return StockSearchResult(
      symbol: dto.symbol,
      name: dto.name,
      isin: dto.isin,
      series: dto.series,
      instrumentType: instrumentTypeToEntity(dto.instrumentType),
    );
  }

  CorporateAction _corporateActionToEntity(CorporateActionDto dto) {
    return CorporateAction(
      purpose: dto.purpose,
      faceValue: dto.faceValue,
      exDate: dto.exDate,
      recordDate: dto.recordDate,
      bookClosureStart: dto.bookClosureStart,
      bookClosureEnd: dto.bookClosureEnd,
    );
  }

  NewsArticle _newsToEntity(StockNewsArticleDto dto) {
    return NewsArticle(
      headline: dto.headline,
      summary: dto.summary,
      source: dto.source,
      url: dto.url,
      category: _newsCategoryToEntity(dto.category),
      relatedSymbols: dto.relatedSymbols,
      publishedAt: dto.publishedAt,
    );
  }

  NewsCategory _newsCategoryToEntity(StockNewsCategoryDto dto) {
    return switch (dto) {
      StockNewsCategoryDto.market => NewsCategory.market,
      StockNewsCategoryDto.company => NewsCategory.company,
      StockNewsCategoryDto.economy => NewsCategory.economy,
      StockNewsCategoryDto.regulation => NewsCategory.regulation,
      StockNewsCategoryDto.sector => NewsCategory.sector,
    };
  }

  SearchHistoryEntry _searchHistoryToEntity(SearchHistoryEntryDto dto) {
    return SearchHistoryEntry(query: dto.query, searchedAt: dto.searchedAt);
  }
}
