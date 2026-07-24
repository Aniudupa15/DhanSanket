import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/corporate_action_dto.dart';
import '../dto/fundamentals_dto.dart';
import '../dto/history_dto.dart';
import '../dto/indicators_dto.dart';
import '../dto/intraday_signal_dto.dart';
import '../dto/long_term_signal_dto.dart';
import '../dto/search_history_entry_dto.dart';
import '../dto/stock_detail_dto.dart';
import '../dto/stock_news_article_dto.dart';
import '../dto/stock_search_result_dto.dart';

class StockRemoteDataSource {
  final Dio _dio;

  StockRemoteDataSource(this._dio);

  Future<List<StockSearchResultDto>> search(String query, {int limit = 20}) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.stockSearch,
      queryParameters: {'q': query, 'limit': limit},
    );
    return response.data!.map((e) => StockSearchResultDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<StockDetailDto> getDetail(String symbol) async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.stockDetail(symbol));
    return StockDetailDto.fromJson(response.data!);
  }

  Future<HistoryDto> getHistory(String symbol, {String range = '1Y'}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.stockHistory(symbol),
      queryParameters: {'range': range},
    );
    return HistoryDto.fromJson(response.data!);
  }

  Future<IndicatorsDto> getIndicators(String symbol) async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.stockIndicators(symbol));
    return IndicatorsDto.fromJson(response.data!);
  }

  Future<List<CorporateActionDto>> getCorporateActions(String symbol) async {
    final response = await _dio.get<List<dynamic>>(ApiEndpoints.stockCorporateActions(symbol));
    return response.data!.map((e) => CorporateActionDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<IntradaySignalDto> getIntradaySignal(String symbol) async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.stockIntradaySignal(symbol));
    return IntradaySignalDto.fromJson(response.data!);
  }

  Future<FundamentalsDto> getFundamentals(String symbol) async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.stockFundamentals(symbol));
    return FundamentalsDto.fromJson(response.data!);
  }

  Future<LongTermSignalDto> getLongTermSignal(String symbol) async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.stockLongTermSignal(symbol));
    return LongTermSignalDto.fromJson(response.data!);
  }

  Future<List<StockNewsArticleDto>> getNews(String symbol) async {
    final response = await _dio.get<List<dynamic>>(ApiEndpoints.stockNews(symbol));
    return response.data!.map((e) => StockNewsArticleDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<SearchHistoryEntryDto>> getSearchHistory() async {
    final response = await _dio.get<List<dynamic>>(ApiEndpoints.searchHistory);
    return response.data!.map((e) => SearchHistoryEntryDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> clearSearchHistory() => _dio.delete(ApiEndpoints.searchHistory);
}
