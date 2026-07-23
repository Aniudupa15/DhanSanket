// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_mover_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketMoverDto {

 String get symbol; String get name;@DecimalConverter()@JsonKey(name: 'last_price') Decimal get lastPrice;@NullableDecimalConverter() Decimal? get change;@NullableDecimalConverter()@JsonKey(name: 'change_percent') Decimal? get changePercent; int get volume;
/// Create a copy of MarketMoverDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketMoverDtoCopyWith<MarketMoverDto> get copyWith => _$MarketMoverDtoCopyWithImpl<MarketMoverDto>(this as MarketMoverDto, _$identity);

  /// Serializes this MarketMoverDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketMoverDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,lastPrice,change,changePercent,volume);

@override
String toString() {
  return 'MarketMoverDto(symbol: $symbol, name: $name, lastPrice: $lastPrice, change: $change, changePercent: $changePercent, volume: $volume)';
}


}

/// @nodoc
abstract mixin class $MarketMoverDtoCopyWith<$Res>  {
  factory $MarketMoverDtoCopyWith(MarketMoverDto value, $Res Function(MarketMoverDto) _then) = _$MarketMoverDtoCopyWithImpl;
@useResult
$Res call({
 String symbol, String name,@DecimalConverter()@JsonKey(name: 'last_price') Decimal lastPrice,@NullableDecimalConverter() Decimal? change,@NullableDecimalConverter()@JsonKey(name: 'change_percent') Decimal? changePercent, int volume
});




}
/// @nodoc
class _$MarketMoverDtoCopyWithImpl<$Res>
    implements $MarketMoverDtoCopyWith<$Res> {
  _$MarketMoverDtoCopyWithImpl(this._self, this._then);

  final MarketMoverDto _self;
  final $Res Function(MarketMoverDto) _then;

/// Create a copy of MarketMoverDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? lastPrice = null,Object? change = freezed,Object? changePercent = freezed,Object? volume = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as Decimal,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as Decimal?,changePercent: freezed == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as Decimal?,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketMoverDto].
extension MarketMoverDtoPatterns on MarketMoverDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketMoverDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketMoverDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketMoverDto value)  $default,){
final _that = this;
switch (_that) {
case _MarketMoverDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketMoverDto value)?  $default,){
final _that = this;
switch (_that) {
case _MarketMoverDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name, @DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @NullableDecimalConverter()  Decimal? change, @NullableDecimalConverter()@JsonKey(name: 'change_percent')  Decimal? changePercent,  int volume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketMoverDto() when $default != null:
return $default(_that.symbol,_that.name,_that.lastPrice,_that.change,_that.changePercent,_that.volume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name, @DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @NullableDecimalConverter()  Decimal? change, @NullableDecimalConverter()@JsonKey(name: 'change_percent')  Decimal? changePercent,  int volume)  $default,) {final _that = this;
switch (_that) {
case _MarketMoverDto():
return $default(_that.symbol,_that.name,_that.lastPrice,_that.change,_that.changePercent,_that.volume);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name, @DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @NullableDecimalConverter()  Decimal? change, @NullableDecimalConverter()@JsonKey(name: 'change_percent')  Decimal? changePercent,  int volume)?  $default,) {final _that = this;
switch (_that) {
case _MarketMoverDto() when $default != null:
return $default(_that.symbol,_that.name,_that.lastPrice,_that.change,_that.changePercent,_that.volume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketMoverDto implements MarketMoverDto {
  const _MarketMoverDto({required this.symbol, required this.name, @DecimalConverter()@JsonKey(name: 'last_price') required this.lastPrice, @NullableDecimalConverter() this.change, @NullableDecimalConverter()@JsonKey(name: 'change_percent') this.changePercent, required this.volume});
  factory _MarketMoverDto.fromJson(Map<String, dynamic> json) => _$MarketMoverDtoFromJson(json);

@override final  String symbol;
@override final  String name;
@override@DecimalConverter()@JsonKey(name: 'last_price') final  Decimal lastPrice;
@override@NullableDecimalConverter() final  Decimal? change;
@override@NullableDecimalConverter()@JsonKey(name: 'change_percent') final  Decimal? changePercent;
@override final  int volume;

/// Create a copy of MarketMoverDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketMoverDtoCopyWith<_MarketMoverDto> get copyWith => __$MarketMoverDtoCopyWithImpl<_MarketMoverDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketMoverDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketMoverDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,lastPrice,change,changePercent,volume);

@override
String toString() {
  return 'MarketMoverDto(symbol: $symbol, name: $name, lastPrice: $lastPrice, change: $change, changePercent: $changePercent, volume: $volume)';
}


}

/// @nodoc
abstract mixin class _$MarketMoverDtoCopyWith<$Res> implements $MarketMoverDtoCopyWith<$Res> {
  factory _$MarketMoverDtoCopyWith(_MarketMoverDto value, $Res Function(_MarketMoverDto) _then) = __$MarketMoverDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name,@DecimalConverter()@JsonKey(name: 'last_price') Decimal lastPrice,@NullableDecimalConverter() Decimal? change,@NullableDecimalConverter()@JsonKey(name: 'change_percent') Decimal? changePercent, int volume
});




}
/// @nodoc
class __$MarketMoverDtoCopyWithImpl<$Res>
    implements _$MarketMoverDtoCopyWith<$Res> {
  __$MarketMoverDtoCopyWithImpl(this._self, this._then);

  final _MarketMoverDto _self;
  final $Res Function(_MarketMoverDto) _then;

/// Create a copy of MarketMoverDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? lastPrice = null,Object? change = freezed,Object? changePercent = freezed,Object? volume = null,}) {
  return _then(_MarketMoverDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as Decimal,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as Decimal?,changePercent: freezed == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as Decimal?,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
