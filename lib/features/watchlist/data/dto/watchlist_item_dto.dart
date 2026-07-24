import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/decimal_json_converter.dart';

part 'watchlist_item_dto.freezed.dart';
part 'watchlist_item_dto.g.dart';

@freezed
abstract class WatchlistItemDto with _$WatchlistItemDto {
  const factory WatchlistItemDto({
    required String symbol,
    required String name,
    @JsonKey(name: 'added_at') required DateTime addedAt,
    @NullableDecimalConverter() @JsonKey(name: 'last_price') Decimal? lastPrice,
    @NullableDecimalConverter() Decimal? change,
    @NullableDecimalConverter() @JsonKey(name: 'change_percent') Decimal? changePercent,
  }) = _WatchlistItemDto;

  factory WatchlistItemDto.fromJson(Map<String, dynamic> json) => _$WatchlistItemDtoFromJson(json);
}
