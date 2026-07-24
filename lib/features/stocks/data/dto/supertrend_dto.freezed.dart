// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supertrend_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupertrendDto {

@NullableDecimalConverter() Decimal? get value; int? get direction;
/// Create a copy of SupertrendDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupertrendDtoCopyWith<SupertrendDto> get copyWith => _$SupertrendDtoCopyWithImpl<SupertrendDto>(this as SupertrendDto, _$identity);

  /// Serializes this SupertrendDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupertrendDto&&(identical(other.value, value) || other.value == value)&&(identical(other.direction, direction) || other.direction == direction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,direction);

@override
String toString() {
  return 'SupertrendDto(value: $value, direction: $direction)';
}


}

/// @nodoc
abstract mixin class $SupertrendDtoCopyWith<$Res>  {
  factory $SupertrendDtoCopyWith(SupertrendDto value, $Res Function(SupertrendDto) _then) = _$SupertrendDtoCopyWithImpl;
@useResult
$Res call({
@NullableDecimalConverter() Decimal? value, int? direction
});




}
/// @nodoc
class _$SupertrendDtoCopyWithImpl<$Res>
    implements $SupertrendDtoCopyWith<$Res> {
  _$SupertrendDtoCopyWithImpl(this._self, this._then);

  final SupertrendDto _self;
  final $Res Function(SupertrendDto) _then;

/// Create a copy of SupertrendDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = freezed,Object? direction = freezed,}) {
  return _then(_self.copyWith(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Decimal?,direction: freezed == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupertrendDto].
extension SupertrendDtoPatterns on SupertrendDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupertrendDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupertrendDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupertrendDto value)  $default,){
final _that = this;
switch (_that) {
case _SupertrendDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupertrendDto value)?  $default,){
final _that = this;
switch (_that) {
case _SupertrendDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@NullableDecimalConverter()  Decimal? value,  int? direction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupertrendDto() when $default != null:
return $default(_that.value,_that.direction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@NullableDecimalConverter()  Decimal? value,  int? direction)  $default,) {final _that = this;
switch (_that) {
case _SupertrendDto():
return $default(_that.value,_that.direction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@NullableDecimalConverter()  Decimal? value,  int? direction)?  $default,) {final _that = this;
switch (_that) {
case _SupertrendDto() when $default != null:
return $default(_that.value,_that.direction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupertrendDto implements SupertrendDto {
  const _SupertrendDto({@NullableDecimalConverter() this.value, this.direction});
  factory _SupertrendDto.fromJson(Map<String, dynamic> json) => _$SupertrendDtoFromJson(json);

@override@NullableDecimalConverter() final  Decimal? value;
@override final  int? direction;

/// Create a copy of SupertrendDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupertrendDtoCopyWith<_SupertrendDto> get copyWith => __$SupertrendDtoCopyWithImpl<_SupertrendDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupertrendDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupertrendDto&&(identical(other.value, value) || other.value == value)&&(identical(other.direction, direction) || other.direction == direction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,direction);

@override
String toString() {
  return 'SupertrendDto(value: $value, direction: $direction)';
}


}

/// @nodoc
abstract mixin class _$SupertrendDtoCopyWith<$Res> implements $SupertrendDtoCopyWith<$Res> {
  factory _$SupertrendDtoCopyWith(_SupertrendDto value, $Res Function(_SupertrendDto) _then) = __$SupertrendDtoCopyWithImpl;
@override @useResult
$Res call({
@NullableDecimalConverter() Decimal? value, int? direction
});




}
/// @nodoc
class __$SupertrendDtoCopyWithImpl<$Res>
    implements _$SupertrendDtoCopyWith<$Res> {
  __$SupertrendDtoCopyWithImpl(this._self, this._then);

  final _SupertrendDto _self;
  final $Res Function(_SupertrendDto) _then;

/// Create a copy of SupertrendDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? direction = freezed,}) {
  return _then(_SupertrendDto(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Decimal?,direction: freezed == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
