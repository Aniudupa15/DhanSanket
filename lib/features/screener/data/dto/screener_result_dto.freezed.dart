// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screener_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScreenerResultDto {

 String get symbol; String get name;@JsonKey(name: 'as_of') DateTime get asOf;@DecimalConverter() Decimal get close; int get volume;@NullableDecimalConverter()@JsonKey(name: 'rsi_14') Decimal? get rsi14;@NullableDecimalConverter()@JsonKey(name: 'sma_50') Decimal? get sma50;@NullableDecimalConverter()@JsonKey(name: 'sma_200') Decimal? get sma200;
/// Create a copy of ScreenerResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScreenerResultDtoCopyWith<ScreenerResultDto> get copyWith => _$ScreenerResultDtoCopyWithImpl<ScreenerResultDto>(this as ScreenerResultDto, _$identity);

  /// Serializes this ScreenerResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenerResultDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.close, close) || other.close == close)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.rsi14, rsi14) || other.rsi14 == rsi14)&&(identical(other.sma50, sma50) || other.sma50 == sma50)&&(identical(other.sma200, sma200) || other.sma200 == sma200));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,asOf,close,volume,rsi14,sma50,sma200);

@override
String toString() {
  return 'ScreenerResultDto(symbol: $symbol, name: $name, asOf: $asOf, close: $close, volume: $volume, rsi14: $rsi14, sma50: $sma50, sma200: $sma200)';
}


}

/// @nodoc
abstract mixin class $ScreenerResultDtoCopyWith<$Res>  {
  factory $ScreenerResultDtoCopyWith(ScreenerResultDto value, $Res Function(ScreenerResultDto) _then) = _$ScreenerResultDtoCopyWithImpl;
@useResult
$Res call({
 String symbol, String name,@JsonKey(name: 'as_of') DateTime asOf,@DecimalConverter() Decimal close, int volume,@NullableDecimalConverter()@JsonKey(name: 'rsi_14') Decimal? rsi14,@NullableDecimalConverter()@JsonKey(name: 'sma_50') Decimal? sma50,@NullableDecimalConverter()@JsonKey(name: 'sma_200') Decimal? sma200
});




}
/// @nodoc
class _$ScreenerResultDtoCopyWithImpl<$Res>
    implements $ScreenerResultDtoCopyWith<$Res> {
  _$ScreenerResultDtoCopyWithImpl(this._self, this._then);

  final ScreenerResultDto _self;
  final $Res Function(ScreenerResultDto) _then;

/// Create a copy of ScreenerResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? asOf = null,Object? close = null,Object? volume = null,Object? rsi14 = freezed,Object? sma50 = freezed,Object? sma200 = freezed,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as Decimal,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,rsi14: freezed == rsi14 ? _self.rsi14 : rsi14 // ignore: cast_nullable_to_non_nullable
as Decimal?,sma50: freezed == sma50 ? _self.sma50 : sma50 // ignore: cast_nullable_to_non_nullable
as Decimal?,sma200: freezed == sma200 ? _self.sma200 : sma200 // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScreenerResultDto].
extension ScreenerResultDtoPatterns on ScreenerResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScreenerResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScreenerResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScreenerResultDto value)  $default,){
final _that = this;
switch (_that) {
case _ScreenerResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScreenerResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _ScreenerResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name, @JsonKey(name: 'as_of')  DateTime asOf, @DecimalConverter()  Decimal close,  int volume, @NullableDecimalConverter()@JsonKey(name: 'rsi_14')  Decimal? rsi14, @NullableDecimalConverter()@JsonKey(name: 'sma_50')  Decimal? sma50, @NullableDecimalConverter()@JsonKey(name: 'sma_200')  Decimal? sma200)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScreenerResultDto() when $default != null:
return $default(_that.symbol,_that.name,_that.asOf,_that.close,_that.volume,_that.rsi14,_that.sma50,_that.sma200);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name, @JsonKey(name: 'as_of')  DateTime asOf, @DecimalConverter()  Decimal close,  int volume, @NullableDecimalConverter()@JsonKey(name: 'rsi_14')  Decimal? rsi14, @NullableDecimalConverter()@JsonKey(name: 'sma_50')  Decimal? sma50, @NullableDecimalConverter()@JsonKey(name: 'sma_200')  Decimal? sma200)  $default,) {final _that = this;
switch (_that) {
case _ScreenerResultDto():
return $default(_that.symbol,_that.name,_that.asOf,_that.close,_that.volume,_that.rsi14,_that.sma50,_that.sma200);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name, @JsonKey(name: 'as_of')  DateTime asOf, @DecimalConverter()  Decimal close,  int volume, @NullableDecimalConverter()@JsonKey(name: 'rsi_14')  Decimal? rsi14, @NullableDecimalConverter()@JsonKey(name: 'sma_50')  Decimal? sma50, @NullableDecimalConverter()@JsonKey(name: 'sma_200')  Decimal? sma200)?  $default,) {final _that = this;
switch (_that) {
case _ScreenerResultDto() when $default != null:
return $default(_that.symbol,_that.name,_that.asOf,_that.close,_that.volume,_that.rsi14,_that.sma50,_that.sma200);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScreenerResultDto implements ScreenerResultDto {
  const _ScreenerResultDto({required this.symbol, required this.name, @JsonKey(name: 'as_of') required this.asOf, @DecimalConverter() required this.close, required this.volume, @NullableDecimalConverter()@JsonKey(name: 'rsi_14') this.rsi14, @NullableDecimalConverter()@JsonKey(name: 'sma_50') this.sma50, @NullableDecimalConverter()@JsonKey(name: 'sma_200') this.sma200});
  factory _ScreenerResultDto.fromJson(Map<String, dynamic> json) => _$ScreenerResultDtoFromJson(json);

@override final  String symbol;
@override final  String name;
@override@JsonKey(name: 'as_of') final  DateTime asOf;
@override@DecimalConverter() final  Decimal close;
@override final  int volume;
@override@NullableDecimalConverter()@JsonKey(name: 'rsi_14') final  Decimal? rsi14;
@override@NullableDecimalConverter()@JsonKey(name: 'sma_50') final  Decimal? sma50;
@override@NullableDecimalConverter()@JsonKey(name: 'sma_200') final  Decimal? sma200;

/// Create a copy of ScreenerResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScreenerResultDtoCopyWith<_ScreenerResultDto> get copyWith => __$ScreenerResultDtoCopyWithImpl<_ScreenerResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScreenerResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScreenerResultDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.close, close) || other.close == close)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.rsi14, rsi14) || other.rsi14 == rsi14)&&(identical(other.sma50, sma50) || other.sma50 == sma50)&&(identical(other.sma200, sma200) || other.sma200 == sma200));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,asOf,close,volume,rsi14,sma50,sma200);

@override
String toString() {
  return 'ScreenerResultDto(symbol: $symbol, name: $name, asOf: $asOf, close: $close, volume: $volume, rsi14: $rsi14, sma50: $sma50, sma200: $sma200)';
}


}

/// @nodoc
abstract mixin class _$ScreenerResultDtoCopyWith<$Res> implements $ScreenerResultDtoCopyWith<$Res> {
  factory _$ScreenerResultDtoCopyWith(_ScreenerResultDto value, $Res Function(_ScreenerResultDto) _then) = __$ScreenerResultDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name,@JsonKey(name: 'as_of') DateTime asOf,@DecimalConverter() Decimal close, int volume,@NullableDecimalConverter()@JsonKey(name: 'rsi_14') Decimal? rsi14,@NullableDecimalConverter()@JsonKey(name: 'sma_50') Decimal? sma50,@NullableDecimalConverter()@JsonKey(name: 'sma_200') Decimal? sma200
});




}
/// @nodoc
class __$ScreenerResultDtoCopyWithImpl<$Res>
    implements _$ScreenerResultDtoCopyWith<$Res> {
  __$ScreenerResultDtoCopyWithImpl(this._self, this._then);

  final _ScreenerResultDto _self;
  final $Res Function(_ScreenerResultDto) _then;

/// Create a copy of ScreenerResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? asOf = null,Object? close = null,Object? volume = null,Object? rsi14 = freezed,Object? sma50 = freezed,Object? sma200 = freezed,}) {
  return _then(_ScreenerResultDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as Decimal,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,rsi14: freezed == rsi14 ? _self.rsi14 : rsi14 // ignore: cast_nullable_to_non_nullable
as Decimal?,sma50: freezed == sma50 ? _self.sma50 : sma50 // ignore: cast_nullable_to_non_nullable
as Decimal?,sma200: freezed == sma200 ? _self.sma200 : sma200 // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}


}

// dart format on
