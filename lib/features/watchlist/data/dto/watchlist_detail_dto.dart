import 'package:freezed_annotation/freezed_annotation.dart';

import 'watchlist_item_dto.dart';

part 'watchlist_detail_dto.freezed.dart';
part 'watchlist_detail_dto.g.dart';

@freezed
abstract class WatchlistDetailDto with _$WatchlistDetailDto {
  const factory WatchlistDetailDto({
    required String id,
    required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required List<WatchlistItemDto> items,
  }) = _WatchlistDetailDto;

  factory WatchlistDetailDto.fromJson(Map<String, dynamic> json) => _$WatchlistDetailDtoFromJson(json);
}
