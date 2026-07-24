// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intraday_recommendation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IntradayRecommendationDto {

 String get symbol; String get name;@JsonKey(name: 'as_of') DateTime get asOf; String get signal;@DecimalConverter() Decimal get confidence;@NullableDecimalConverter()@JsonKey(name: 'entry_price') Decimal? get entryPrice;@NullableDecimalConverter()@JsonKey(name: 'target_price') Decimal? get targetPrice;@NullableDecimalConverter()@JsonKey(name: 'stop_loss') Decimal? get stopLoss; List<String> get reasoning;
/// Create a copy of IntradayRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntradayRecommendationDtoCopyWith<IntradayRecommendationDto> get copyWith => _$IntradayRecommendationDtoCopyWithImpl<IntradayRecommendationDto>(this as IntradayRecommendationDto, _$identity);

  /// Serializes this IntradayRecommendationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntradayRecommendationDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.entryPrice, entryPrice) || other.entryPrice == entryPrice)&&(identical(other.targetPrice, targetPrice) || other.targetPrice == targetPrice)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&const DeepCollectionEquality().equals(other.reasoning, reasoning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,asOf,signal,confidence,entryPrice,targetPrice,stopLoss,const DeepCollectionEquality().hash(reasoning));

@override
String toString() {
  return 'IntradayRecommendationDto(symbol: $symbol, name: $name, asOf: $asOf, signal: $signal, confidence: $confidence, entryPrice: $entryPrice, targetPrice: $targetPrice, stopLoss: $stopLoss, reasoning: $reasoning)';
}


}

/// @nodoc
abstract mixin class $IntradayRecommendationDtoCopyWith<$Res>  {
  factory $IntradayRecommendationDtoCopyWith(IntradayRecommendationDto value, $Res Function(IntradayRecommendationDto) _then) = _$IntradayRecommendationDtoCopyWithImpl;
@useResult
$Res call({
 String symbol, String name,@JsonKey(name: 'as_of') DateTime asOf, String signal,@DecimalConverter() Decimal confidence,@NullableDecimalConverter()@JsonKey(name: 'entry_price') Decimal? entryPrice,@NullableDecimalConverter()@JsonKey(name: 'target_price') Decimal? targetPrice,@NullableDecimalConverter()@JsonKey(name: 'stop_loss') Decimal? stopLoss, List<String> reasoning
});




}
/// @nodoc
class _$IntradayRecommendationDtoCopyWithImpl<$Res>
    implements $IntradayRecommendationDtoCopyWith<$Res> {
  _$IntradayRecommendationDtoCopyWithImpl(this._self, this._then);

  final IntradayRecommendationDto _self;
  final $Res Function(IntradayRecommendationDto) _then;

/// Create a copy of IntradayRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? asOf = null,Object? signal = null,Object? confidence = null,Object? entryPrice = freezed,Object? targetPrice = freezed,Object? stopLoss = freezed,Object? reasoning = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,signal: null == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as Decimal,entryPrice: freezed == entryPrice ? _self.entryPrice : entryPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,targetPrice: freezed == targetPrice ? _self.targetPrice : targetPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,stopLoss: freezed == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as Decimal?,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [IntradayRecommendationDto].
extension IntradayRecommendationDtoPatterns on IntradayRecommendationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IntradayRecommendationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IntradayRecommendationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IntradayRecommendationDto value)  $default,){
final _that = this;
switch (_that) {
case _IntradayRecommendationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IntradayRecommendationDto value)?  $default,){
final _that = this;
switch (_that) {
case _IntradayRecommendationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name, @JsonKey(name: 'as_of')  DateTime asOf,  String signal, @DecimalConverter()  Decimal confidence, @NullableDecimalConverter()@JsonKey(name: 'entry_price')  Decimal? entryPrice, @NullableDecimalConverter()@JsonKey(name: 'target_price')  Decimal? targetPrice, @NullableDecimalConverter()@JsonKey(name: 'stop_loss')  Decimal? stopLoss,  List<String> reasoning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IntradayRecommendationDto() when $default != null:
return $default(_that.symbol,_that.name,_that.asOf,_that.signal,_that.confidence,_that.entryPrice,_that.targetPrice,_that.stopLoss,_that.reasoning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name, @JsonKey(name: 'as_of')  DateTime asOf,  String signal, @DecimalConverter()  Decimal confidence, @NullableDecimalConverter()@JsonKey(name: 'entry_price')  Decimal? entryPrice, @NullableDecimalConverter()@JsonKey(name: 'target_price')  Decimal? targetPrice, @NullableDecimalConverter()@JsonKey(name: 'stop_loss')  Decimal? stopLoss,  List<String> reasoning)  $default,) {final _that = this;
switch (_that) {
case _IntradayRecommendationDto():
return $default(_that.symbol,_that.name,_that.asOf,_that.signal,_that.confidence,_that.entryPrice,_that.targetPrice,_that.stopLoss,_that.reasoning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name, @JsonKey(name: 'as_of')  DateTime asOf,  String signal, @DecimalConverter()  Decimal confidence, @NullableDecimalConverter()@JsonKey(name: 'entry_price')  Decimal? entryPrice, @NullableDecimalConverter()@JsonKey(name: 'target_price')  Decimal? targetPrice, @NullableDecimalConverter()@JsonKey(name: 'stop_loss')  Decimal? stopLoss,  List<String> reasoning)?  $default,) {final _that = this;
switch (_that) {
case _IntradayRecommendationDto() when $default != null:
return $default(_that.symbol,_that.name,_that.asOf,_that.signal,_that.confidence,_that.entryPrice,_that.targetPrice,_that.stopLoss,_that.reasoning);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IntradayRecommendationDto implements IntradayRecommendationDto {
  const _IntradayRecommendationDto({required this.symbol, required this.name, @JsonKey(name: 'as_of') required this.asOf, required this.signal, @DecimalConverter() required this.confidence, @NullableDecimalConverter()@JsonKey(name: 'entry_price') this.entryPrice, @NullableDecimalConverter()@JsonKey(name: 'target_price') this.targetPrice, @NullableDecimalConverter()@JsonKey(name: 'stop_loss') this.stopLoss, final  List<String> reasoning = const []}): _reasoning = reasoning;
  factory _IntradayRecommendationDto.fromJson(Map<String, dynamic> json) => _$IntradayRecommendationDtoFromJson(json);

@override final  String symbol;
@override final  String name;
@override@JsonKey(name: 'as_of') final  DateTime asOf;
@override final  String signal;
@override@DecimalConverter() final  Decimal confidence;
@override@NullableDecimalConverter()@JsonKey(name: 'entry_price') final  Decimal? entryPrice;
@override@NullableDecimalConverter()@JsonKey(name: 'target_price') final  Decimal? targetPrice;
@override@NullableDecimalConverter()@JsonKey(name: 'stop_loss') final  Decimal? stopLoss;
 final  List<String> _reasoning;
@override@JsonKey() List<String> get reasoning {
  if (_reasoning is EqualUnmodifiableListView) return _reasoning;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reasoning);
}


/// Create a copy of IntradayRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IntradayRecommendationDtoCopyWith<_IntradayRecommendationDto> get copyWith => __$IntradayRecommendationDtoCopyWithImpl<_IntradayRecommendationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IntradayRecommendationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IntradayRecommendationDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.entryPrice, entryPrice) || other.entryPrice == entryPrice)&&(identical(other.targetPrice, targetPrice) || other.targetPrice == targetPrice)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&const DeepCollectionEquality().equals(other._reasoning, _reasoning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,asOf,signal,confidence,entryPrice,targetPrice,stopLoss,const DeepCollectionEquality().hash(_reasoning));

@override
String toString() {
  return 'IntradayRecommendationDto(symbol: $symbol, name: $name, asOf: $asOf, signal: $signal, confidence: $confidence, entryPrice: $entryPrice, targetPrice: $targetPrice, stopLoss: $stopLoss, reasoning: $reasoning)';
}


}

/// @nodoc
abstract mixin class _$IntradayRecommendationDtoCopyWith<$Res> implements $IntradayRecommendationDtoCopyWith<$Res> {
  factory _$IntradayRecommendationDtoCopyWith(_IntradayRecommendationDto value, $Res Function(_IntradayRecommendationDto) _then) = __$IntradayRecommendationDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name,@JsonKey(name: 'as_of') DateTime asOf, String signal,@DecimalConverter() Decimal confidence,@NullableDecimalConverter()@JsonKey(name: 'entry_price') Decimal? entryPrice,@NullableDecimalConverter()@JsonKey(name: 'target_price') Decimal? targetPrice,@NullableDecimalConverter()@JsonKey(name: 'stop_loss') Decimal? stopLoss, List<String> reasoning
});




}
/// @nodoc
class __$IntradayRecommendationDtoCopyWithImpl<$Res>
    implements _$IntradayRecommendationDtoCopyWith<$Res> {
  __$IntradayRecommendationDtoCopyWithImpl(this._self, this._then);

  final _IntradayRecommendationDto _self;
  final $Res Function(_IntradayRecommendationDto) _then;

/// Create a copy of IntradayRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? asOf = null,Object? signal = null,Object? confidence = null,Object? entryPrice = freezed,Object? targetPrice = freezed,Object? stopLoss = freezed,Object? reasoning = null,}) {
  return _then(_IntradayRecommendationDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,signal: null == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as Decimal,entryPrice: freezed == entryPrice ? _self.entryPrice : entryPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,targetPrice: freezed == targetPrice ? _self.targetPrice : targetPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,stopLoss: freezed == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as Decimal?,reasoning: null == reasoning ? _self._reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
