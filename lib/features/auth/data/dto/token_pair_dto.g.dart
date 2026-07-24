// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_pair_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenPairDto _$TokenPairDtoFromJson(Map<String, dynamic> json) => _TokenPairDto(
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  tokenType: json['token_type'] as String,
);

Map<String, dynamic> _$TokenPairDtoToJson(_TokenPairDto instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'token_type': instance.tokenType,
};
