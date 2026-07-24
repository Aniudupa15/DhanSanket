// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuoteDto {

@DecimalConverter()@JsonKey(name: 'last_price') Decimal get lastPrice;@DecimalConverter() Decimal get change;@DecimalConverter()@JsonKey(name: 'change_percent') Decimal get changePercent;@DecimalConverter() Decimal get open;@DecimalConverter() Decimal get high;@DecimalConverter() Decimal get low;@DecimalConverter()@JsonKey(name: 'previous_close') Decimal get previousClose; int get volume;@JsonKey(name: 'as_of') DateTime get asOf;
/// Create a copy of QuoteDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteDtoCopyWith<QuoteDto> get copyWith => _$QuoteDtoCopyWithImpl<QuoteDto>(this as QuoteDto, _$identity);

  /// Serializes this QuoteDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteDto&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.open, open) || other.open == open)&&(identical(other.high, high) || other.high == high)&&(identical(other.low, low) || other.low == low)&&(identical(other.previousClose, previousClose) || other.previousClose == previousClose)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.asOf, asOf) || other.asOf == asOf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastPrice,change,changePercent,open,high,low,previousClose,volume,asOf);

@override
String toString() {
  return 'QuoteDto(lastPrice: $lastPrice, change: $change, changePercent: $changePercent, open: $open, high: $high, low: $low, previousClose: $previousClose, volume: $volume, asOf: $asOf)';
}


}

/// @nodoc
abstract mixin class $QuoteDtoCopyWith<$Res>  {
  factory $QuoteDtoCopyWith(QuoteDto value, $Res Function(QuoteDto) _then) = _$QuoteDtoCopyWithImpl;
@useResult
$Res call({
@DecimalConverter()@JsonKey(name: 'last_price') Decimal lastPrice,@DecimalConverter() Decimal change,@DecimalConverter()@JsonKey(name: 'change_percent') Decimal changePercent,@DecimalConverter() Decimal open,@DecimalConverter() Decimal high,@DecimalConverter() Decimal low,@DecimalConverter()@JsonKey(name: 'previous_close') Decimal previousClose, int volume,@JsonKey(name: 'as_of') DateTime asOf
});




}
/// @nodoc
class _$QuoteDtoCopyWithImpl<$Res>
    implements $QuoteDtoCopyWith<$Res> {
  _$QuoteDtoCopyWithImpl(this._self, this._then);

  final QuoteDto _self;
  final $Res Function(QuoteDto) _then;

/// Create a copy of QuoteDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastPrice = null,Object? change = null,Object? changePercent = null,Object? open = null,Object? high = null,Object? low = null,Object? previousClose = null,Object? volume = null,Object? asOf = null,}) {
  return _then(_self.copyWith(
lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as Decimal,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as Decimal,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as Decimal,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as Decimal,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as Decimal,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as Decimal,previousClose: null == previousClose ? _self.previousClose : previousClose // ignore: cast_nullable_to_non_nullable
as Decimal,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteDto].
extension QuoteDtoPatterns on QuoteDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteDto value)  $default,){
final _that = this;
switch (_that) {
case _QuoteDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteDto value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @DecimalConverter()  Decimal change, @DecimalConverter()@JsonKey(name: 'change_percent')  Decimal changePercent, @DecimalConverter()  Decimal open, @DecimalConverter()  Decimal high, @DecimalConverter()  Decimal low, @DecimalConverter()@JsonKey(name: 'previous_close')  Decimal previousClose,  int volume, @JsonKey(name: 'as_of')  DateTime asOf)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteDto() when $default != null:
return $default(_that.lastPrice,_that.change,_that.changePercent,_that.open,_that.high,_that.low,_that.previousClose,_that.volume,_that.asOf);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @DecimalConverter()  Decimal change, @DecimalConverter()@JsonKey(name: 'change_percent')  Decimal changePercent, @DecimalConverter()  Decimal open, @DecimalConverter()  Decimal high, @DecimalConverter()  Decimal low, @DecimalConverter()@JsonKey(name: 'previous_close')  Decimal previousClose,  int volume, @JsonKey(name: 'as_of')  DateTime asOf)  $default,) {final _that = this;
switch (_that) {
case _QuoteDto():
return $default(_that.lastPrice,_that.change,_that.changePercent,_that.open,_that.high,_that.low,_that.previousClose,_that.volume,_that.asOf);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @DecimalConverter()  Decimal change, @DecimalConverter()@JsonKey(name: 'change_percent')  Decimal changePercent, @DecimalConverter()  Decimal open, @DecimalConverter()  Decimal high, @DecimalConverter()  Decimal low, @DecimalConverter()@JsonKey(name: 'previous_close')  Decimal previousClose,  int volume, @JsonKey(name: 'as_of')  DateTime asOf)?  $default,) {final _that = this;
switch (_that) {
case _QuoteDto() when $default != null:
return $default(_that.lastPrice,_that.change,_that.changePercent,_that.open,_that.high,_that.low,_that.previousClose,_that.volume,_that.asOf);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteDto implements QuoteDto {
  const _QuoteDto({@DecimalConverter()@JsonKey(name: 'last_price') required this.lastPrice, @DecimalConverter() required this.change, @DecimalConverter()@JsonKey(name: 'change_percent') required this.changePercent, @DecimalConverter() required this.open, @DecimalConverter() required this.high, @DecimalConverter() required this.low, @DecimalConverter()@JsonKey(name: 'previous_close') required this.previousClose, required this.volume, @JsonKey(name: 'as_of') required this.asOf});
  factory _QuoteDto.fromJson(Map<String, dynamic> json) => _$QuoteDtoFromJson(json);

@override@DecimalConverter()@JsonKey(name: 'last_price') final  Decimal lastPrice;
@override@DecimalConverter() final  Decimal change;
@override@DecimalConverter()@JsonKey(name: 'change_percent') final  Decimal changePercent;
@override@DecimalConverter() final  Decimal open;
@override@DecimalConverter() final  Decimal high;
@override@DecimalConverter() final  Decimal low;
@override@DecimalConverter()@JsonKey(name: 'previous_close') final  Decimal previousClose;
@override final  int volume;
@override@JsonKey(name: 'as_of') final  DateTime asOf;

/// Create a copy of QuoteDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteDtoCopyWith<_QuoteDto> get copyWith => __$QuoteDtoCopyWithImpl<_QuoteDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteDto&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.open, open) || other.open == open)&&(identical(other.high, high) || other.high == high)&&(identical(other.low, low) || other.low == low)&&(identical(other.previousClose, previousClose) || other.previousClose == previousClose)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.asOf, asOf) || other.asOf == asOf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastPrice,change,changePercent,open,high,low,previousClose,volume,asOf);

@override
String toString() {
  return 'QuoteDto(lastPrice: $lastPrice, change: $change, changePercent: $changePercent, open: $open, high: $high, low: $low, previousClose: $previousClose, volume: $volume, asOf: $asOf)';
}


}

/// @nodoc
abstract mixin class _$QuoteDtoCopyWith<$Res> implements $QuoteDtoCopyWith<$Res> {
  factory _$QuoteDtoCopyWith(_QuoteDto value, $Res Function(_QuoteDto) _then) = __$QuoteDtoCopyWithImpl;
@override @useResult
$Res call({
@DecimalConverter()@JsonKey(name: 'last_price') Decimal lastPrice,@DecimalConverter() Decimal change,@DecimalConverter()@JsonKey(name: 'change_percent') Decimal changePercent,@DecimalConverter() Decimal open,@DecimalConverter() Decimal high,@DecimalConverter() Decimal low,@DecimalConverter()@JsonKey(name: 'previous_close') Decimal previousClose, int volume,@JsonKey(name: 'as_of') DateTime asOf
});




}
/// @nodoc
class __$QuoteDtoCopyWithImpl<$Res>
    implements _$QuoteDtoCopyWith<$Res> {
  __$QuoteDtoCopyWithImpl(this._self, this._then);

  final _QuoteDto _self;
  final $Res Function(_QuoteDto) _then;

/// Create a copy of QuoteDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastPrice = null,Object? change = null,Object? changePercent = null,Object? open = null,Object? high = null,Object? low = null,Object? previousClose = null,Object? volume = null,Object? asOf = null,}) {
  return _then(_QuoteDto(
lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as Decimal,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as Decimal,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as Decimal,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as Decimal,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as Decimal,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as Decimal,previousClose: null == previousClose ? _self.previousClose : previousClose // ignore: cast_nullable_to_non_nullable
as Decimal,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
