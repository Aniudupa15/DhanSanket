// lib/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../models/comparison_model.dart';
import '../models/market_model.dart';
import '../models/prediction_model.dart';
import '../models/portfolio_model.dart';
import '../models/utility_model.dart';
import '../models/watchlist_model.dart';

class ApiService {
  final String baseUrl = API_BASE_URL;

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      try {
        final errorJson = json.decode(response.body);
        final detail = errorJson['detail'] ?? 'Unknown server error.';
        throw Exception('API Error ${response.statusCode}: $detail');
      } catch (e) {
        throw Exception('Failed to communicate with API. Status: ${response.statusCode}');
      }
    }
  }

  // --- Market Data Endpoints ---

  Future<MarketOverviewModel> fetchMarketOverview() async {
    final response = await http.get(Uri.parse('$baseUrl/market/overview'));
    final data = _handleResponse(response);
    return MarketOverviewModel.fromJson(data);
  }

  Future<List<StockSummaryModel>> fetchTopGainers({int limit = 10}) async {
    final response = await http.get(Uri.parse('$baseUrl/market/gainers?limit=$limit'));
    final data = _handleResponse(response);
    return (data as List).map((json) => StockSummaryModel.fromJson(json)).toList();
  }

  Future<List<StockSummaryModel>> fetchTopLosers({int limit = 10}) async {
    final response = await http.get(Uri.parse('$baseUrl/market/losers?limit=$limit'));
    final data = _handleResponse(response);
    return (data as List).map((json) => StockSummaryModel.fromJson(json)).toList();
  }

  // --- Market Status Endpoint ---
  Future<MarketStatusModel> fetchMarketStatus() async {
    final response = await http.get(Uri.parse('$baseUrl/market/status'));
    final data = _handleResponse(response);
    return MarketStatusModel.fromJson(data);
  }

  // --- Market Holidays Endpoint ---
  Future<List<MarketHolidayModel>> fetchMarketHolidays({int days = 90}) async {
    final response = await http.get(Uri.parse('$baseUrl/market/holidays?days=$days'));
    final data = _handleResponse(response);
    final holidaysList = data['upcoming_holidays'] as List;
    return holidaysList.map((json) => MarketHolidayModel.fromJson(json)).toList();
  }

  // --- Prediction Endpoint ---

  Future<PredictionModel> fetchPrediction(String ticker) async {
    final response = await http.post(
      Uri.parse('$baseUrl/predict'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'ticker': ticker}),
    );
    final data = _handleResponse(response);
    return PredictionModel.fromJson(data);
  }

  // --- Stock Comparison Endpoint ---

  Future<List<StockComparisonModel>> compareStocks(List<String> tickers) async {
    // Build query parameters for the compare endpoint
    final queryParams = tickers.map((t) => 'tickers=$t').join('&');

    final response = await http.post(
      Uri.parse('$baseUrl/compare?$queryParams'),
      headers: {'Content-Type': 'application/json'},
    );
    final data = _handleResponse(response);
    return (data as List).map((json) => StockComparisonModel.fromJson(json)).toList();
  }

  // --- Portfolio Endpoints ---

  Future<PortfolioValueModel> fetchPortfolioValue() async {
    final response = await http.get(Uri.parse('$baseUrl/portfolio/value'));
    final data = _handleResponse(response);
    return PortfolioValueModel.fromJson(data);
  }

  Future<void> addHolding({
    required String ticker,
    required int quantity,
    required double buyPrice,
    String? notes,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/portfolio/add'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'ticker': ticker,
        'quantity': quantity,
        'buy_price': buyPrice,
        if (notes != null) 'notes': notes,
      }),
    );
    _handleResponse(response);
  }

  Future<void> sellPortfolioHolding({
    required String ticker,
    required int quantity,
    required double sellPrice,
    String? notes,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/portfolio/sell'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'ticker': ticker,
        'quantity': quantity,
        'sell_price': sellPrice,
        if (notes != null) 'notes': notes,
      }),
    );
    _handleResponse(response);
  }

  // --- Watchlist Endpoints ---

  Future<List<WatchlistItemModel>> fetchWatchlist() async {
    final response = await http.get(Uri.parse('$baseUrl/watchlist'));
    final data = _handleResponse(response);
    return (data['watchlist'] as List).map((json) => WatchlistItemModel.fromJson(json)).toList();
  }

  Future<void> addToWatchlist({
    required String ticker,
    double? targetPrice,
    String? notes,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/watchlist/add'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'ticker': ticker,
        if (targetPrice != null) 'target_price': targetPrice,
        if (notes != null) 'notes': notes,
      }),
    );
    _handleResponse(response);
  }

  Future<void> removeFromWatchlist(String ticker) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/watchlist/$ticker'),
      headers: {'Content-Type': 'application/json'},
    );
    _handleResponse(response);
  }

  // --- Reminders Endpoints ---

  Future<List<ReminderModel>> fetchReminders({String? reminderStatus}) async {
    String url = '$baseUrl/reminders';
    if (reminderStatus != null) {
      url += '?reminder_status=$reminderStatus';
    }

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    final data = _handleResponse(response);
    return (data['reminders'] as List)
        .map((json) => ReminderModel.fromJson(json))
        .toList();
  }

  Future<void> createReminder({
    required String title,
    required String message,
    required String reminderTime,
    String reminderType = 'GENERAL',
    String? ticker,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reminders'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': title,
        'message': message,
        'reminder_time': reminderTime,
        'reminder_type': reminderType,
        if (ticker != null && ticker.isNotEmpty) 'ticker': ticker,
      }),
    );
    _handleResponse(response);
  }

  // --- Email Endpoints ---
  Future<void> emailPortfolioSummary(String toEmail) async {
    final response = await http.post(
      Uri.parse('$baseUrl/email/portfolio-summary?to_email=$toEmail'),
      headers: {'Content-Type': 'application/json'},
    );
    _handleResponse(response);
  }
}