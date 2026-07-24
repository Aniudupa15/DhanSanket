// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_performance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioPerformanceDto {

 String get id;@DecimalConverter()@JsonKey(name: 'total_invested') Decimal get totalInvested;@DecimalConverter()@JsonKey(name: 'current_value') Decimal get currentValue;@DecimalConverter()@JsonKey(name: 'total_pnl') Decimal get totalPnl;@NullableDecimalConverter()@JsonKey(name: 'total_pnl_percent') Decimal? get totalPnlPercent;@NullableDecimalConverter()@JsonKey(name: 'xirr_percent') Decimal? get xirrPercent;
/// Create a copy of PortfolioPerformanceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioPerformanceDtoCopyWith<PortfolioPerformanceDto> get copyWith => _$PortfolioPerformanceDtoCopyWithImpl<PortfolioPerformanceDto>(this as PortfolioPerformanceDto, _$identity);

  /// Serializes this PortfolioPerformanceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioPerformanceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.totalInvested, totalInvested) || other.totalInvested == totalInvested)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.totalPnl, totalPnl) || other.totalPnl == totalPnl)&&(identical(other.totalPnlPercent, totalPnlPercent) || other.totalPnlPercent == totalPnlPercent)&&(identical(other.xirrPercent, xirrPercent) || other.xirrPercent == xirrPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,totalInvested,currentValue,totalPnl,totalPnlPercent,xirrPercent);

@override
String toString() {
  return 'PortfolioPerformanceDto(id: $id, totalInvested: $totalInvested, currentValue: $currentValue, totalPnl: $totalPnl, totalPnlPercent: $totalPnlPercent, xirrPercent: $xirrPercent)';
}


}

/// @nodoc
abstract mixin class $PortfolioPerformanceDtoCopyWith<$Res>  {
  factory $PortfolioPerformanceDtoCopyWith(PortfolioPerformanceDto value, $Res Function(PortfolioPerformanceDto) _then) = _$PortfolioPerformanceDtoCopyWithImpl;
@useResult
$Res call({
 String id,@DecimalConverter()@JsonKey(name: 'total_invested') Decimal totalInvested,@DecimalConverter()@JsonKey(name: 'current_value') Decimal currentValue,@DecimalConverter()@JsonKey(name: 'total_pnl') Decimal totalPnl,@NullableDecimalConverter()@JsonKey(name: 'total_pnl_percent') Decimal? totalPnlPercent,@NullableDecimalConverter()@JsonKey(name: 'xirr_percent') Decimal? xirrPercent
});




}
/// @nodoc
class _$PortfolioPerformanceDtoCopyWithImpl<$Res>
    implements $PortfolioPerformanceDtoCopyWith<$Res> {
  _$PortfolioPerformanceDtoCopyWithImpl(this._self, this._then);

  final PortfolioPerformanceDto _self;
  final $Res Function(PortfolioPerformanceDto) _then;

/// Create a copy of PortfolioPerformanceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? totalInvested = null,Object? currentValue = null,Object? totalPnl = null,Object? totalPnlPercent = freezed,Object? xirrPercent = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,totalInvested: null == totalInvested ? _self.totalInvested : totalInvested // ignore: cast_nullable_to_non_nullable
as Decimal,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as Decimal,totalPnl: null == totalPnl ? _self.totalPnl : totalPnl // ignore: cast_nullable_to_non_nullable
as Decimal,totalPnlPercent: freezed == totalPnlPercent ? _self.totalPnlPercent : totalPnlPercent // ignore: cast_nullable_to_non_nullable
as Decimal?,xirrPercent: freezed == xirrPercent ? _self.xirrPercent : xirrPercent // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioPerformanceDto].
extension PortfolioPerformanceDtoPatterns on PortfolioPerformanceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioPerformanceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioPerformanceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioPerformanceDto value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioPerformanceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioPerformanceDto value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioPerformanceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @DecimalConverter()@JsonKey(name: 'total_invested')  Decimal totalInvested, @DecimalConverter()@JsonKey(name: 'current_value')  Decimal currentValue, @DecimalConverter()@JsonKey(name: 'total_pnl')  Decimal totalPnl, @NullableDecimalConverter()@JsonKey(name: 'total_pnl_percent')  Decimal? totalPnlPercent, @NullableDecimalConverter()@JsonKey(name: 'xirr_percent')  Decimal? xirrPercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioPerformanceDto() when $default != null:
return $default(_that.id,_that.totalInvested,_that.currentValue,_that.totalPnl,_that.totalPnlPercent,_that.xirrPercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @DecimalConverter()@JsonKey(name: 'total_invested')  Decimal totalInvested, @DecimalConverter()@JsonKey(name: 'current_value')  Decimal currentValue, @DecimalConverter()@JsonKey(name: 'total_pnl')  Decimal totalPnl, @NullableDecimalConverter()@JsonKey(name: 'total_pnl_percent')  Decimal? totalPnlPercent, @NullableDecimalConverter()@JsonKey(name: 'xirr_percent')  Decimal? xirrPercent)  $default,) {final _that = this;
switch (_that) {
case _PortfolioPerformanceDto():
return $default(_that.id,_that.totalInvested,_that.currentValue,_that.totalPnl,_that.totalPnlPercent,_that.xirrPercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @DecimalConverter()@JsonKey(name: 'total_invested')  Decimal totalInvested, @DecimalConverter()@JsonKey(name: 'current_value')  Decimal currentValue, @DecimalConverter()@JsonKey(name: 'total_pnl')  Decimal totalPnl, @NullableDecimalConverter()@JsonKey(name: 'total_pnl_percent')  Decimal? totalPnlPercent, @NullableDecimalConverter()@JsonKey(name: 'xirr_percent')  Decimal? xirrPercent)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioPerformanceDto() when $default != null:
return $default(_that.id,_that.totalInvested,_that.currentValue,_that.totalPnl,_that.totalPnlPercent,_that.xirrPercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioPerformanceDto implements PortfolioPerformanceDto {
  const _PortfolioPerformanceDto({required this.id, @DecimalConverter()@JsonKey(name: 'total_invested') required this.totalInvested, @DecimalConverter()@JsonKey(name: 'current_value') required this.currentValue, @DecimalConverter()@JsonKey(name: 'total_pnl') required this.totalPnl, @NullableDecimalConverter()@JsonKey(name: 'total_pnl_percent') this.totalPnlPercent, @NullableDecimalConverter()@JsonKey(name: 'xirr_percent') this.xirrPercent});
  factory _PortfolioPerformanceDto.fromJson(Map<String, dynamic> json) => _$PortfolioPerformanceDtoFromJson(json);

@override final  String id;
@override@DecimalConverter()@JsonKey(name: 'total_invested') final  Decimal totalInvested;
@override@DecimalConverter()@JsonKey(name: 'current_value') final  Decimal currentValue;
@override@DecimalConverter()@JsonKey(name: 'total_pnl') final  Decimal totalPnl;
@override@NullableDecimalConverter()@JsonKey(name: 'total_pnl_percent') final  Decimal? totalPnlPercent;
@override@NullableDecimalConverter()@JsonKey(name: 'xirr_percent') final  Decimal? xirrPercent;

/// Create a copy of PortfolioPerformanceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioPerformanceDtoCopyWith<_PortfolioPerformanceDto> get copyWith => __$PortfolioPerformanceDtoCopyWithImpl<_PortfolioPerformanceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioPerformanceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioPerformanceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.totalInvested, totalInvested) || other.totalInvested == totalInvested)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.totalPnl, totalPnl) || other.totalPnl == totalPnl)&&(identical(other.totalPnlPercent, totalPnlPercent) || other.totalPnlPercent == totalPnlPercent)&&(identical(other.xirrPercent, xirrPercent) || other.xirrPercent == xirrPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,totalInvested,currentValue,totalPnl,totalPnlPercent,xirrPercent);

@override
String toString() {
  return 'PortfolioPerformanceDto(id: $id, totalInvested: $totalInvested, currentValue: $currentValue, totalPnl: $totalPnl, totalPnlPercent: $totalPnlPercent, xirrPercent: $xirrPercent)';
}


}

/// @nodoc
abstract mixin class _$PortfolioPerformanceDtoCopyWith<$Res> implements $PortfolioPerformanceDtoCopyWith<$Res> {
  factory _$PortfolioPerformanceDtoCopyWith(_PortfolioPerformanceDto value, $Res Function(_PortfolioPerformanceDto) _then) = __$PortfolioPerformanceDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@DecimalConverter()@JsonKey(name: 'total_invested') Decimal totalInvested,@DecimalConverter()@JsonKey(name: 'current_value') Decimal currentValue,@DecimalConverter()@JsonKey(name: 'total_pnl') Decimal totalPnl,@NullableDecimalConverter()@JsonKey(name: 'total_pnl_percent') Decimal? totalPnlPercent,@NullableDecimalConverter()@JsonKey(name: 'xirr_percent') Decimal? xirrPercent
});




}
/// @nodoc
class __$PortfolioPerformanceDtoCopyWithImpl<$Res>
    implements _$PortfolioPerformanceDtoCopyWith<$Res> {
  __$PortfolioPerformanceDtoCopyWithImpl(this._self, this._then);

  final _PortfolioPerformanceDto _self;
  final $Res Function(_PortfolioPerformanceDto) _then;

/// Create a copy of PortfolioPerformanceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? totalInvested = null,Object? currentValue = null,Object? totalPnl = null,Object? totalPnlPercent = freezed,Object? xirrPercent = freezed,}) {
  return _then(_PortfolioPerformanceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,totalInvested: null == totalInvested ? _self.totalInvested : totalInvested // ignore: cast_nullable_to_non_nullable
as Decimal,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as Decimal,totalPnl: null == totalPnl ? _self.totalPnl : totalPnl // ignore: cast_nullable_to_non_nullable
as Decimal,totalPnlPercent: freezed == totalPnlPercent ? _self.totalPnlPercent : totalPnlPercent // ignore: cast_nullable_to_non_nullable
as Decimal?,xirrPercent: freezed == xirrPercent ? _self.xirrPercent : xirrPercent // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}


}

// dart format on
