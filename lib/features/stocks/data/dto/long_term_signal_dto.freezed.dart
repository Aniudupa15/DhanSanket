// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'long_term_signal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LongTermSignalDto {

 String get symbol;@JsonKey(name: 'has_data') bool get hasData; String get signal; int get confidence;// plain int, not Decimal - confirmed from backend schema
@JsonKey(name: 'investment_horizon') String get investmentHorizon;@JsonKey(name: 'risk_level') String get riskLevel;@JsonKey(name: 'growth_potential') String get growthPotential; List<String> get strengths; List<String> get weaknesses; List<String> get opportunities; List<String> get risks; List<String> get reasoning; String get disclaimer;
/// Create a copy of LongTermSignalDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LongTermSignalDtoCopyWith<LongTermSignalDto> get copyWith => _$LongTermSignalDtoCopyWithImpl<LongTermSignalDto>(this as LongTermSignalDto, _$identity);

  /// Serializes this LongTermSignalDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LongTermSignalDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.hasData, hasData) || other.hasData == hasData)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.investmentHorizon, investmentHorizon) || other.investmentHorizon == investmentHorizon)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.growthPotential, growthPotential) || other.growthPotential == growthPotential)&&const DeepCollectionEquality().equals(other.strengths, strengths)&&const DeepCollectionEquality().equals(other.weaknesses, weaknesses)&&const DeepCollectionEquality().equals(other.opportunities, opportunities)&&const DeepCollectionEquality().equals(other.risks, risks)&&const DeepCollectionEquality().equals(other.reasoning, reasoning)&&(identical(other.disclaimer, disclaimer) || other.disclaimer == disclaimer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,hasData,signal,confidence,investmentHorizon,riskLevel,growthPotential,const DeepCollectionEquality().hash(strengths),const DeepCollectionEquality().hash(weaknesses),const DeepCollectionEquality().hash(opportunities),const DeepCollectionEquality().hash(risks),const DeepCollectionEquality().hash(reasoning),disclaimer);

@override
String toString() {
  return 'LongTermSignalDto(symbol: $symbol, hasData: $hasData, signal: $signal, confidence: $confidence, investmentHorizon: $investmentHorizon, riskLevel: $riskLevel, growthPotential: $growthPotential, strengths: $strengths, weaknesses: $weaknesses, opportunities: $opportunities, risks: $risks, reasoning: $reasoning, disclaimer: $disclaimer)';
}


}

/// @nodoc
abstract mixin class $LongTermSignalDtoCopyWith<$Res>  {
  factory $LongTermSignalDtoCopyWith(LongTermSignalDto value, $Res Function(LongTermSignalDto) _then) = _$LongTermSignalDtoCopyWithImpl;
@useResult
$Res call({
 String symbol,@JsonKey(name: 'has_data') bool hasData, String signal, int confidence,@JsonKey(name: 'investment_horizon') String investmentHorizon,@JsonKey(name: 'risk_level') String riskLevel,@JsonKey(name: 'growth_potential') String growthPotential, List<String> strengths, List<String> weaknesses, List<String> opportunities, List<String> risks, List<String> reasoning, String disclaimer
});




}
/// @nodoc
class _$LongTermSignalDtoCopyWithImpl<$Res>
    implements $LongTermSignalDtoCopyWith<$Res> {
  _$LongTermSignalDtoCopyWithImpl(this._self, this._then);

  final LongTermSignalDto _self;
  final $Res Function(LongTermSignalDto) _then;

/// Create a copy of LongTermSignalDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? hasData = null,Object? signal = null,Object? confidence = null,Object? investmentHorizon = null,Object? riskLevel = null,Object? growthPotential = null,Object? strengths = null,Object? weaknesses = null,Object? opportunities = null,Object? risks = null,Object? reasoning = null,Object? disclaimer = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,hasData: null == hasData ? _self.hasData : hasData // ignore: cast_nullable_to_non_nullable
as bool,signal: null == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as int,investmentHorizon: null == investmentHorizon ? _self.investmentHorizon : investmentHorizon // ignore: cast_nullable_to_non_nullable
as String,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,growthPotential: null == growthPotential ? _self.growthPotential : growthPotential // ignore: cast_nullable_to_non_nullable
as String,strengths: null == strengths ? _self.strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<String>,weaknesses: null == weaknesses ? _self.weaknesses : weaknesses // ignore: cast_nullable_to_non_nullable
as List<String>,opportunities: null == opportunities ? _self.opportunities : opportunities // ignore: cast_nullable_to_non_nullable
as List<String>,risks: null == risks ? _self.risks : risks // ignore: cast_nullable_to_non_nullable
as List<String>,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as List<String>,disclaimer: null == disclaimer ? _self.disclaimer : disclaimer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LongTermSignalDto].
extension LongTermSignalDtoPatterns on LongTermSignalDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LongTermSignalDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LongTermSignalDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LongTermSignalDto value)  $default,){
final _that = this;
switch (_that) {
case _LongTermSignalDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LongTermSignalDto value)?  $default,){
final _that = this;
switch (_that) {
case _LongTermSignalDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol, @JsonKey(name: 'has_data')  bool hasData,  String signal,  int confidence, @JsonKey(name: 'investment_horizon')  String investmentHorizon, @JsonKey(name: 'risk_level')  String riskLevel, @JsonKey(name: 'growth_potential')  String growthPotential,  List<String> strengths,  List<String> weaknesses,  List<String> opportunities,  List<String> risks,  List<String> reasoning,  String disclaimer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LongTermSignalDto() when $default != null:
return $default(_that.symbol,_that.hasData,_that.signal,_that.confidence,_that.investmentHorizon,_that.riskLevel,_that.growthPotential,_that.strengths,_that.weaknesses,_that.opportunities,_that.risks,_that.reasoning,_that.disclaimer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol, @JsonKey(name: 'has_data')  bool hasData,  String signal,  int confidence, @JsonKey(name: 'investment_horizon')  String investmentHorizon, @JsonKey(name: 'risk_level')  String riskLevel, @JsonKey(name: 'growth_potential')  String growthPotential,  List<String> strengths,  List<String> weaknesses,  List<String> opportunities,  List<String> risks,  List<String> reasoning,  String disclaimer)  $default,) {final _that = this;
switch (_that) {
case _LongTermSignalDto():
return $default(_that.symbol,_that.hasData,_that.signal,_that.confidence,_that.investmentHorizon,_that.riskLevel,_that.growthPotential,_that.strengths,_that.weaknesses,_that.opportunities,_that.risks,_that.reasoning,_that.disclaimer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol, @JsonKey(name: 'has_data')  bool hasData,  String signal,  int confidence, @JsonKey(name: 'investment_horizon')  String investmentHorizon, @JsonKey(name: 'risk_level')  String riskLevel, @JsonKey(name: 'growth_potential')  String growthPotential,  List<String> strengths,  List<String> weaknesses,  List<String> opportunities,  List<String> risks,  List<String> reasoning,  String disclaimer)?  $default,) {final _that = this;
switch (_that) {
case _LongTermSignalDto() when $default != null:
return $default(_that.symbol,_that.hasData,_that.signal,_that.confidence,_that.investmentHorizon,_that.riskLevel,_that.growthPotential,_that.strengths,_that.weaknesses,_that.opportunities,_that.risks,_that.reasoning,_that.disclaimer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LongTermSignalDto implements LongTermSignalDto {
  const _LongTermSignalDto({required this.symbol, @JsonKey(name: 'has_data') this.hasData = false, this.signal = 'HOLD', this.confidence = 0, @JsonKey(name: 'investment_horizon') this.investmentHorizon = 'Long-term (1-3+ years)', @JsonKey(name: 'risk_level') this.riskLevel = 'Unknown', @JsonKey(name: 'growth_potential') this.growthPotential = 'Unknown', final  List<String> strengths = const [], final  List<String> weaknesses = const [], final  List<String> opportunities = const [], final  List<String> risks = const [], final  List<String> reasoning = const [], required this.disclaimer}): _strengths = strengths,_weaknesses = weaknesses,_opportunities = opportunities,_risks = risks,_reasoning = reasoning;
  factory _LongTermSignalDto.fromJson(Map<String, dynamic> json) => _$LongTermSignalDtoFromJson(json);

@override final  String symbol;
@override@JsonKey(name: 'has_data') final  bool hasData;
@override@JsonKey() final  String signal;
@override@JsonKey() final  int confidence;
// plain int, not Decimal - confirmed from backend schema
@override@JsonKey(name: 'investment_horizon') final  String investmentHorizon;
@override@JsonKey(name: 'risk_level') final  String riskLevel;
@override@JsonKey(name: 'growth_potential') final  String growthPotential;
 final  List<String> _strengths;
@override@JsonKey() List<String> get strengths {
  if (_strengths is EqualUnmodifiableListView) return _strengths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_strengths);
}

 final  List<String> _weaknesses;
@override@JsonKey() List<String> get weaknesses {
  if (_weaknesses is EqualUnmodifiableListView) return _weaknesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weaknesses);
}

 final  List<String> _opportunities;
@override@JsonKey() List<String> get opportunities {
  if (_opportunities is EqualUnmodifiableListView) return _opportunities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_opportunities);
}

 final  List<String> _risks;
@override@JsonKey() List<String> get risks {
  if (_risks is EqualUnmodifiableListView) return _risks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_risks);
}

 final  List<String> _reasoning;
@override@JsonKey() List<String> get reasoning {
  if (_reasoning is EqualUnmodifiableListView) return _reasoning;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reasoning);
}

@override final  String disclaimer;

/// Create a copy of LongTermSignalDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LongTermSignalDtoCopyWith<_LongTermSignalDto> get copyWith => __$LongTermSignalDtoCopyWithImpl<_LongTermSignalDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LongTermSignalDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LongTermSignalDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.hasData, hasData) || other.hasData == hasData)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.investmentHorizon, investmentHorizon) || other.investmentHorizon == investmentHorizon)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.growthPotential, growthPotential) || other.growthPotential == growthPotential)&&const DeepCollectionEquality().equals(other._strengths, _strengths)&&const DeepCollectionEquality().equals(other._weaknesses, _weaknesses)&&const DeepCollectionEquality().equals(other._opportunities, _opportunities)&&const DeepCollectionEquality().equals(other._risks, _risks)&&const DeepCollectionEquality().equals(other._reasoning, _reasoning)&&(identical(other.disclaimer, disclaimer) || other.disclaimer == disclaimer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,hasData,signal,confidence,investmentHorizon,riskLevel,growthPotential,const DeepCollectionEquality().hash(_strengths),const DeepCollectionEquality().hash(_weaknesses),const DeepCollectionEquality().hash(_opportunities),const DeepCollectionEquality().hash(_risks),const DeepCollectionEquality().hash(_reasoning),disclaimer);

@override
String toString() {
  return 'LongTermSignalDto(symbol: $symbol, hasData: $hasData, signal: $signal, confidence: $confidence, investmentHorizon: $investmentHorizon, riskLevel: $riskLevel, growthPotential: $growthPotential, strengths: $strengths, weaknesses: $weaknesses, opportunities: $opportunities, risks: $risks, reasoning: $reasoning, disclaimer: $disclaimer)';
}


}

/// @nodoc
abstract mixin class _$LongTermSignalDtoCopyWith<$Res> implements $LongTermSignalDtoCopyWith<$Res> {
  factory _$LongTermSignalDtoCopyWith(_LongTermSignalDto value, $Res Function(_LongTermSignalDto) _then) = __$LongTermSignalDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol,@JsonKey(name: 'has_data') bool hasData, String signal, int confidence,@JsonKey(name: 'investment_horizon') String investmentHorizon,@JsonKey(name: 'risk_level') String riskLevel,@JsonKey(name: 'growth_potential') String growthPotential, List<String> strengths, List<String> weaknesses, List<String> opportunities, List<String> risks, List<String> reasoning, String disclaimer
});




}
/// @nodoc
class __$LongTermSignalDtoCopyWithImpl<$Res>
    implements _$LongTermSignalDtoCopyWith<$Res> {
  __$LongTermSignalDtoCopyWithImpl(this._self, this._then);

  final _LongTermSignalDto _self;
  final $Res Function(_LongTermSignalDto) _then;

/// Create a copy of LongTermSignalDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? hasData = null,Object? signal = null,Object? confidence = null,Object? investmentHorizon = null,Object? riskLevel = null,Object? growthPotential = null,Object? strengths = null,Object? weaknesses = null,Object? opportunities = null,Object? risks = null,Object? reasoning = null,Object? disclaimer = null,}) {
  return _then(_LongTermSignalDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,hasData: null == hasData ? _self.hasData : hasData // ignore: cast_nullable_to_non_nullable
as bool,signal: null == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as int,investmentHorizon: null == investmentHorizon ? _self.investmentHorizon : investmentHorizon // ignore: cast_nullable_to_non_nullable
as String,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,growthPotential: null == growthPotential ? _self.growthPotential : growthPotential // ignore: cast_nullable_to_non_nullable
as String,strengths: null == strengths ? _self._strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<String>,weaknesses: null == weaknesses ? _self._weaknesses : weaknesses // ignore: cast_nullable_to_non_nullable
as List<String>,opportunities: null == opportunities ? _self._opportunities : opportunities // ignore: cast_nullable_to_non_nullable
as List<String>,risks: null == risks ? _self._risks : risks // ignore: cast_nullable_to_non_nullable
as List<String>,reasoning: null == reasoning ? _self._reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as List<String>,disclaimer: null == disclaimer ? _self.disclaimer : disclaimer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
