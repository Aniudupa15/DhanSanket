// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volume_profile_bin_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolumeProfileBinDto {

@DecimalConverter()@JsonKey(name: 'price_low') Decimal get priceLow;@DecimalConverter()@JsonKey(name: 'price_high') Decimal get priceHigh; int get volume;
/// Create a copy of VolumeProfileBinDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolumeProfileBinDtoCopyWith<VolumeProfileBinDto> get copyWith => _$VolumeProfileBinDtoCopyWithImpl<VolumeProfileBinDto>(this as VolumeProfileBinDto, _$identity);

  /// Serializes this VolumeProfileBinDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolumeProfileBinDto&&(identical(other.priceLow, priceLow) || other.priceLow == priceLow)&&(identical(other.priceHigh, priceHigh) || other.priceHigh == priceHigh)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,priceLow,priceHigh,volume);

@override
String toString() {
  return 'VolumeProfileBinDto(priceLow: $priceLow, priceHigh: $priceHigh, volume: $volume)';
}


}

/// @nodoc
abstract mixin class $VolumeProfileBinDtoCopyWith<$Res>  {
  factory $VolumeProfileBinDtoCopyWith(VolumeProfileBinDto value, $Res Function(VolumeProfileBinDto) _then) = _$VolumeProfileBinDtoCopyWithImpl;
@useResult
$Res call({
@DecimalConverter()@JsonKey(name: 'price_low') Decimal priceLow,@DecimalConverter()@JsonKey(name: 'price_high') Decimal priceHigh, int volume
});




}
/// @nodoc
class _$VolumeProfileBinDtoCopyWithImpl<$Res>
    implements $VolumeProfileBinDtoCopyWith<$Res> {
  _$VolumeProfileBinDtoCopyWithImpl(this._self, this._then);

  final VolumeProfileBinDto _self;
  final $Res Function(VolumeProfileBinDto) _then;

/// Create a copy of VolumeProfileBinDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? priceLow = null,Object? priceHigh = null,Object? volume = null,}) {
  return _then(_self.copyWith(
priceLow: null == priceLow ? _self.priceLow : priceLow // ignore: cast_nullable_to_non_nullable
as Decimal,priceHigh: null == priceHigh ? _self.priceHigh : priceHigh // ignore: cast_nullable_to_non_nullable
as Decimal,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VolumeProfileBinDto].
extension VolumeProfileBinDtoPatterns on VolumeProfileBinDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VolumeProfileBinDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VolumeProfileBinDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VolumeProfileBinDto value)  $default,){
final _that = this;
switch (_that) {
case _VolumeProfileBinDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VolumeProfileBinDto value)?  $default,){
final _that = this;
switch (_that) {
case _VolumeProfileBinDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DecimalConverter()@JsonKey(name: 'price_low')  Decimal priceLow, @DecimalConverter()@JsonKey(name: 'price_high')  Decimal priceHigh,  int volume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VolumeProfileBinDto() when $default != null:
return $default(_that.priceLow,_that.priceHigh,_that.volume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DecimalConverter()@JsonKey(name: 'price_low')  Decimal priceLow, @DecimalConverter()@JsonKey(name: 'price_high')  Decimal priceHigh,  int volume)  $default,) {final _that = this;
switch (_that) {
case _VolumeProfileBinDto():
return $default(_that.priceLow,_that.priceHigh,_that.volume);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DecimalConverter()@JsonKey(name: 'price_low')  Decimal priceLow, @DecimalConverter()@JsonKey(name: 'price_high')  Decimal priceHigh,  int volume)?  $default,) {final _that = this;
switch (_that) {
case _VolumeProfileBinDto() when $default != null:
return $default(_that.priceLow,_that.priceHigh,_that.volume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VolumeProfileBinDto implements VolumeProfileBinDto {
  const _VolumeProfileBinDto({@DecimalConverter()@JsonKey(name: 'price_low') required this.priceLow, @DecimalConverter()@JsonKey(name: 'price_high') required this.priceHigh, required this.volume});
  factory _VolumeProfileBinDto.fromJson(Map<String, dynamic> json) => _$VolumeProfileBinDtoFromJson(json);

@override@DecimalConverter()@JsonKey(name: 'price_low') final  Decimal priceLow;
@override@DecimalConverter()@JsonKey(name: 'price_high') final  Decimal priceHigh;
@override final  int volume;

/// Create a copy of VolumeProfileBinDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolumeProfileBinDtoCopyWith<_VolumeProfileBinDto> get copyWith => __$VolumeProfileBinDtoCopyWithImpl<_VolumeProfileBinDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolumeProfileBinDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolumeProfileBinDto&&(identical(other.priceLow, priceLow) || other.priceLow == priceLow)&&(identical(other.priceHigh, priceHigh) || other.priceHigh == priceHigh)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,priceLow,priceHigh,volume);

@override
String toString() {
  return 'VolumeProfileBinDto(priceLow: $priceLow, priceHigh: $priceHigh, volume: $volume)';
}


}

/// @nodoc
abstract mixin class _$VolumeProfileBinDtoCopyWith<$Res> implements $VolumeProfileBinDtoCopyWith<$Res> {
  factory _$VolumeProfileBinDtoCopyWith(_VolumeProfileBinDto value, $Res Function(_VolumeProfileBinDto) _then) = __$VolumeProfileBinDtoCopyWithImpl;
@override @useResult
$Res call({
@DecimalConverter()@JsonKey(name: 'price_low') Decimal priceLow,@DecimalConverter()@JsonKey(name: 'price_high') Decimal priceHigh, int volume
});




}
/// @nodoc
class __$VolumeProfileBinDtoCopyWithImpl<$Res>
    implements _$VolumeProfileBinDtoCopyWith<$Res> {
  __$VolumeProfileBinDtoCopyWithImpl(this._self, this._then);

  final _VolumeProfileBinDto _self;
  final $Res Function(_VolumeProfileBinDto) _then;

/// Create a copy of VolumeProfileBinDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? priceLow = null,Object? priceHigh = null,Object? volume = null,}) {
  return _then(_VolumeProfileBinDto(
priceLow: null == priceLow ? _self.priceLow : priceLow // ignore: cast_nullable_to_non_nullable
as Decimal,priceHigh: null == priceHigh ? _self.priceHigh : priceHigh // ignore: cast_nullable_to_non_nullable
as Decimal,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
