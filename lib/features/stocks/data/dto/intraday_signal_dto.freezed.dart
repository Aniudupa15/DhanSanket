// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intraday_signal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IntradaySignalDto {

 String get symbol;@JsonKey(name: 'as_of') DateTime? get asOf;@JsonKey(name: 'has_data') bool get hasData; String get signal;@DecimalConverter() Decimal get confidence;@NullableDecimalConverter()@JsonKey(name: 'entry_price') Decimal? get entryPrice;@NullableDecimalConverter()@JsonKey(name: 'target_price') Decimal? get targetPrice;@NullableDecimalConverter()@JsonKey(name: 'stop_loss') Decimal? get stopLoss;@NullableDecimalConverter()@JsonKey(name: 'risk_reward_ratio') Decimal? get riskRewardRatio;@NullableDecimalConverter() Decimal? get probability; List<String> get reasoning; String get disclaimer;
/// Create a copy of IntradaySignalDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntradaySignalDtoCopyWith<IntradaySignalDto> get copyWith => _$IntradaySignalDtoCopyWithImpl<IntradaySignalDto>(this as IntradaySignalDto, _$identity);

  /// Serializes this IntradaySignalDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntradaySignalDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.hasData, hasData) || other.hasData == hasData)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.entryPrice, entryPrice) || other.entryPrice == entryPrice)&&(identical(other.targetPrice, targetPrice) || other.targetPrice == targetPrice)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&(identical(other.riskRewardRatio, riskRewardRatio) || other.riskRewardRatio == riskRewardRatio)&&(identical(other.probability, probability) || other.probability == probability)&&const DeepCollectionEquality().equals(other.reasoning, reasoning)&&(identical(other.disclaimer, disclaimer) || other.disclaimer == disclaimer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,asOf,hasData,signal,confidence,entryPrice,targetPrice,stopLoss,riskRewardRatio,probability,const DeepCollectionEquality().hash(reasoning),disclaimer);

@override
String toString() {
  return 'IntradaySignalDto(symbol: $symbol, asOf: $asOf, hasData: $hasData, signal: $signal, confidence: $confidence, entryPrice: $entryPrice, targetPrice: $targetPrice, stopLoss: $stopLoss, riskRewardRatio: $riskRewardRatio, probability: $probability, reasoning: $reasoning, disclaimer: $disclaimer)';
}


}

/// @nodoc
abstract mixin class $IntradaySignalDtoCopyWith<$Res>  {
  factory $IntradaySignalDtoCopyWith(IntradaySignalDto value, $Res Function(IntradaySignalDto) _then) = _$IntradaySignalDtoCopyWithImpl;
@useResult
$Res call({
 String symbol,@JsonKey(name: 'as_of') DateTime? asOf,@JsonKey(name: 'has_data') bool hasData, String signal,@DecimalConverter() Decimal confidence,@NullableDecimalConverter()@JsonKey(name: 'entry_price') Decimal? entryPrice,@NullableDecimalConverter()@JsonKey(name: 'target_price') Decimal? targetPrice,@NullableDecimalConverter()@JsonKey(name: 'stop_loss') Decimal? stopLoss,@NullableDecimalConverter()@JsonKey(name: 'risk_reward_ratio') Decimal? riskRewardRatio,@NullableDecimalConverter() Decimal? probability, List<String> reasoning, String disclaimer
});




}
/// @nodoc
class _$IntradaySignalDtoCopyWithImpl<$Res>
    implements $IntradaySignalDtoCopyWith<$Res> {
  _$IntradaySignalDtoCopyWithImpl(this._self, this._then);

  final IntradaySignalDto _self;
  final $Res Function(IntradaySignalDto) _then;

/// Create a copy of IntradaySignalDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? asOf = freezed,Object? hasData = null,Object? signal = null,Object? confidence = null,Object? entryPrice = freezed,Object? targetPrice = freezed,Object? stopLoss = freezed,Object? riskRewardRatio = freezed,Object? probability = freezed,Object? reasoning = null,Object? disclaimer = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,asOf: freezed == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime?,hasData: null == hasData ? _self.hasData : hasData // ignore: cast_nullable_to_non_nullable
as bool,signal: null == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as Decimal,entryPrice: freezed == entryPrice ? _self.entryPrice : entryPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,targetPrice: freezed == targetPrice ? _self.targetPrice : targetPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,stopLoss: freezed == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as Decimal?,riskRewardRatio: freezed == riskRewardRatio ? _self.riskRewardRatio : riskRewardRatio // ignore: cast_nullable_to_non_nullable
as Decimal?,probability: freezed == probability ? _self.probability : probability // ignore: cast_nullable_to_non_nullable
as Decimal?,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as List<String>,disclaimer: null == disclaimer ? _self.disclaimer : disclaimer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IntradaySignalDto].
extension IntradaySignalDtoPatterns on IntradaySignalDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IntradaySignalDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IntradaySignalDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IntradaySignalDto value)  $default,){
final _that = this;
switch (_that) {
case _IntradaySignalDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IntradaySignalDto value)?  $default,){
final _that = this;
switch (_that) {
case _IntradaySignalDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol, @JsonKey(name: 'as_of')  DateTime? asOf, @JsonKey(name: 'has_data')  bool hasData,  String signal, @DecimalConverter()  Decimal confidence, @NullableDecimalConverter()@JsonKey(name: 'entry_price')  Decimal? entryPrice, @NullableDecimalConverter()@JsonKey(name: 'target_price')  Decimal? targetPrice, @NullableDecimalConverter()@JsonKey(name: 'stop_loss')  Decimal? stopLoss, @NullableDecimalConverter()@JsonKey(name: 'risk_reward_ratio')  Decimal? riskRewardRatio, @NullableDecimalConverter()  Decimal? probability,  List<String> reasoning,  String disclaimer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IntradaySignalDto() when $default != null:
return $default(_that.symbol,_that.asOf,_that.hasData,_that.signal,_that.confidence,_that.entryPrice,_that.targetPrice,_that.stopLoss,_that.riskRewardRatio,_that.probability,_that.reasoning,_that.disclaimer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol, @JsonKey(name: 'as_of')  DateTime? asOf, @JsonKey(name: 'has_data')  bool hasData,  String signal, @DecimalConverter()  Decimal confidence, @NullableDecimalConverter()@JsonKey(name: 'entry_price')  Decimal? entryPrice, @NullableDecimalConverter()@JsonKey(name: 'target_price')  Decimal? targetPrice, @NullableDecimalConverter()@JsonKey(name: 'stop_loss')  Decimal? stopLoss, @NullableDecimalConverter()@JsonKey(name: 'risk_reward_ratio')  Decimal? riskRewardRatio, @NullableDecimalConverter()  Decimal? probability,  List<String> reasoning,  String disclaimer)  $default,) {final _that = this;
switch (_that) {
case _IntradaySignalDto():
return $default(_that.symbol,_that.asOf,_that.hasData,_that.signal,_that.confidence,_that.entryPrice,_that.targetPrice,_that.stopLoss,_that.riskRewardRatio,_that.probability,_that.reasoning,_that.disclaimer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol, @JsonKey(name: 'as_of')  DateTime? asOf, @JsonKey(name: 'has_data')  bool hasData,  String signal, @DecimalConverter()  Decimal confidence, @NullableDecimalConverter()@JsonKey(name: 'entry_price')  Decimal? entryPrice, @NullableDecimalConverter()@JsonKey(name: 'target_price')  Decimal? targetPrice, @NullableDecimalConverter()@JsonKey(name: 'stop_loss')  Decimal? stopLoss, @NullableDecimalConverter()@JsonKey(name: 'risk_reward_ratio')  Decimal? riskRewardRatio, @NullableDecimalConverter()  Decimal? probability,  List<String> reasoning,  String disclaimer)?  $default,) {final _that = this;
switch (_that) {
case _IntradaySignalDto() when $default != null:
return $default(_that.symbol,_that.asOf,_that.hasData,_that.signal,_that.confidence,_that.entryPrice,_that.targetPrice,_that.stopLoss,_that.riskRewardRatio,_that.probability,_that.reasoning,_that.disclaimer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IntradaySignalDto implements IntradaySignalDto {
  const _IntradaySignalDto({required this.symbol, @JsonKey(name: 'as_of') this.asOf, @JsonKey(name: 'has_data') this.hasData = false, this.signal = 'HOLD', @DecimalConverter() required this.confidence, @NullableDecimalConverter()@JsonKey(name: 'entry_price') this.entryPrice, @NullableDecimalConverter()@JsonKey(name: 'target_price') this.targetPrice, @NullableDecimalConverter()@JsonKey(name: 'stop_loss') this.stopLoss, @NullableDecimalConverter()@JsonKey(name: 'risk_reward_ratio') this.riskRewardRatio, @NullableDecimalConverter() this.probability, final  List<String> reasoning = const [], required this.disclaimer}): _reasoning = reasoning;
  factory _IntradaySignalDto.fromJson(Map<String, dynamic> json) => _$IntradaySignalDtoFromJson(json);

@override final  String symbol;
@override@JsonKey(name: 'as_of') final  DateTime? asOf;
@override@JsonKey(name: 'has_data') final  bool hasData;
@override@JsonKey() final  String signal;
@override@DecimalConverter() final  Decimal confidence;
@override@NullableDecimalConverter()@JsonKey(name: 'entry_price') final  Decimal? entryPrice;
@override@NullableDecimalConverter()@JsonKey(name: 'target_price') final  Decimal? targetPrice;
@override@NullableDecimalConverter()@JsonKey(name: 'stop_loss') final  Decimal? stopLoss;
@override@NullableDecimalConverter()@JsonKey(name: 'risk_reward_ratio') final  Decimal? riskRewardRatio;
@override@NullableDecimalConverter() final  Decimal? probability;
 final  List<String> _reasoning;
@override@JsonKey() List<String> get reasoning {
  if (_reasoning is EqualUnmodifiableListView) return _reasoning;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reasoning);
}

@override final  String disclaimer;

/// Create a copy of IntradaySignalDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IntradaySignalDtoCopyWith<_IntradaySignalDto> get copyWith => __$IntradaySignalDtoCopyWithImpl<_IntradaySignalDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IntradaySignalDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IntradaySignalDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.hasData, hasData) || other.hasData == hasData)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.entryPrice, entryPrice) || other.entryPrice == entryPrice)&&(identical(other.targetPrice, targetPrice) || other.targetPrice == targetPrice)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&(identical(other.riskRewardRatio, riskRewardRatio) || other.riskRewardRatio == riskRewardRatio)&&(identical(other.probability, probability) || other.probability == probability)&&const DeepCollectionEquality().equals(other._reasoning, _reasoning)&&(identical(other.disclaimer, disclaimer) || other.disclaimer == disclaimer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,asOf,hasData,signal,confidence,entryPrice,targetPrice,stopLoss,riskRewardRatio,probability,const DeepCollectionEquality().hash(_reasoning),disclaimer);

@override
String toString() {
  return 'IntradaySignalDto(symbol: $symbol, asOf: $asOf, hasData: $hasData, signal: $signal, confidence: $confidence, entryPrice: $entryPrice, targetPrice: $targetPrice, stopLoss: $stopLoss, riskRewardRatio: $riskRewardRatio, probability: $probability, reasoning: $reasoning, disclaimer: $disclaimer)';
}


}

/// @nodoc
abstract mixin class _$IntradaySignalDtoCopyWith<$Res> implements $IntradaySignalDtoCopyWith<$Res> {
  factory _$IntradaySignalDtoCopyWith(_IntradaySignalDto value, $Res Function(_IntradaySignalDto) _then) = __$IntradaySignalDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol,@JsonKey(name: 'as_of') DateTime? asOf,@JsonKey(name: 'has_data') bool hasData, String signal,@DecimalConverter() Decimal confidence,@NullableDecimalConverter()@JsonKey(name: 'entry_price') Decimal? entryPrice,@NullableDecimalConverter()@JsonKey(name: 'target_price') Decimal? targetPrice,@NullableDecimalConverter()@JsonKey(name: 'stop_loss') Decimal? stopLoss,@NullableDecimalConverter()@JsonKey(name: 'risk_reward_ratio') Decimal? riskRewardRatio,@NullableDecimalConverter() Decimal? probability, List<String> reasoning, String disclaimer
});




}
/// @nodoc
class __$IntradaySignalDtoCopyWithImpl<$Res>
    implements _$IntradaySignalDtoCopyWith<$Res> {
  __$IntradaySignalDtoCopyWithImpl(this._self, this._then);

  final _IntradaySignalDto _self;
  final $Res Function(_IntradaySignalDto) _then;

/// Create a copy of IntradaySignalDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? asOf = freezed,Object? hasData = null,Object? signal = null,Object? confidence = null,Object? entryPrice = freezed,Object? targetPrice = freezed,Object? stopLoss = freezed,Object? riskRewardRatio = freezed,Object? probability = freezed,Object? reasoning = null,Object? disclaimer = null,}) {
  return _then(_IntradaySignalDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,asOf: freezed == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime?,hasData: null == hasData ? _self.hasData : hasData // ignore: cast_nullable_to_non_nullable
as bool,signal: null == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as Decimal,entryPrice: freezed == entryPrice ? _self.entryPrice : entryPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,targetPrice: freezed == targetPrice ? _self.targetPrice : targetPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,stopLoss: freezed == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as Decimal?,riskRewardRatio: freezed == riskRewardRatio ? _self.riskRewardRatio : riskRewardRatio // ignore: cast_nullable_to_non_nullable
as Decimal?,probability: freezed == probability ? _self.probability : probability // ignore: cast_nullable_to_non_nullable
as Decimal?,reasoning: null == reasoning ? _self._reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as List<String>,disclaimer: null == disclaimer ? _self.disclaimer : disclaimer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
