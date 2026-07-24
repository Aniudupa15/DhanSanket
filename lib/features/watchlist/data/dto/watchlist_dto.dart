import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_dto.freezed.dart';
part 'watchlist_dto.g.dart';

@freezed
abstract class WatchlistDto with _$WatchlistDto {
  const factory WatchlistDto({
    required String id,
    required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'item_count') required int itemCount,
  }) = _WatchlistDto;

  factory WatchlistDto.fromJson(Map<String, dynamic> json) => _$WatchlistDtoFromJson(json);
}
