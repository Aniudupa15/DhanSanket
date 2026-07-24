// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchHistoryEntryDto _$SearchHistoryEntryDtoFromJson(Map<String, dynamic> json) =>
    _SearchHistoryEntryDto(query: json['query'] as String, searchedAt: DateTime.parse(json['searched_at'] as String));

Map<String, dynamic> _$SearchHistoryEntryDtoToJson(_SearchHistoryEntryDto instance) => <String, dynamic>{
  'query': instance.query,
  'searched_at': instance.searchedAt.toIso8601String(),
};
