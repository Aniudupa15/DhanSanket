// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stoch_rsi_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StochRsiDto {

@NullableDecimalConverter() Decimal? get k;@NullableDecimalConverter() Decimal? get d;
/// Create a copy of StochRsiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StochRsiDtoCopyWith<StochRsiDto> get copyWith => _$StochRsiDtoCopyWithImpl<StochRsiDto>(this as StochRsiDto, _$identity);

  /// Serializes this StochRsiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StochRsiDto&&(identical(other.k, k) || other.k == k)&&(identical(other.d, d) || other.d == d));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,k,d);

@override
String toString() {
  return 'StochRsiDto(k: $k, d: $d)';
}


}

/// @nodoc
abstract mixin class $StochRsiDtoCopyWith<$Res>  {
  factory $StochRsiDtoCopyWith(StochRsiDto value, $Res Function(StochRsiDto) _then) = _$StochRsiDtoCopyWithImpl;
@useResult
$Res call({
@NullableDecimalConverter() Decimal? k,@NullableDecimalConverter() Decimal? d
});




}
/// @nodoc
class _$StochRsiDtoCopyWithImpl<$Res>
    implements $StochRsiDtoCopyWith<$Res> {
  _$StochRsiDtoCopyWithImpl(this._self, this._then);

  final StochRsiDto _self;
  final $Res Function(StochRsiDto) _then;

/// Create a copy of StochRsiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? k = freezed,Object? d = freezed,}) {
  return _then(_self.copyWith(
k: freezed == k ? _self.k : k // ignore: cast_nullable_to_non_nullable
as Decimal?,d: freezed == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [StochRsiDto].
extension StochRsiDtoPatterns on StochRsiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StochRsiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StochRsiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StochRsiDto value)  $default,){
final _that = this;
switch (_that) {
case _StochRsiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StochRsiDto value)?  $default,){
final _that = this;
switch (_that) {
case _StochRsiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@NullableDecimalConverter()  Decimal? k, @NullableDecimalConverter()  Decimal? d)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StochRsiDto() when $default != null:
return $default(_that.k,_that.d);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@NullableDecimalConverter()  Decimal? k, @NullableDecimalConverter()  Decimal? d)  $default,) {final _that = this;
switch (_that) {
case _StochRsiDto():
return $default(_that.k,_that.d);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@NullableDecimalConverter()  Decimal? k, @NullableDecimalConverter()  Decimal? d)?  $default,) {final _that = this;
switch (_that) {
case _StochRsiDto() when $default != null:
return $default(_that.k,_that.d);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StochRsiDto implements StochRsiDto {
  const _StochRsiDto({@NullableDecimalConverter() this.k, @NullableDecimalConverter() this.d});
  factory _StochRsiDto.fromJson(Map<String, dynamic> json) => _$StochRsiDtoFromJson(json);

@override@NullableDecimalConverter() final  Decimal? k;
@override@NullableDecimalConverter() final  Decimal? d;

/// Create a copy of StochRsiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StochRsiDtoCopyWith<_StochRsiDto> get copyWith => __$StochRsiDtoCopyWithImpl<_StochRsiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StochRsiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StochRsiDto&&(identical(other.k, k) || other.k == k)&&(identical(other.d, d) || other.d == d));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,k,d);

@override
String toString() {
  return 'StochRsiDto(k: $k, d: $d)';
}


}

/// @nodoc
abstract mixin class _$StochRsiDtoCopyWith<$Res> implements $StochRsiDtoCopyWith<$Res> {
  factory _$StochRsiDtoCopyWith(_StochRsiDto value, $Res Function(_StochRsiDto) _then) = __$StochRsiDtoCopyWithImpl;
@override @useResult
$Res call({
@NullableDecimalConverter() Decimal? k,@NullableDecimalConverter() Decimal? d
});




}
/// @nodoc
class __$StochRsiDtoCopyWithImpl<$Res>
    implements _$StochRsiDtoCopyWith<$Res> {
  __$StochRsiDtoCopyWithImpl(this._self, this._then);

  final _StochRsiDto _self;
  final $Res Function(_StochRsiDto) _then;

/// Create a copy of StochRsiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? k = freezed,Object? d = freezed,}) {
  return _then(_StochRsiDto(
k: freezed == k ? _self.k : k // ignore: cast_nullable_to_non_nullable
as Decimal?,d: freezed == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}


}

// dart format on
