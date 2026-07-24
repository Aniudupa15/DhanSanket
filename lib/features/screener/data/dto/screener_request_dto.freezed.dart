// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screener_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScreenerRequestDto {

@NullableDecimalConverter()@JsonKey(name: 'rsi_below') Decimal? get rsiBelow;@NullableDecimalConverter()@JsonKey(name: 'rsi_above') Decimal? get rsiAbove;@NullableDecimalConverter()@JsonKey(name: 'price_min') Decimal? get priceMin;@NullableDecimalConverter()@JsonKey(name: 'price_max') Decimal? get priceMax;@JsonKey(name: 'above_sma_50') bool? get aboveSma50;@JsonKey(name: 'min_volume') int? get minVolume; int get limit;
/// Create a copy of ScreenerRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScreenerRequestDtoCopyWith<ScreenerRequestDto> get copyWith => _$ScreenerRequestDtoCopyWithImpl<ScreenerRequestDto>(this as ScreenerRequestDto, _$identity);

  /// Serializes this ScreenerRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenerRequestDto&&(identical(other.rsiBelow, rsiBelow) || other.rsiBelow == rsiBelow)&&(identical(other.rsiAbove, rsiAbove) || other.rsiAbove == rsiAbove)&&(identical(other.priceMin, priceMin) || other.priceMin == priceMin)&&(identical(other.priceMax, priceMax) || other.priceMax == priceMax)&&(identical(other.aboveSma50, aboveSma50) || other.aboveSma50 == aboveSma50)&&(identical(other.minVolume, minVolume) || other.minVolume == minVolume)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rsiBelow,rsiAbove,priceMin,priceMax,aboveSma50,minVolume,limit);

@override
String toString() {
  return 'ScreenerRequestDto(rsiBelow: $rsiBelow, rsiAbove: $rsiAbove, priceMin: $priceMin, priceMax: $priceMax, aboveSma50: $aboveSma50, minVolume: $minVolume, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $ScreenerRequestDtoCopyWith<$Res>  {
  factory $ScreenerRequestDtoCopyWith(ScreenerRequestDto value, $Res Function(ScreenerRequestDto) _then) = _$ScreenerRequestDtoCopyWithImpl;
@useResult
$Res call({
@NullableDecimalConverter()@JsonKey(name: 'rsi_below') Decimal? rsiBelow,@NullableDecimalConverter()@JsonKey(name: 'rsi_above') Decimal? rsiAbove,@NullableDecimalConverter()@JsonKey(name: 'price_min') Decimal? priceMin,@NullableDecimalConverter()@JsonKey(name: 'price_max') Decimal? priceMax,@JsonKey(name: 'above_sma_50') bool? aboveSma50,@JsonKey(name: 'min_volume') int? minVolume, int limit
});




}
/// @nodoc
class _$ScreenerRequestDtoCopyWithImpl<$Res>
    implements $ScreenerRequestDtoCopyWith<$Res> {
  _$ScreenerRequestDtoCopyWithImpl(this._self, this._then);

  final ScreenerRequestDto _self;
  final $Res Function(ScreenerRequestDto) _then;

/// Create a copy of ScreenerRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rsiBelow = freezed,Object? rsiAbove = freezed,Object? priceMin = freezed,Object? priceMax = freezed,Object? aboveSma50 = freezed,Object? minVolume = freezed,Object? limit = null,}) {
  return _then(_self.copyWith(
rsiBelow: freezed == rsiBelow ? _self.rsiBelow : rsiBelow // ignore: cast_nullable_to_non_nullable
as Decimal?,rsiAbove: freezed == rsiAbove ? _self.rsiAbove : rsiAbove // ignore: cast_nullable_to_non_nullable
as Decimal?,priceMin: freezed == priceMin ? _self.priceMin : priceMin // ignore: cast_nullable_to_non_nullable
as Decimal?,priceMax: freezed == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as Decimal?,aboveSma50: freezed == aboveSma50 ? _self.aboveSma50 : aboveSma50 // ignore: cast_nullable_to_non_nullable
as bool?,minVolume: freezed == minVolume ? _self.minVolume : minVolume // ignore: cast_nullable_to_non_nullable
as int?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScreenerRequestDto].
extension ScreenerRequestDtoPatterns on ScreenerRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScreenerRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScreenerRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScreenerRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _ScreenerRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScreenerRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _ScreenerRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@NullableDecimalConverter()@JsonKey(name: 'rsi_below')  Decimal? rsiBelow, @NullableDecimalConverter()@JsonKey(name: 'rsi_above')  Decimal? rsiAbove, @NullableDecimalConverter()@JsonKey(name: 'price_min')  Decimal? priceMin, @NullableDecimalConverter()@JsonKey(name: 'price_max')  Decimal? priceMax, @JsonKey(name: 'above_sma_50')  bool? aboveSma50, @JsonKey(name: 'min_volume')  int? minVolume,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScreenerRequestDto() when $default != null:
return $default(_that.rsiBelow,_that.rsiAbove,_that.priceMin,_that.priceMax,_that.aboveSma50,_that.minVolume,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@NullableDecimalConverter()@JsonKey(name: 'rsi_below')  Decimal? rsiBelow, @NullableDecimalConverter()@JsonKey(name: 'rsi_above')  Decimal? rsiAbove, @NullableDecimalConverter()@JsonKey(name: 'price_min')  Decimal? priceMin, @NullableDecimalConverter()@JsonKey(name: 'price_max')  Decimal? priceMax, @JsonKey(name: 'above_sma_50')  bool? aboveSma50, @JsonKey(name: 'min_volume')  int? minVolume,  int limit)  $default,) {final _that = this;
switch (_that) {
case _ScreenerRequestDto():
return $default(_that.rsiBelow,_that.rsiAbove,_that.priceMin,_that.priceMax,_that.aboveSma50,_that.minVolume,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@NullableDecimalConverter()@JsonKey(name: 'rsi_below')  Decimal? rsiBelow, @NullableDecimalConverter()@JsonKey(name: 'rsi_above')  Decimal? rsiAbove, @NullableDecimalConverter()@JsonKey(name: 'price_min')  Decimal? priceMin, @NullableDecimalConverter()@JsonKey(name: 'price_max')  Decimal? priceMax, @JsonKey(name: 'above_sma_50')  bool? aboveSma50, @JsonKey(name: 'min_volume')  int? minVolume,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _ScreenerRequestDto() when $default != null:
return $default(_that.rsiBelow,_that.rsiAbove,_that.priceMin,_that.priceMax,_that.aboveSma50,_that.minVolume,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScreenerRequestDto implements ScreenerRequestDto {
  const _ScreenerRequestDto({@NullableDecimalConverter()@JsonKey(name: 'rsi_below') this.rsiBelow, @NullableDecimalConverter()@JsonKey(name: 'rsi_above') this.rsiAbove, @NullableDecimalConverter()@JsonKey(name: 'price_min') this.priceMin, @NullableDecimalConverter()@JsonKey(name: 'price_max') this.priceMax, @JsonKey(name: 'above_sma_50') this.aboveSma50, @JsonKey(name: 'min_volume') this.minVolume, this.limit = 50});
  factory _ScreenerRequestDto.fromJson(Map<String, dynamic> json) => _$ScreenerRequestDtoFromJson(json);

@override@NullableDecimalConverter()@JsonKey(name: 'rsi_below') final  Decimal? rsiBelow;
@override@NullableDecimalConverter()@JsonKey(name: 'rsi_above') final  Decimal? rsiAbove;
@override@NullableDecimalConverter()@JsonKey(name: 'price_min') final  Decimal? priceMin;
@override@NullableDecimalConverter()@JsonKey(name: 'price_max') final  Decimal? priceMax;
@override@JsonKey(name: 'above_sma_50') final  bool? aboveSma50;
@override@JsonKey(name: 'min_volume') final  int? minVolume;
@override@JsonKey() final  int limit;

/// Create a copy of ScreenerRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScreenerRequestDtoCopyWith<_ScreenerRequestDto> get copyWith => __$ScreenerRequestDtoCopyWithImpl<_ScreenerRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScreenerRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScreenerRequestDto&&(identical(other.rsiBelow, rsiBelow) || other.rsiBelow == rsiBelow)&&(identical(other.rsiAbove, rsiAbove) || other.rsiAbove == rsiAbove)&&(identical(other.priceMin, priceMin) || other.priceMin == priceMin)&&(identical(other.priceMax, priceMax) || other.priceMax == priceMax)&&(identical(other.aboveSma50, aboveSma50) || other.aboveSma50 == aboveSma50)&&(identical(other.minVolume, minVolume) || other.minVolume == minVolume)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rsiBelow,rsiAbove,priceMin,priceMax,aboveSma50,minVolume,limit);

@override
String toString() {
  return 'ScreenerRequestDto(rsiBelow: $rsiBelow, rsiAbove: $rsiAbove, priceMin: $priceMin, priceMax: $priceMax, aboveSma50: $aboveSma50, minVolume: $minVolume, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$ScreenerRequestDtoCopyWith<$Res> implements $ScreenerRequestDtoCopyWith<$Res> {
  factory _$ScreenerRequestDtoCopyWith(_ScreenerRequestDto value, $Res Function(_ScreenerRequestDto) _then) = __$ScreenerRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@NullableDecimalConverter()@JsonKey(name: 'rsi_below') Decimal? rsiBelow,@NullableDecimalConverter()@JsonKey(name: 'rsi_above') Decimal? rsiAbove,@NullableDecimalConverter()@JsonKey(name: 'price_min') Decimal? priceMin,@NullableDecimalConverter()@JsonKey(name: 'price_max') Decimal? priceMax,@JsonKey(name: 'above_sma_50') bool? aboveSma50,@JsonKey(name: 'min_volume') int? minVolume, int limit
});




}
/// @nodoc
class __$ScreenerRequestDtoCopyWithImpl<$Res>
    implements _$ScreenerRequestDtoCopyWith<$Res> {
  __$ScreenerRequestDtoCopyWithImpl(this._self, this._then);

  final _ScreenerRequestDto _self;
  final $Res Function(_ScreenerRequestDto) _then;

/// Create a copy of ScreenerRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rsiBelow = freezed,Object? rsiAbove = freezed,Object? priceMin = freezed,Object? priceMax = freezed,Object? aboveSma50 = freezed,Object? minVolume = freezed,Object? limit = null,}) {
  return _then(_ScreenerRequestDto(
rsiBelow: freezed == rsiBelow ? _self.rsiBelow : rsiBelow // ignore: cast_nullable_to_non_nullable
as Decimal?,rsiAbove: freezed == rsiAbove ? _self.rsiAbove : rsiAbove // ignore: cast_nullable_to_non_nullable
as Decimal?,priceMin: freezed == priceMin ? _self.priceMin : priceMin // ignore: cast_nullable_to_non_nullable
as Decimal?,priceMax: freezed == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as Decimal?,aboveSma50: freezed == aboveSma50 ? _self.aboveSma50 : aboveSma50 // ignore: cast_nullable_to_non_nullable
as bool?,minVolume: freezed == minVolume ? _self.minVolume : minVolume // ignore: cast_nullable_to_non_nullable
as int?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
