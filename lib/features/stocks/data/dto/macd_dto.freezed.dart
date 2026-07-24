// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'macd_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MacdDto {

@NullableDecimalConverter() Decimal? get macd;@NullableDecimalConverter() Decimal? get signal;@NullableDecimalConverter() Decimal? get histogram;
/// Create a copy of MacdDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MacdDtoCopyWith<MacdDto> get copyWith => _$MacdDtoCopyWithImpl<MacdDto>(this as MacdDto, _$identity);

  /// Serializes this MacdDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MacdDto&&(identical(other.macd, macd) || other.macd == macd)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.histogram, histogram) || other.histogram == histogram));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,macd,signal,histogram);

@override
String toString() {
  return 'MacdDto(macd: $macd, signal: $signal, histogram: $histogram)';
}


}

/// @nodoc
abstract mixin class $MacdDtoCopyWith<$Res>  {
  factory $MacdDtoCopyWith(MacdDto value, $Res Function(MacdDto) _then) = _$MacdDtoCopyWithImpl;
@useResult
$Res call({
@NullableDecimalConverter() Decimal? macd,@NullableDecimalConverter() Decimal? signal,@NullableDecimalConverter() Decimal? histogram
});




}
/// @nodoc
class _$MacdDtoCopyWithImpl<$Res>
    implements $MacdDtoCopyWith<$Res> {
  _$MacdDtoCopyWithImpl(this._self, this._then);

  final MacdDto _self;
  final $Res Function(MacdDto) _then;

/// Create a copy of MacdDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? macd = freezed,Object? signal = freezed,Object? histogram = freezed,}) {
  return _then(_self.copyWith(
macd: freezed == macd ? _self.macd : macd // ignore: cast_nullable_to_non_nullable
as Decimal?,signal: freezed == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as Decimal?,histogram: freezed == histogram ? _self.histogram : histogram // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [MacdDto].
extension MacdDtoPatterns on MacdDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MacdDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MacdDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MacdDto value)  $default,){
final _that = this;
switch (_that) {
case _MacdDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MacdDto value)?  $default,){
final _that = this;
switch (_that) {
case _MacdDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@NullableDecimalConverter()  Decimal? macd, @NullableDecimalConverter()  Decimal? signal, @NullableDecimalConverter()  Decimal? histogram)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MacdDto() when $default != null:
return $default(_that.macd,_that.signal,_that.histogram);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@NullableDecimalConverter()  Decimal? macd, @NullableDecimalConverter()  Decimal? signal, @NullableDecimalConverter()  Decimal? histogram)  $default,) {final _that = this;
switch (_that) {
case _MacdDto():
return $default(_that.macd,_that.signal,_that.histogram);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@NullableDecimalConverter()  Decimal? macd, @NullableDecimalConverter()  Decimal? signal, @NullableDecimalConverter()  Decimal? histogram)?  $default,) {final _that = this;
switch (_that) {
case _MacdDto() when $default != null:
return $default(_that.macd,_that.signal,_that.histogram);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MacdDto implements MacdDto {
  const _MacdDto({@NullableDecimalConverter() this.macd, @NullableDecimalConverter() this.signal, @NullableDecimalConverter() this.histogram});
  factory _MacdDto.fromJson(Map<String, dynamic> json) => _$MacdDtoFromJson(json);

@override@NullableDecimalConverter() final  Decimal? macd;
@override@NullableDecimalConverter() final  Decimal? signal;
@override@NullableDecimalConverter() final  Decimal? histogram;

/// Create a copy of MacdDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MacdDtoCopyWith<_MacdDto> get copyWith => __$MacdDtoCopyWithImpl<_MacdDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MacdDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MacdDto&&(identical(other.macd, macd) || other.macd == macd)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.histogram, histogram) || other.histogram == histogram));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,macd,signal,histogram);

@override
String toString() {
  return 'MacdDto(macd: $macd, signal: $signal, histogram: $histogram)';
}


}

/// @nodoc
abstract mixin class _$MacdDtoCopyWith<$Res> implements $MacdDtoCopyWith<$Res> {
  factory _$MacdDtoCopyWith(_MacdDto value, $Res Function(_MacdDto) _then) = __$MacdDtoCopyWithImpl;
@override @useResult
$Res call({
@NullableDecimalConverter() Decimal? macd,@NullableDecimalConverter() Decimal? signal,@NullableDecimalConverter() Decimal? histogram
});




}
/// @nodoc
class __$MacdDtoCopyWithImpl<$Res>
    implements _$MacdDtoCopyWith<$Res> {
  __$MacdDtoCopyWithImpl(this._self, this._then);

  final _MacdDto _self;
  final $Res Function(_MacdDto) _then;

/// Create a copy of MacdDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? macd = freezed,Object? signal = freezed,Object? histogram = freezed,}) {
  return _then(_MacdDto(
macd: freezed == macd ? _self.macd : macd // ignore: cast_nullable_to_non_nullable
as Decimal?,signal: freezed == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as Decimal?,histogram: freezed == histogram ? _self.histogram : histogram // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}


}

// dart format on
