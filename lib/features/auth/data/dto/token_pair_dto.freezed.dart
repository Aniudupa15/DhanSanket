// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_pair_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenPairDto {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'refresh_token') String get refreshToken;@JsonKey(name: 'token_type') String get tokenType;
/// Create a copy of TokenPairDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenPairDtoCopyWith<TokenPairDto> get copyWith => _$TokenPairDtoCopyWithImpl<TokenPairDto>(this as TokenPairDto, _$identity);

  /// Serializes this TokenPairDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenPairDto&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,tokenType);

@override
String toString() {
  return 'TokenPairDto(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class $TokenPairDtoCopyWith<$Res>  {
  factory $TokenPairDtoCopyWith(TokenPairDto value, $Res Function(TokenPairDto) _then) = _$TokenPairDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'token_type') String tokenType
});




}
/// @nodoc
class _$TokenPairDtoCopyWithImpl<$Res>
    implements $TokenPairDtoCopyWith<$Res> {
  _$TokenPairDtoCopyWithImpl(this._self, this._then);

  final TokenPairDto _self;
  final $Res Function(TokenPairDto) _then;

/// Create a copy of TokenPairDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? tokenType = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenPairDto].
extension TokenPairDtoPatterns on TokenPairDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenPairDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenPairDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenPairDto value)  $default,){
final _that = this;
switch (_that) {
case _TokenPairDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenPairDto value)?  $default,){
final _that = this;
switch (_that) {
case _TokenPairDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'token_type')  String tokenType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenPairDto() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.tokenType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'token_type')  String tokenType)  $default,) {final _that = this;
switch (_that) {
case _TokenPairDto():
return $default(_that.accessToken,_that.refreshToken,_that.tokenType);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'token_type')  String tokenType)?  $default,) {final _that = this;
switch (_that) {
case _TokenPairDto() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.tokenType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenPairDto implements TokenPairDto {
  const _TokenPairDto({@JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'refresh_token') required this.refreshToken, @JsonKey(name: 'token_type') required this.tokenType});
  factory _TokenPairDto.fromJson(Map<String, dynamic> json) => _$TokenPairDtoFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override@JsonKey(name: 'token_type') final  String tokenType;

/// Create a copy of TokenPairDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenPairDtoCopyWith<_TokenPairDto> get copyWith => __$TokenPairDtoCopyWithImpl<_TokenPairDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenPairDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenPairDto&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,tokenType);

@override
String toString() {
  return 'TokenPairDto(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class _$TokenPairDtoCopyWith<$Res> implements $TokenPairDtoCopyWith<$Res> {
  factory _$TokenPairDtoCopyWith(_TokenPairDto value, $Res Function(_TokenPairDto) _then) = __$TokenPairDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'token_type') String tokenType
});




}
/// @nodoc
class __$TokenPairDtoCopyWithImpl<$Res>
    implements _$TokenPairDtoCopyWith<$Res> {
  __$TokenPairDtoCopyWithImpl(this._self, this._then);

  final _TokenPairDto _self;
  final $Res Function(_TokenPairDto) _then;

/// Create a copy of TokenPairDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? tokenType = null,}) {
  return _then(_TokenPairDto(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
