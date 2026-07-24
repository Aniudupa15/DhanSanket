// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ohlcv_bar_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OhlcvBarDto {

@JsonKey(name: 'trade_date') DateTime get tradeDate;@DecimalConverter() Decimal get open;@DecimalConverter() Decimal get high;@DecimalConverter() Decimal get low;@DecimalConverter() Decimal get close; int get volume;
/// Create a copy of OhlcvBarDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OhlcvBarDtoCopyWith<OhlcvBarDto> get copyWith => _$OhlcvBarDtoCopyWithImpl<OhlcvBarDto>(this as OhlcvBarDto, _$identity);

  /// Serializes this OhlcvBarDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OhlcvBarDto&&(identical(other.tradeDate, tradeDate) || other.tradeDate == tradeDate)&&(identical(other.open, open) || other.open == open)&&(identical(other.high, high) || other.high == high)&&(identical(other.low, low) || other.low == low)&&(identical(other.close, close) || other.close == close)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tradeDate,open,high,low,close,volume);

@override
String toString() {
  return 'OhlcvBarDto(tradeDate: $tradeDate, open: $open, high: $high, low: $low, close: $close, volume: $volume)';
}


}

/// @nodoc
abstract mixin class $OhlcvBarDtoCopyWith<$Res>  {
  factory $OhlcvBarDtoCopyWith(OhlcvBarDto value, $Res Function(OhlcvBarDto) _then) = _$OhlcvBarDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'trade_date') DateTime tradeDate,@DecimalConverter() Decimal open,@DecimalConverter() Decimal high,@DecimalConverter() Decimal low,@DecimalConverter() Decimal close, int volume
});




}
/// @nodoc
class _$OhlcvBarDtoCopyWithImpl<$Res>
    implements $OhlcvBarDtoCopyWith<$Res> {
  _$OhlcvBarDtoCopyWithImpl(this._self, this._then);

  final OhlcvBarDto _self;
  final $Res Function(OhlcvBarDto) _then;

/// Create a copy of OhlcvBarDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tradeDate = null,Object? open = null,Object? high = null,Object? low = null,Object? close = null,Object? volume = null,}) {
  return _then(_self.copyWith(
tradeDate: null == tradeDate ? _self.tradeDate : tradeDate // ignore: cast_nullable_to_non_nullable
as DateTime,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as Decimal,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as Decimal,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as Decimal,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as Decimal,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OhlcvBarDto].
extension OhlcvBarDtoPatterns on OhlcvBarDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OhlcvBarDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OhlcvBarDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OhlcvBarDto value)  $default,){
final _that = this;
switch (_that) {
case _OhlcvBarDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OhlcvBarDto value)?  $default,){
final _that = this;
switch (_that) {
case _OhlcvBarDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'trade_date')  DateTime tradeDate, @DecimalConverter()  Decimal open, @DecimalConverter()  Decimal high, @DecimalConverter()  Decimal low, @DecimalConverter()  Decimal close,  int volume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OhlcvBarDto() when $default != null:
return $default(_that.tradeDate,_that.open,_that.high,_that.low,_that.close,_that.volume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'trade_date')  DateTime tradeDate, @DecimalConverter()  Decimal open, @DecimalConverter()  Decimal high, @DecimalConverter()  Decimal low, @DecimalConverter()  Decimal close,  int volume)  $default,) {final _that = this;
switch (_that) {
case _OhlcvBarDto():
return $default(_that.tradeDate,_that.open,_that.high,_that.low,_that.close,_that.volume);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'trade_date')  DateTime tradeDate, @DecimalConverter()  Decimal open, @DecimalConverter()  Decimal high, @DecimalConverter()  Decimal low, @DecimalConverter()  Decimal close,  int volume)?  $default,) {final _that = this;
switch (_that) {
case _OhlcvBarDto() when $default != null:
return $default(_that.tradeDate,_that.open,_that.high,_that.low,_that.close,_that.volume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OhlcvBarDto implements OhlcvBarDto {
  const _OhlcvBarDto({@JsonKey(name: 'trade_date') required this.tradeDate, @DecimalConverter() required this.open, @DecimalConverter() required this.high, @DecimalConverter() required this.low, @DecimalConverter() required this.close, required this.volume});
  factory _OhlcvBarDto.fromJson(Map<String, dynamic> json) => _$OhlcvBarDtoFromJson(json);

@override@JsonKey(name: 'trade_date') final  DateTime tradeDate;
@override@DecimalConverter() final  Decimal open;
@override@DecimalConverter() final  Decimal high;
@override@DecimalConverter() final  Decimal low;
@override@DecimalConverter() final  Decimal close;
@override final  int volume;

/// Create a copy of OhlcvBarDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OhlcvBarDtoCopyWith<_OhlcvBarDto> get copyWith => __$OhlcvBarDtoCopyWithImpl<_OhlcvBarDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OhlcvBarDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OhlcvBarDto&&(identical(other.tradeDate, tradeDate) || other.tradeDate == tradeDate)&&(identical(other.open, open) || other.open == open)&&(identical(other.high, high) || other.high == high)&&(identical(other.low, low) || other.low == low)&&(identical(other.close, close) || other.close == close)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tradeDate,open,high,low,close,volume);

@override
String toString() {
  return 'OhlcvBarDto(tradeDate: $tradeDate, open: $open, high: $high, low: $low, close: $close, volume: $volume)';
}


}

/// @nodoc
abstract mixin class _$OhlcvBarDtoCopyWith<$Res> implements $OhlcvBarDtoCopyWith<$Res> {
  factory _$OhlcvBarDtoCopyWith(_OhlcvBarDto value, $Res Function(_OhlcvBarDto) _then) = __$OhlcvBarDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'trade_date') DateTime tradeDate,@DecimalConverter() Decimal open,@DecimalConverter() Decimal high,@DecimalConverter() Decimal low,@DecimalConverter() Decimal close, int volume
});




}
/// @nodoc
class __$OhlcvBarDtoCopyWithImpl<$Res>
    implements _$OhlcvBarDtoCopyWith<$Res> {
  __$OhlcvBarDtoCopyWithImpl(this._self, this._then);

  final _OhlcvBarDto _self;
  final $Res Function(_OhlcvBarDto) _then;

/// Create a copy of OhlcvBarDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tradeDate = null,Object? open = null,Object? high = null,Object? low = null,Object? close = null,Object? volume = null,}) {
  return _then(_OhlcvBarDto(
tradeDate: null == tradeDate ? _self.tradeDate : tradeDate // ignore: cast_nullable_to_non_nullable
as DateTime,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as Decimal,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as Decimal,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as Decimal,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as Decimal,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
