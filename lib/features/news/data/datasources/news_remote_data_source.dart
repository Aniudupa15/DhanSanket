import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/news_article_dto.dart';

class NewsRemoteDataSource {
  final Dio _dio;

  NewsRemoteDataSource(this._dio);

  Future<List<NewsArticleDto>> getNews({
    NewsCategoryDto? category,
    String? symbol,
    required int limit,
    required int offset,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.news,
      queryParameters: {
        if (category != null) 'category': _categoryToQueryValue(category),
        if (symbol != null) 'symbol': symbol,
        'limit': limit,
        'offset': offset,
      },
    );
    return response.data!.map((e) => NewsArticleDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  String _categoryToQueryValue(NewsCategoryDto category) {
    return switch (category) {
      NewsCategoryDto.market => 'MARKET',
      NewsCategoryDto.company => 'COMPANY',
      NewsCategoryDto.economy => 'ECONOMY',
      NewsCategoryDto.regulation => 'REGULATION',
      NewsCategoryDto.sector => 'SECTOR',
    };
  }
}
