import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history_entry_dto.freezed.dart';
part 'search_history_entry_dto.g.dart';

@freezed
abstract class SearchHistoryEntryDto with _$SearchHistoryEntryDto {
  const factory SearchHistoryEntryDto({
    required String query,
    @JsonKey(name: 'searched_at') required DateTime searchedAt,
  }) = _SearchHistoryEntryDto;

  factory SearchHistoryEntryDto.fromJson(Map<String, dynamic> json) => _$SearchHistoryEntryDtoFromJson(json);
}
