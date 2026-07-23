// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketStatusDto {

 String get market; String get status;@JsonKey(name: 'as_of') String get asOf;
/// Create a copy of MarketStatusDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketStatusDtoCopyWith<MarketStatusDto> get copyWith => _$MarketStatusDtoCopyWithImpl<MarketStatusDto>(this as MarketStatusDto, _$identity);

  /// Serializes this MarketStatusDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketStatusDto&&(identical(other.market, market) || other.market == market)&&(identical(other.status, status) || other.status == status)&&(identical(other.asOf, asOf) || other.asOf == asOf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,market,status,asOf);

@override
String toString() {
  return 'MarketStatusDto(market: $market, status: $status, asOf: $asOf)';
}


}

/// @nodoc
abstract mixin class $MarketStatusDtoCopyWith<$Res>  {
  factory $MarketStatusDtoCopyWith(MarketStatusDto value, $Res Function(MarketStatusDto) _then) = _$MarketStatusDtoCopyWithImpl;
@useResult
$Res call({
 String market, String status,@JsonKey(name: 'as_of') String asOf
});




}
/// @nodoc
class _$MarketStatusDtoCopyWithImpl<$Res>
    implements $MarketStatusDtoCopyWith<$Res> {
  _$MarketStatusDtoCopyWithImpl(this._self, this._then);

  final MarketStatusDto _self;
  final $Res Function(MarketStatusDto) _then;

/// Create a copy of MarketStatusDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? market = null,Object? status = null,Object? asOf = null,}) {
  return _then(_self.copyWith(
market: null == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketStatusDto].
extension MarketStatusDtoPatterns on MarketStatusDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketStatusDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketStatusDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketStatusDto value)  $default,){
final _that = this;
switch (_that) {
case _MarketStatusDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketStatusDto value)?  $default,){
final _that = this;
switch (_that) {
case _MarketStatusDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String market,  String status, @JsonKey(name: 'as_of')  String asOf)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketStatusDto() when $default != null:
return $default(_that.market,_that.status,_that.asOf);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String market,  String status, @JsonKey(name: 'as_of')  String asOf)  $default,) {final _that = this;
switch (_that) {
case _MarketStatusDto():
return $default(_that.market,_that.status,_that.asOf);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String market,  String status, @JsonKey(name: 'as_of')  String asOf)?  $default,) {final _that = this;
switch (_that) {
case _MarketStatusDto() when $default != null:
return $default(_that.market,_that.status,_that.asOf);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketStatusDto implements MarketStatusDto {
  const _MarketStatusDto({required this.market, required this.status, @JsonKey(name: 'as_of') required this.asOf});
  factory _MarketStatusDto.fromJson(Map<String, dynamic> json) => _$MarketStatusDtoFromJson(json);

@override final  String market;
@override final  String status;
@override@JsonKey(name: 'as_of') final  String asOf;

/// Create a copy of MarketStatusDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketStatusDtoCopyWith<_MarketStatusDto> get copyWith => __$MarketStatusDtoCopyWithImpl<_MarketStatusDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketStatusDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketStatusDto&&(identical(other.market, market) || other.market == market)&&(identical(other.status, status) || other.status == status)&&(identical(other.asOf, asOf) || other.asOf == asOf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,market,status,asOf);

@override
String toString() {
  return 'MarketStatusDto(market: $market, status: $status, asOf: $asOf)';
}


}

/// @nodoc
abstract mixin class _$MarketStatusDtoCopyWith<$Res> implements $MarketStatusDtoCopyWith<$Res> {
  factory _$MarketStatusDtoCopyWith(_MarketStatusDto value, $Res Function(_MarketStatusDto) _then) = __$MarketStatusDtoCopyWithImpl;
@override @useResult
$Res call({
 String market, String status,@JsonKey(name: 'as_of') String asOf
});




}
/// @nodoc
class __$MarketStatusDtoCopyWithImpl<$Res>
    implements _$MarketStatusDtoCopyWith<$Res> {
  __$MarketStatusDtoCopyWithImpl(this._self, this._then);

  final _MarketStatusDto _self;
  final $Res Function(_MarketStatusDto) _then;

/// Create a copy of MarketStatusDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? market = null,Object? status = null,Object? asOf = null,}) {
  return _then(_MarketStatusDto(
market: null == market ? _self.market : market // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
