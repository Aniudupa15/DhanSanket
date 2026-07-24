import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_response_dto.freezed.dart';
part 'chat_response_dto.g.dart';

enum ChatIntentDto {
  @JsonValue('portfolio_summary')
  portfolioSummary,
  @JsonValue('stock_quote')
  stockQuote,
  @JsonValue('indicator_summary')
  indicatorSummary,
  @JsonValue('watchlist_summary')
  watchlistSummary,
  @JsonValue('alerts_summary')
  alertsSummary,
  @JsonValue('unknown')
  unknown,
}

@freezed
abstract class ChatResponseDto with _$ChatResponseDto {
  const factory ChatResponseDto({required ChatIntentDto intent, required String answer}) = _ChatResponseDto;

  factory ChatResponseDto.fromJson(Map<String, dynamic> json) => _$ChatResponseDtoFromJson(json);
}
