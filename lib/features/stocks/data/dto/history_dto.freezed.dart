// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryDto {

 String get symbol; String get range; List<OhlcvBarDto> get bars;
/// Create a copy of HistoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryDtoCopyWith<HistoryDto> get copyWith => _$HistoryDtoCopyWithImpl<HistoryDto>(this as HistoryDto, _$identity);

  /// Serializes this HistoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.range, range) || other.range == range)&&const DeepCollectionEquality().equals(other.bars, bars));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,range,const DeepCollectionEquality().hash(bars));

@override
String toString() {
  return 'HistoryDto(symbol: $symbol, range: $range, bars: $bars)';
}


}

/// @nodoc
abstract mixin class $HistoryDtoCopyWith<$Res>  {
  factory $HistoryDtoCopyWith(HistoryDto value, $Res Function(HistoryDto) _then) = _$HistoryDtoCopyWithImpl;
@useResult
$Res call({
 String symbol, String range, List<OhlcvBarDto> bars
});




}
/// @nodoc
class _$HistoryDtoCopyWithImpl<$Res>
    implements $HistoryDtoCopyWith<$Res> {
  _$HistoryDtoCopyWithImpl(this._self, this._then);

  final HistoryDto _self;
  final $Res Function(HistoryDto) _then;

/// Create a copy of HistoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? range = null,Object? bars = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as String,bars: null == bars ? _self.bars : bars // ignore: cast_nullable_to_non_nullable
as List<OhlcvBarDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryDto].
extension HistoryDtoPatterns on HistoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryDto value)  $default,){
final _that = this;
switch (_that) {
case _HistoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String range,  List<OhlcvBarDto> bars)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryDto() when $default != null:
return $default(_that.symbol,_that.range,_that.bars);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String range,  List<OhlcvBarDto> bars)  $default,) {final _that = this;
switch (_that) {
case _HistoryDto():
return $default(_that.symbol,_that.range,_that.bars);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String range,  List<OhlcvBarDto> bars)?  $default,) {final _that = this;
switch (_that) {
case _HistoryDto() when $default != null:
return $default(_that.symbol,_that.range,_that.bars);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryDto implements HistoryDto {
  const _HistoryDto({required this.symbol, required this.range, required final  List<OhlcvBarDto> bars}): _bars = bars;
  factory _HistoryDto.fromJson(Map<String, dynamic> json) => _$HistoryDtoFromJson(json);

@override final  String symbol;
@override final  String range;
 final  List<OhlcvBarDto> _bars;
@override List<OhlcvBarDto> get bars {
  if (_bars is EqualUnmodifiableListView) return _bars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bars);
}


/// Create a copy of HistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryDtoCopyWith<_HistoryDto> get copyWith => __$HistoryDtoCopyWithImpl<_HistoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.range, range) || other.range == range)&&const DeepCollectionEquality().equals(other._bars, _bars));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,range,const DeepCollectionEquality().hash(_bars));

@override
String toString() {
  return 'HistoryDto(symbol: $symbol, range: $range, bars: $bars)';
}


}

/// @nodoc
abstract mixin class _$HistoryDtoCopyWith<$Res> implements $HistoryDtoCopyWith<$Res> {
  factory _$HistoryDtoCopyWith(_HistoryDto value, $Res Function(_HistoryDto) _then) = __$HistoryDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String range, List<OhlcvBarDto> bars
});




}
/// @nodoc
class __$HistoryDtoCopyWithImpl<$Res>
    implements _$HistoryDtoCopyWith<$Res> {
  __$HistoryDtoCopyWithImpl(this._self, this._then);

  final _HistoryDto _self;
  final $Res Function(_HistoryDto) _then;

/// Create a copy of HistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? range = null,Object? bars = null,}) {
  return _then(_HistoryDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as String,bars: null == bars ? _self._bars : bars // ignore: cast_nullable_to_non_nullable
as List<OhlcvBarDto>,
  ));
}


}

// dart format on
