// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_search_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockSearchResultDto {

 String get symbol; String get name; String? get isin; String? get series;@JsonKey(name: 'instrument_type') InstrumentTypeDto get instrumentType;
/// Create a copy of StockSearchResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockSearchResultDtoCopyWith<StockSearchResultDto> get copyWith => _$StockSearchResultDtoCopyWithImpl<StockSearchResultDto>(this as StockSearchResultDto, _$identity);

  /// Serializes this StockSearchResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockSearchResultDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.isin, isin) || other.isin == isin)&&(identical(other.series, series) || other.series == series)&&(identical(other.instrumentType, instrumentType) || other.instrumentType == instrumentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,isin,series,instrumentType);

@override
String toString() {
  return 'StockSearchResultDto(symbol: $symbol, name: $name, isin: $isin, series: $series, instrumentType: $instrumentType)';
}


}

/// @nodoc
abstract mixin class $StockSearchResultDtoCopyWith<$Res>  {
  factory $StockSearchResultDtoCopyWith(StockSearchResultDto value, $Res Function(StockSearchResultDto) _then) = _$StockSearchResultDtoCopyWithImpl;
@useResult
$Res call({
 String symbol, String name, String? isin, String? series,@JsonKey(name: 'instrument_type') InstrumentTypeDto instrumentType
});




}
/// @nodoc
class _$StockSearchResultDtoCopyWithImpl<$Res>
    implements $StockSearchResultDtoCopyWith<$Res> {
  _$StockSearchResultDtoCopyWithImpl(this._self, this._then);

  final StockSearchResultDto _self;
  final $Res Function(StockSearchResultDto) _then;

/// Create a copy of StockSearchResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? isin = freezed,Object? series = freezed,Object? instrumentType = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isin: freezed == isin ? _self.isin : isin // ignore: cast_nullable_to_non_nullable
as String?,series: freezed == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as String?,instrumentType: null == instrumentType ? _self.instrumentType : instrumentType // ignore: cast_nullable_to_non_nullable
as InstrumentTypeDto,
  ));
}

}


/// Adds pattern-matching-related methods to [StockSearchResultDto].
extension StockSearchResultDtoPatterns on StockSearchResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockSearchResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockSearchResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockSearchResultDto value)  $default,){
final _that = this;
switch (_that) {
case _StockSearchResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockSearchResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _StockSearchResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name,  String? isin,  String? series, @JsonKey(name: 'instrument_type')  InstrumentTypeDto instrumentType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockSearchResultDto() when $default != null:
return $default(_that.symbol,_that.name,_that.isin,_that.series,_that.instrumentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name,  String? isin,  String? series, @JsonKey(name: 'instrument_type')  InstrumentTypeDto instrumentType)  $default,) {final _that = this;
switch (_that) {
case _StockSearchResultDto():
return $default(_that.symbol,_that.name,_that.isin,_that.series,_that.instrumentType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name,  String? isin,  String? series, @JsonKey(name: 'instrument_type')  InstrumentTypeDto instrumentType)?  $default,) {final _that = this;
switch (_that) {
case _StockSearchResultDto() when $default != null:
return $default(_that.symbol,_that.name,_that.isin,_that.series,_that.instrumentType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockSearchResultDto implements StockSearchResultDto {
  const _StockSearchResultDto({required this.symbol, required this.name, this.isin, this.series, @JsonKey(name: 'instrument_type') required this.instrumentType});
  factory _StockSearchResultDto.fromJson(Map<String, dynamic> json) => _$StockSearchResultDtoFromJson(json);

@override final  String symbol;
@override final  String name;
@override final  String? isin;
@override final  String? series;
@override@JsonKey(name: 'instrument_type') final  InstrumentTypeDto instrumentType;

/// Create a copy of StockSearchResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockSearchResultDtoCopyWith<_StockSearchResultDto> get copyWith => __$StockSearchResultDtoCopyWithImpl<_StockSearchResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockSearchResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockSearchResultDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.isin, isin) || other.isin == isin)&&(identical(other.series, series) || other.series == series)&&(identical(other.instrumentType, instrumentType) || other.instrumentType == instrumentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,isin,series,instrumentType);

@override
String toString() {
  return 'StockSearchResultDto(symbol: $symbol, name: $name, isin: $isin, series: $series, instrumentType: $instrumentType)';
}


}

/// @nodoc
abstract mixin class _$StockSearchResultDtoCopyWith<$Res> implements $StockSearchResultDtoCopyWith<$Res> {
  factory _$StockSearchResultDtoCopyWith(_StockSearchResultDto value, $Res Function(_StockSearchResultDto) _then) = __$StockSearchResultDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name, String? isin, String? series,@JsonKey(name: 'instrument_type') InstrumentTypeDto instrumentType
});




}
/// @nodoc
class __$StockSearchResultDtoCopyWithImpl<$Res>
    implements _$StockSearchResultDtoCopyWith<$Res> {
  __$StockSearchResultDtoCopyWithImpl(this._self, this._then);

  final _StockSearchResultDto _self;
  final $Res Function(_StockSearchResultDto) _then;

/// Create a copy of StockSearchResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? isin = freezed,Object? series = freezed,Object? instrumentType = null,}) {
  return _then(_StockSearchResultDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isin: freezed == isin ? _self.isin : isin // ignore: cast_nullable_to_non_nullable
as String?,series: freezed == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as String?,instrumentType: null == instrumentType ? _self.instrumentType : instrumentType // ignore: cast_nullable_to_non_nullable
as InstrumentTypeDto,
  ));
}


}

// dart format on
