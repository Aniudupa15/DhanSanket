// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatResponseDto _$ChatResponseDtoFromJson(Map<String, dynamic> json) =>
    _ChatResponseDto(intent: $enumDecode(_$ChatIntentDtoEnumMap, json['intent']), answer: json['answer'] as String);

Map<String, dynamic> _$ChatResponseDtoToJson(_ChatResponseDto instance) => <String, dynamic>{
  'intent': _$ChatIntentDtoEnumMap[instance.intent]!,
  'answer': instance.answer,
};

const _$ChatIntentDtoEnumMap = {
  ChatIntentDto.portfolioSummary: 'portfolio_summary',
  ChatIntentDto.stockQuote: 'stock_quote',
  ChatIntentDto.indicatorSummary: 'indicator_summary',
  ChatIntentDto.watchlistSummary: 'watchlist_summary',
  ChatIntentDto.alertsSummary: 'alerts_summary',
  ChatIntentDto.unknown: 'unknown',
};
