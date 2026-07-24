// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bollinger_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BollingerDto {

@NullableDecimalConverter() Decimal? get upper;@NullableDecimalConverter() Decimal? get middle;@NullableDecimalConverter() Decimal? get lower;
/// Create a copy of BollingerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BollingerDtoCopyWith<BollingerDto> get copyWith => _$BollingerDtoCopyWithImpl<BollingerDto>(this as BollingerDto, _$identity);

  /// Serializes this BollingerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BollingerDto&&(identical(other.upper, upper) || other.upper == upper)&&(identical(other.middle, middle) || other.middle == middle)&&(identical(other.lower, lower) || other.lower == lower));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,upper,middle,lower);

@override
String toString() {
  return 'BollingerDto(upper: $upper, middle: $middle, lower: $lower)';
}


}

/// @nodoc
abstract mixin class $BollingerDtoCopyWith<$Res>  {
  factory $BollingerDtoCopyWith(BollingerDto value, $Res Function(BollingerDto) _then) = _$BollingerDtoCopyWithImpl;
@useResult
$Res call({
@NullableDecimalConverter() Decimal? upper,@NullableDecimalConverter() Decimal? middle,@NullableDecimalConverter() Decimal? lower
});




}
/// @nodoc
class _$BollingerDtoCopyWithImpl<$Res>
    implements $BollingerDtoCopyWith<$Res> {
  _$BollingerDtoCopyWithImpl(this._self, this._then);

  final BollingerDto _self;
  final $Res Function(BollingerDto) _then;

/// Create a copy of BollingerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? upper = freezed,Object? middle = freezed,Object? lower = freezed,}) {
  return _then(_self.copyWith(
upper: freezed == upper ? _self.upper : upper // ignore: cast_nullable_to_non_nullable
as Decimal?,middle: freezed == middle ? _self.middle : middle // ignore: cast_nullable_to_non_nullable
as Decimal?,lower: freezed == lower ? _self.lower : lower // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [BollingerDto].
extension BollingerDtoPatterns on BollingerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BollingerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BollingerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BollingerDto value)  $default,){
final _that = this;
switch (_that) {
case _BollingerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BollingerDto value)?  $default,){
final _that = this;
switch (_that) {
case _BollingerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@NullableDecimalConverter()  Decimal? upper, @NullableDecimalConverter()  Decimal? middle, @NullableDecimalConverter()  Decimal? lower)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BollingerDto() when $default != null:
return $default(_that.upper,_that.middle,_that.lower);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@NullableDecimalConverter()  Decimal? upper, @NullableDecimalConverter()  Decimal? middle, @NullableDecimalConverter()  Decimal? lower)  $default,) {final _that = this;
switch (_that) {
case _BollingerDto():
return $default(_that.upper,_that.middle,_that.lower);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@NullableDecimalConverter()  Decimal? upper, @NullableDecimalConverter()  Decimal? middle, @NullableDecimalConverter()  Decimal? lower)?  $default,) {final _that = this;
switch (_that) {
case _BollingerDto() when $default != null:
return $default(_that.upper,_that.middle,_that.lower);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BollingerDto implements BollingerDto {
  const _BollingerDto({@NullableDecimalConverter() this.upper, @NullableDecimalConverter() this.middle, @NullableDecimalConverter() this.lower});
  factory _BollingerDto.fromJson(Map<String, dynamic> json) => _$BollingerDtoFromJson(json);

@override@NullableDecimalConverter() final  Decimal? upper;
@override@NullableDecimalConverter() final  Decimal? middle;
@override@NullableDecimalConverter() final  Decimal? lower;

/// Create a copy of BollingerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BollingerDtoCopyWith<_BollingerDto> get copyWith => __$BollingerDtoCopyWithImpl<_BollingerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BollingerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BollingerDto&&(identical(other.upper, upper) || other.upper == upper)&&(identical(other.middle, middle) || other.middle == middle)&&(identical(other.lower, lower) || other.lower == lower));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,upper,middle,lower);

@override
String toString() {
  return 'BollingerDto(upper: $upper, middle: $middle, lower: $lower)';
}


}

/// @nodoc
abstract mixin class _$BollingerDtoCopyWith<$Res> implements $BollingerDtoCopyWith<$Res> {
  factory _$BollingerDtoCopyWith(_BollingerDto value, $Res Function(_BollingerDto) _then) = __$BollingerDtoCopyWithImpl;
@override @useResult
$Res call({
@NullableDecimalConverter() Decimal? upper,@NullableDecimalConverter() Decimal? middle,@NullableDecimalConverter() Decimal? lower
});




}
/// @nodoc
class __$BollingerDtoCopyWithImpl<$Res>
    implements _$BollingerDtoCopyWith<$Res> {
  __$BollingerDtoCopyWithImpl(this._self, this._then);

  final _BollingerDto _self;
  final $Res Function(_BollingerDto) _then;

/// Create a copy of BollingerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? upper = freezed,Object? middle = freezed,Object? lower = freezed,}) {
  return _then(_BollingerDto(
upper: freezed == upper ? _self.upper : upper // ignore: cast_nullable_to_non_nullable
as Decimal?,middle: freezed == middle ? _self.middle : middle // ignore: cast_nullable_to_non_nullable
as Decimal?,lower: freezed == lower ? _self.lower : lower // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}


}

// dart format on
