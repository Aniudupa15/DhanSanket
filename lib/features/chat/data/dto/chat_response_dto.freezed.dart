// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatResponseDto {

 ChatIntentDto get intent; String get answer;
/// Create a copy of ChatResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatResponseDtoCopyWith<ChatResponseDto> get copyWith => _$ChatResponseDtoCopyWithImpl<ChatResponseDto>(this as ChatResponseDto, _$identity);

  /// Serializes this ChatResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatResponseDto&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,intent,answer);

@override
String toString() {
  return 'ChatResponseDto(intent: $intent, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $ChatResponseDtoCopyWith<$Res>  {
  factory $ChatResponseDtoCopyWith(ChatResponseDto value, $Res Function(ChatResponseDto) _then) = _$ChatResponseDtoCopyWithImpl;
@useResult
$Res call({
 ChatIntentDto intent, String answer
});




}
/// @nodoc
class _$ChatResponseDtoCopyWithImpl<$Res>
    implements $ChatResponseDtoCopyWith<$Res> {
  _$ChatResponseDtoCopyWithImpl(this._self, this._then);

  final ChatResponseDto _self;
  final $Res Function(ChatResponseDto) _then;

/// Create a copy of ChatResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? intent = null,Object? answer = null,}) {
  return _then(_self.copyWith(
intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as ChatIntentDto,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatResponseDto].
extension ChatResponseDtoPatterns on ChatResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatIntentDto intent,  String answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatResponseDto() when $default != null:
return $default(_that.intent,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatIntentDto intent,  String answer)  $default,) {final _that = this;
switch (_that) {
case _ChatResponseDto():
return $default(_that.intent,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatIntentDto intent,  String answer)?  $default,) {final _that = this;
switch (_that) {
case _ChatResponseDto() when $default != null:
return $default(_that.intent,_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatResponseDto implements ChatResponseDto {
  const _ChatResponseDto({required this.intent, required this.answer});
  factory _ChatResponseDto.fromJson(Map<String, dynamic> json) => _$ChatResponseDtoFromJson(json);

@override final  ChatIntentDto intent;
@override final  String answer;

/// Create a copy of ChatResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatResponseDtoCopyWith<_ChatResponseDto> get copyWith => __$ChatResponseDtoCopyWithImpl<_ChatResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatResponseDto&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,intent,answer);

@override
String toString() {
  return 'ChatResponseDto(intent: $intent, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$ChatResponseDtoCopyWith<$Res> implements $ChatResponseDtoCopyWith<$Res> {
  factory _$ChatResponseDtoCopyWith(_ChatResponseDto value, $Res Function(_ChatResponseDto) _then) = __$ChatResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 ChatIntentDto intent, String answer
});




}
/// @nodoc
class __$ChatResponseDtoCopyWithImpl<$Res>
    implements _$ChatResponseDtoCopyWith<$Res> {
  __$ChatResponseDtoCopyWithImpl(this._self, this._then);

  final _ChatResponseDto _self;
  final $Res Function(_ChatResponseDto) _then;

/// Create a copy of ChatResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? intent = null,Object? answer = null,}) {
  return _then(_ChatResponseDto(
intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as ChatIntentDto,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
