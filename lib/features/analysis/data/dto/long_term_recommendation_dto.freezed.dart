// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'long_term_recommendation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LongTermRecommendationDto {

 String get symbol; String get name;@JsonKey(name: 'as_of') DateTime get asOf; String get signal; int get confidence;// plain int, not Decimal - confirmed from backend schema
@JsonKey(name: 'risk_level') String get riskLevel;@JsonKey(name: 'growth_potential') String get growthPotential;@JsonKey(name: 'investment_tenure') String get investmentTenure; List<String> get reasoning;
/// Create a copy of LongTermRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LongTermRecommendationDtoCopyWith<LongTermRecommendationDto> get copyWith => _$LongTermRecommendationDtoCopyWithImpl<LongTermRecommendationDto>(this as LongTermRecommendationDto, _$identity);

  /// Serializes this LongTermRecommendationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LongTermRecommendationDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.growthPotential, growthPotential) || other.growthPotential == growthPotential)&&(identical(other.investmentTenure, investmentTenure) || other.investmentTenure == investmentTenure)&&const DeepCollectionEquality().equals(other.reasoning, reasoning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,asOf,signal,confidence,riskLevel,growthPotential,investmentTenure,const DeepCollectionEquality().hash(reasoning));

@override
String toString() {
  return 'LongTermRecommendationDto(symbol: $symbol, name: $name, asOf: $asOf, signal: $signal, confidence: $confidence, riskLevel: $riskLevel, growthPotential: $growthPotential, investmentTenure: $investmentTenure, reasoning: $reasoning)';
}


}

/// @nodoc
abstract mixin class $LongTermRecommendationDtoCopyWith<$Res>  {
  factory $LongTermRecommendationDtoCopyWith(LongTermRecommendationDto value, $Res Function(LongTermRecommendationDto) _then) = _$LongTermRecommendationDtoCopyWithImpl;
@useResult
$Res call({
 String symbol, String name,@JsonKey(name: 'as_of') DateTime asOf, String signal, int confidence,@JsonKey(name: 'risk_level') String riskLevel,@JsonKey(name: 'growth_potential') String growthPotential,@JsonKey(name: 'investment_tenure') String investmentTenure, List<String> reasoning
});




}
/// @nodoc
class _$LongTermRecommendationDtoCopyWithImpl<$Res>
    implements $LongTermRecommendationDtoCopyWith<$Res> {
  _$LongTermRecommendationDtoCopyWithImpl(this._self, this._then);

  final LongTermRecommendationDto _self;
  final $Res Function(LongTermRecommendationDto) _then;

/// Create a copy of LongTermRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? asOf = null,Object? signal = null,Object? confidence = null,Object? riskLevel = null,Object? growthPotential = null,Object? investmentTenure = null,Object? reasoning = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,signal: null == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as int,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,growthPotential: null == growthPotential ? _self.growthPotential : growthPotential // ignore: cast_nullable_to_non_nullable
as String,investmentTenure: null == investmentTenure ? _self.investmentTenure : investmentTenure // ignore: cast_nullable_to_non_nullable
as String,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [LongTermRecommendationDto].
extension LongTermRecommendationDtoPatterns on LongTermRecommendationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LongTermRecommendationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LongTermRecommendationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LongTermRecommendationDto value)  $default,){
final _that = this;
switch (_that) {
case _LongTermRecommendationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LongTermRecommendationDto value)?  $default,){
final _that = this;
switch (_that) {
case _LongTermRecommendationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name, @JsonKey(name: 'as_of')  DateTime asOf,  String signal,  int confidence, @JsonKey(name: 'risk_level')  String riskLevel, @JsonKey(name: 'growth_potential')  String growthPotential, @JsonKey(name: 'investment_tenure')  String investmentTenure,  List<String> reasoning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LongTermRecommendationDto() when $default != null:
return $default(_that.symbol,_that.name,_that.asOf,_that.signal,_that.confidence,_that.riskLevel,_that.growthPotential,_that.investmentTenure,_that.reasoning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name, @JsonKey(name: 'as_of')  DateTime asOf,  String signal,  int confidence, @JsonKey(name: 'risk_level')  String riskLevel, @JsonKey(name: 'growth_potential')  String growthPotential, @JsonKey(name: 'investment_tenure')  String investmentTenure,  List<String> reasoning)  $default,) {final _that = this;
switch (_that) {
case _LongTermRecommendationDto():
return $default(_that.symbol,_that.name,_that.asOf,_that.signal,_that.confidence,_that.riskLevel,_that.growthPotential,_that.investmentTenure,_that.reasoning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name, @JsonKey(name: 'as_of')  DateTime asOf,  String signal,  int confidence, @JsonKey(name: 'risk_level')  String riskLevel, @JsonKey(name: 'growth_potential')  String growthPotential, @JsonKey(name: 'investment_tenure')  String investmentTenure,  List<String> reasoning)?  $default,) {final _that = this;
switch (_that) {
case _LongTermRecommendationDto() when $default != null:
return $default(_that.symbol,_that.name,_that.asOf,_that.signal,_that.confidence,_that.riskLevel,_that.growthPotential,_that.investmentTenure,_that.reasoning);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LongTermRecommendationDto implements LongTermRecommendationDto {
  const _LongTermRecommendationDto({required this.symbol, required this.name, @JsonKey(name: 'as_of') required this.asOf, required this.signal, required this.confidence, @JsonKey(name: 'risk_level') required this.riskLevel, @JsonKey(name: 'growth_potential') required this.growthPotential, @JsonKey(name: 'investment_tenure') required this.investmentTenure, final  List<String> reasoning = const []}): _reasoning = reasoning;
  factory _LongTermRecommendationDto.fromJson(Map<String, dynamic> json) => _$LongTermRecommendationDtoFromJson(json);

@override final  String symbol;
@override final  String name;
@override@JsonKey(name: 'as_of') final  DateTime asOf;
@override final  String signal;
@override final  int confidence;
// plain int, not Decimal - confirmed from backend schema
@override@JsonKey(name: 'risk_level') final  String riskLevel;
@override@JsonKey(name: 'growth_potential') final  String growthPotential;
@override@JsonKey(name: 'investment_tenure') final  String investmentTenure;
 final  List<String> _reasoning;
@override@JsonKey() List<String> get reasoning {
  if (_reasoning is EqualUnmodifiableListView) return _reasoning;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reasoning);
}


/// Create a copy of LongTermRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LongTermRecommendationDtoCopyWith<_LongTermRecommendationDto> get copyWith => __$LongTermRecommendationDtoCopyWithImpl<_LongTermRecommendationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LongTermRecommendationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LongTermRecommendationDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.growthPotential, growthPotential) || other.growthPotential == growthPotential)&&(identical(other.investmentTenure, investmentTenure) || other.investmentTenure == investmentTenure)&&const DeepCollectionEquality().equals(other._reasoning, _reasoning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,asOf,signal,confidence,riskLevel,growthPotential,investmentTenure,const DeepCollectionEquality().hash(_reasoning));

@override
String toString() {
  return 'LongTermRecommendationDto(symbol: $symbol, name: $name, asOf: $asOf, signal: $signal, confidence: $confidence, riskLevel: $riskLevel, growthPotential: $growthPotential, investmentTenure: $investmentTenure, reasoning: $reasoning)';
}


}

/// @nodoc
abstract mixin class _$LongTermRecommendationDtoCopyWith<$Res> implements $LongTermRecommendationDtoCopyWith<$Res> {
  factory _$LongTermRecommendationDtoCopyWith(_LongTermRecommendationDto value, $Res Function(_LongTermRecommendationDto) _then) = __$LongTermRecommendationDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name,@JsonKey(name: 'as_of') DateTime asOf, String signal, int confidence,@JsonKey(name: 'risk_level') String riskLevel,@JsonKey(name: 'growth_potential') String growthPotential,@JsonKey(name: 'investment_tenure') String investmentTenure, List<String> reasoning
});




}
/// @nodoc
class __$LongTermRecommendationDtoCopyWithImpl<$Res>
    implements _$LongTermRecommendationDtoCopyWith<$Res> {
  __$LongTermRecommendationDtoCopyWithImpl(this._self, this._then);

  final _LongTermRecommendationDto _self;
  final $Res Function(_LongTermRecommendationDto) _then;

/// Create a copy of LongTermRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? asOf = null,Object? signal = null,Object? confidence = null,Object? riskLevel = null,Object? growthPotential = null,Object? investmentTenure = null,Object? reasoning = null,}) {
  return _then(_LongTermRecommendationDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,signal: null == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as int,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,growthPotential: null == growthPotential ? _self.growthPotential : growthPotential // ignore: cast_nullable_to_non_nullable
as String,investmentTenure: null == investmentTenure ? _self.investmentTenure : investmentTenure // ignore: cast_nullable_to_non_nullable
as String,reasoning: null == reasoning ? _self._reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
