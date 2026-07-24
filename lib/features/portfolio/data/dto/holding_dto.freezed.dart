// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holding_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HoldingDto {

 String get symbol;@DecimalConverter() Decimal get quantity;@DecimalConverter()@JsonKey(name: 'avg_price') Decimal get avgPrice;@DecimalConverter()@JsonKey(name: 'cost_basis') Decimal get costBasis;@NullableDecimalConverter()@JsonKey(name: 'current_price') Decimal? get currentPrice;@NullableDecimalConverter()@JsonKey(name: 'current_value') Decimal? get currentValue;@NullableDecimalConverter() Decimal? get pnl;@NullableDecimalConverter()@JsonKey(name: 'pnl_percent') Decimal? get pnlPercent;
/// Create a copy of HoldingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoldingDtoCopyWith<HoldingDto> get copyWith => _$HoldingDtoCopyWithImpl<HoldingDto>(this as HoldingDto, _$identity);

  /// Serializes this HoldingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoldingDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.avgPrice, avgPrice) || other.avgPrice == avgPrice)&&(identical(other.costBasis, costBasis) || other.costBasis == costBasis)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.pnl, pnl) || other.pnl == pnl)&&(identical(other.pnlPercent, pnlPercent) || other.pnlPercent == pnlPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,quantity,avgPrice,costBasis,currentPrice,currentValue,pnl,pnlPercent);

@override
String toString() {
  return 'HoldingDto(symbol: $symbol, quantity: $quantity, avgPrice: $avgPrice, costBasis: $costBasis, currentPrice: $currentPrice, currentValue: $currentValue, pnl: $pnl, pnlPercent: $pnlPercent)';
}


}

/// @nodoc
abstract mixin class $HoldingDtoCopyWith<$Res>  {
  factory $HoldingDtoCopyWith(HoldingDto value, $Res Function(HoldingDto) _then) = _$HoldingDtoCopyWithImpl;
@useResult
$Res call({
 String symbol,@DecimalConverter() Decimal quantity,@DecimalConverter()@JsonKey(name: 'avg_price') Decimal avgPrice,@DecimalConverter()@JsonKey(name: 'cost_basis') Decimal costBasis,@NullableDecimalConverter()@JsonKey(name: 'current_price') Decimal? currentPrice,@NullableDecimalConverter()@JsonKey(name: 'current_value') Decimal? currentValue,@NullableDecimalConverter() Decimal? pnl,@NullableDecimalConverter()@JsonKey(name: 'pnl_percent') Decimal? pnlPercent
});




}
/// @nodoc
class _$HoldingDtoCopyWithImpl<$Res>
    implements $HoldingDtoCopyWith<$Res> {
  _$HoldingDtoCopyWithImpl(this._self, this._then);

  final HoldingDto _self;
  final $Res Function(HoldingDto) _then;

/// Create a copy of HoldingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? quantity = null,Object? avgPrice = null,Object? costBasis = null,Object? currentPrice = freezed,Object? currentValue = freezed,Object? pnl = freezed,Object? pnlPercent = freezed,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as Decimal,avgPrice: null == avgPrice ? _self.avgPrice : avgPrice // ignore: cast_nullable_to_non_nullable
as Decimal,costBasis: null == costBasis ? _self.costBasis : costBasis // ignore: cast_nullable_to_non_nullable
as Decimal,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as Decimal?,pnl: freezed == pnl ? _self.pnl : pnl // ignore: cast_nullable_to_non_nullable
as Decimal?,pnlPercent: freezed == pnlPercent ? _self.pnlPercent : pnlPercent // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [HoldingDto].
extension HoldingDtoPatterns on HoldingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HoldingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HoldingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HoldingDto value)  $default,){
final _that = this;
switch (_that) {
case _HoldingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HoldingDto value)?  $default,){
final _that = this;
switch (_that) {
case _HoldingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol, @DecimalConverter()  Decimal quantity, @DecimalConverter()@JsonKey(name: 'avg_price')  Decimal avgPrice, @DecimalConverter()@JsonKey(name: 'cost_basis')  Decimal costBasis, @NullableDecimalConverter()@JsonKey(name: 'current_price')  Decimal? currentPrice, @NullableDecimalConverter()@JsonKey(name: 'current_value')  Decimal? currentValue, @NullableDecimalConverter()  Decimal? pnl, @NullableDecimalConverter()@JsonKey(name: 'pnl_percent')  Decimal? pnlPercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HoldingDto() when $default != null:
return $default(_that.symbol,_that.quantity,_that.avgPrice,_that.costBasis,_that.currentPrice,_that.currentValue,_that.pnl,_that.pnlPercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol, @DecimalConverter()  Decimal quantity, @DecimalConverter()@JsonKey(name: 'avg_price')  Decimal avgPrice, @DecimalConverter()@JsonKey(name: 'cost_basis')  Decimal costBasis, @NullableDecimalConverter()@JsonKey(name: 'current_price')  Decimal? currentPrice, @NullableDecimalConverter()@JsonKey(name: 'current_value')  Decimal? currentValue, @NullableDecimalConverter()  Decimal? pnl, @NullableDecimalConverter()@JsonKey(name: 'pnl_percent')  Decimal? pnlPercent)  $default,) {final _that = this;
switch (_that) {
case _HoldingDto():
return $default(_that.symbol,_that.quantity,_that.avgPrice,_that.costBasis,_that.currentPrice,_that.currentValue,_that.pnl,_that.pnlPercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol, @DecimalConverter()  Decimal quantity, @DecimalConverter()@JsonKey(name: 'avg_price')  Decimal avgPrice, @DecimalConverter()@JsonKey(name: 'cost_basis')  Decimal costBasis, @NullableDecimalConverter()@JsonKey(name: 'current_price')  Decimal? currentPrice, @NullableDecimalConverter()@JsonKey(name: 'current_value')  Decimal? currentValue, @NullableDecimalConverter()  Decimal? pnl, @NullableDecimalConverter()@JsonKey(name: 'pnl_percent')  Decimal? pnlPercent)?  $default,) {final _that = this;
switch (_that) {
case _HoldingDto() when $default != null:
return $default(_that.symbol,_that.quantity,_that.avgPrice,_that.costBasis,_that.currentPrice,_that.currentValue,_that.pnl,_that.pnlPercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HoldingDto implements HoldingDto {
  const _HoldingDto({required this.symbol, @DecimalConverter() required this.quantity, @DecimalConverter()@JsonKey(name: 'avg_price') required this.avgPrice, @DecimalConverter()@JsonKey(name: 'cost_basis') required this.costBasis, @NullableDecimalConverter()@JsonKey(name: 'current_price') this.currentPrice, @NullableDecimalConverter()@JsonKey(name: 'current_value') this.currentValue, @NullableDecimalConverter() this.pnl, @NullableDecimalConverter()@JsonKey(name: 'pnl_percent') this.pnlPercent});
  factory _HoldingDto.fromJson(Map<String, dynamic> json) => _$HoldingDtoFromJson(json);

@override final  String symbol;
@override@DecimalConverter() final  Decimal quantity;
@override@DecimalConverter()@JsonKey(name: 'avg_price') final  Decimal avgPrice;
@override@DecimalConverter()@JsonKey(name: 'cost_basis') final  Decimal costBasis;
@override@NullableDecimalConverter()@JsonKey(name: 'current_price') final  Decimal? currentPrice;
@override@NullableDecimalConverter()@JsonKey(name: 'current_value') final  Decimal? currentValue;
@override@NullableDecimalConverter() final  Decimal? pnl;
@override@NullableDecimalConverter()@JsonKey(name: 'pnl_percent') final  Decimal? pnlPercent;

/// Create a copy of HoldingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HoldingDtoCopyWith<_HoldingDto> get copyWith => __$HoldingDtoCopyWithImpl<_HoldingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HoldingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HoldingDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.avgPrice, avgPrice) || other.avgPrice == avgPrice)&&(identical(other.costBasis, costBasis) || other.costBasis == costBasis)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.pnl, pnl) || other.pnl == pnl)&&(identical(other.pnlPercent, pnlPercent) || other.pnlPercent == pnlPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,quantity,avgPrice,costBasis,currentPrice,currentValue,pnl,pnlPercent);

@override
String toString() {
  return 'HoldingDto(symbol: $symbol, quantity: $quantity, avgPrice: $avgPrice, costBasis: $costBasis, currentPrice: $currentPrice, currentValue: $currentValue, pnl: $pnl, pnlPercent: $pnlPercent)';
}


}

/// @nodoc
abstract mixin class _$HoldingDtoCopyWith<$Res> implements $HoldingDtoCopyWith<$Res> {
  factory _$HoldingDtoCopyWith(_HoldingDto value, $Res Function(_HoldingDto) _then) = __$HoldingDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol,@DecimalConverter() Decimal quantity,@DecimalConverter()@JsonKey(name: 'avg_price') Decimal avgPrice,@DecimalConverter()@JsonKey(name: 'cost_basis') Decimal costBasis,@NullableDecimalConverter()@JsonKey(name: 'current_price') Decimal? currentPrice,@NullableDecimalConverter()@JsonKey(name: 'current_value') Decimal? currentValue,@NullableDecimalConverter() Decimal? pnl,@NullableDecimalConverter()@JsonKey(name: 'pnl_percent') Decimal? pnlPercent
});




}
/// @nodoc
class __$HoldingDtoCopyWithImpl<$Res>
    implements _$HoldingDtoCopyWith<$Res> {
  __$HoldingDtoCopyWithImpl(this._self, this._then);

  final _HoldingDto _self;
  final $Res Function(_HoldingDto) _then;

/// Create a copy of HoldingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? quantity = null,Object? avgPrice = null,Object? costBasis = null,Object? currentPrice = freezed,Object? currentValue = freezed,Object? pnl = freezed,Object? pnlPercent = freezed,}) {
  return _then(_HoldingDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as Decimal,avgPrice: null == avgPrice ? _self.avgPrice : avgPrice // ignore: cast_nullable_to_non_nullable
as Decimal,costBasis: null == costBasis ? _self.costBasis : costBasis // ignore: cast_nullable_to_non_nullable
as Decimal,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as Decimal?,pnl: freezed == pnl ? _self.pnl : pnl // ignore: cast_nullable_to_non_nullable
as Decimal?,pnlPercent: freezed == pnlPercent ? _self.pnlPercent : pnlPercent // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}


}

// dart format on
