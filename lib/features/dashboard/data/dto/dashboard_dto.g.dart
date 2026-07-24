// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardDto _$DashboardDtoFromJson(Map<String, dynamic> json) => _DashboardDto(
  marketStatus: (json['market_status'] as List<dynamic>)
      .map((e) => MarketStatusDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  indices: (json['indices'] as List<dynamic>).map((e) => IndexQuoteDto.fromJson(e as Map<String, dynamic>)).toList(),
  gainers: (json['gainers'] as List<dynamic>).map((e) => MarketMoverDto.fromJson(e as Map<String, dynamic>)).toList(),
  losers: (json['losers'] as List<dynamic>).map((e) => MarketMoverDto.fromJson(e as Map<String, dynamic>)).toList(),
  mostActive: (json['most_active'] as List<dynamic>)
      .map((e) => MarketMoverDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  fiftyTwoWeekHigh: (json['fifty_two_week_high'] as List<dynamic>)
      .map((e) => MarketMoverDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  fiftyTwoWeekLow: (json['fifty_two_week_low'] as List<dynamic>)
      .map((e) => MarketMoverDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  latestNews: (json['latest_news'] as List<dynamic>)
      .map((e) => NewsArticleDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  notes: (json['notes'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$DashboardDtoToJson(_DashboardDto instance) => <String, dynamic>{
  'market_status': instance.marketStatus,
  'indices': instance.indices,
  'gainers': instance.gainers,
  'losers': instance.losers,
  'most_active': instance.mostActive,
  'fifty_two_week_high': instance.fiftyTwoWeekHigh,
  'fifty_two_week_low': instance.fiftyTwoWeekLow,
  'latest_news': instance.latestNews,
  'notes': instance.notes,
};
