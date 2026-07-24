// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dividend_recommendation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DividendRecommendationDto {

 String get symbol; String get name;@DecimalConverter()@JsonKey(name: 'dividend_yield') Decimal get dividendYield;@DecimalConverter()@JsonKey(name: 'dividend_amount') Decimal get dividendAmount;@JsonKey(name: 'ex_dividend_date') DateTime get exDividendDate;@JsonKey(name: 'buy_before_date') DateTime get buyBeforeDate; String get recommendation;@JsonKey(name: 'risk_level') String get riskLevel; int get confidence;
/// Create a copy of DividendRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DividendRecommendationDtoCopyWith<DividendRecommendationDto> get copyWith => _$DividendRecommendationDtoCopyWithImpl<DividendRecommendationDto>(this as DividendRecommendationDto, _$identity);

  /// Serializes this DividendRecommendationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DividendRecommendationDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.dividendYield, dividendYield) || other.dividendYield == dividendYield)&&(identical(other.dividendAmount, dividendAmount) || other.dividendAmount == dividendAmount)&&(identical(other.exDividendDate, exDividendDate) || other.exDividendDate == exDividendDate)&&(identical(other.buyBeforeDate, buyBeforeDate) || other.buyBeforeDate == buyBeforeDate)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,dividendYield,dividendAmount,exDividendDate,buyBeforeDate,recommendation,riskLevel,confidence);

@override
String toString() {
  return 'DividendRecommendationDto(symbol: $symbol, name: $name, dividendYield: $dividendYield, dividendAmount: $dividendAmount, exDividendDate: $exDividendDate, buyBeforeDate: $buyBeforeDate, recommendation: $recommendation, riskLevel: $riskLevel, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class $DividendRecommendationDtoCopyWith<$Res>  {
  factory $DividendRecommendationDtoCopyWith(DividendRecommendationDto value, $Res Function(DividendRecommendationDto) _then) = _$DividendRecommendationDtoCopyWithImpl;
@useResult
$Res call({
 String symbol, String name,@DecimalConverter()@JsonKey(name: 'dividend_yield') Decimal dividendYield,@DecimalConverter()@JsonKey(name: 'dividend_amount') Decimal dividendAmount,@JsonKey(name: 'ex_dividend_date') DateTime exDividendDate,@JsonKey(name: 'buy_before_date') DateTime buyBeforeDate, String recommendation,@JsonKey(name: 'risk_level') String riskLevel, int confidence
});




}
/// @nodoc
class _$DividendRecommendationDtoCopyWithImpl<$Res>
    implements $DividendRecommendationDtoCopyWith<$Res> {
  _$DividendRecommendationDtoCopyWithImpl(this._self, this._then);

  final DividendRecommendationDto _self;
  final $Res Function(DividendRecommendationDto) _then;

/// Create a copy of DividendRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? dividendYield = null,Object? dividendAmount = null,Object? exDividendDate = null,Object? buyBeforeDate = null,Object? recommendation = null,Object? riskLevel = null,Object? confidence = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dividendYield: null == dividendYield ? _self.dividendYield : dividendYield // ignore: cast_nullable_to_non_nullable
as Decimal,dividendAmount: null == dividendAmount ? _self.dividendAmount : dividendAmount // ignore: cast_nullable_to_non_nullable
as Decimal,exDividendDate: null == exDividendDate ? _self.exDividendDate : exDividendDate // ignore: cast_nullable_to_non_nullable
as DateTime,buyBeforeDate: null == buyBeforeDate ? _self.buyBeforeDate : buyBeforeDate // ignore: cast_nullable_to_non_nullable
as DateTime,recommendation: null == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DividendRecommendationDto].
extension DividendRecommendationDtoPatterns on DividendRecommendationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DividendRecommendationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DividendRecommendationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DividendRecommendationDto value)  $default,){
final _that = this;
switch (_that) {
case _DividendRecommendationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DividendRecommendationDto value)?  $default,){
final _that = this;
switch (_that) {
case _DividendRecommendationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name, @DecimalConverter()@JsonKey(name: 'dividend_yield')  Decimal dividendYield, @DecimalConverter()@JsonKey(name: 'dividend_amount')  Decimal dividendAmount, @JsonKey(name: 'ex_dividend_date')  DateTime exDividendDate, @JsonKey(name: 'buy_before_date')  DateTime buyBeforeDate,  String recommendation, @JsonKey(name: 'risk_level')  String riskLevel,  int confidence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DividendRecommendationDto() when $default != null:
return $default(_that.symbol,_that.name,_that.dividendYield,_that.dividendAmount,_that.exDividendDate,_that.buyBeforeDate,_that.recommendation,_that.riskLevel,_that.confidence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name, @DecimalConverter()@JsonKey(name: 'dividend_yield')  Decimal dividendYield, @DecimalConverter()@JsonKey(name: 'dividend_amount')  Decimal dividendAmount, @JsonKey(name: 'ex_dividend_date')  DateTime exDividendDate, @JsonKey(name: 'buy_before_date')  DateTime buyBeforeDate,  String recommendation, @JsonKey(name: 'risk_level')  String riskLevel,  int confidence)  $default,) {final _that = this;
switch (_that) {
case _DividendRecommendationDto():
return $default(_that.symbol,_that.name,_that.dividendYield,_that.dividendAmount,_that.exDividendDate,_that.buyBeforeDate,_that.recommendation,_that.riskLevel,_that.confidence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name, @DecimalConverter()@JsonKey(name: 'dividend_yield')  Decimal dividendYield, @DecimalConverter()@JsonKey(name: 'dividend_amount')  Decimal dividendAmount, @JsonKey(name: 'ex_dividend_date')  DateTime exDividendDate, @JsonKey(name: 'buy_before_date')  DateTime buyBeforeDate,  String recommendation, @JsonKey(name: 'risk_level')  String riskLevel,  int confidence)?  $default,) {final _that = this;
switch (_that) {
case _DividendRecommendationDto() when $default != null:
return $default(_that.symbol,_that.name,_that.dividendYield,_that.dividendAmount,_that.exDividendDate,_that.buyBeforeDate,_that.recommendation,_that.riskLevel,_that.confidence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DividendRecommendationDto implements DividendRecommendationDto {
  const _DividendRecommendationDto({required this.symbol, required this.name, @DecimalConverter()@JsonKey(name: 'dividend_yield') required this.dividendYield, @DecimalConverter()@JsonKey(name: 'dividend_amount') required this.dividendAmount, @JsonKey(name: 'ex_dividend_date') required this.exDividendDate, @JsonKey(name: 'buy_before_date') required this.buyBeforeDate, required this.recommendation, @JsonKey(name: 'risk_level') required this.riskLevel, required this.confidence});
  factory _DividendRecommendationDto.fromJson(Map<String, dynamic> json) => _$DividendRecommendationDtoFromJson(json);

@override final  String symbol;
@override final  String name;
@override@DecimalConverter()@JsonKey(name: 'dividend_yield') final  Decimal dividendYield;
@override@DecimalConverter()@JsonKey(name: 'dividend_amount') final  Decimal dividendAmount;
@override@JsonKey(name: 'ex_dividend_date') final  DateTime exDividendDate;
@override@JsonKey(name: 'buy_before_date') final  DateTime buyBeforeDate;
@override final  String recommendation;
@override@JsonKey(name: 'risk_level') final  String riskLevel;
@override final  int confidence;

/// Create a copy of DividendRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DividendRecommendationDtoCopyWith<_DividendRecommendationDto> get copyWith => __$DividendRecommendationDtoCopyWithImpl<_DividendRecommendationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DividendRecommendationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DividendRecommendationDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.dividendYield, dividendYield) || other.dividendYield == dividendYield)&&(identical(other.dividendAmount, dividendAmount) || other.dividendAmount == dividendAmount)&&(identical(other.exDividendDate, exDividendDate) || other.exDividendDate == exDividendDate)&&(identical(other.buyBeforeDate, buyBeforeDate) || other.buyBeforeDate == buyBeforeDate)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,dividendYield,dividendAmount,exDividendDate,buyBeforeDate,recommendation,riskLevel,confidence);

@override
String toString() {
  return 'DividendRecommendationDto(symbol: $symbol, name: $name, dividendYield: $dividendYield, dividendAmount: $dividendAmount, exDividendDate: $exDividendDate, buyBeforeDate: $buyBeforeDate, recommendation: $recommendation, riskLevel: $riskLevel, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class _$DividendRecommendationDtoCopyWith<$Res> implements $DividendRecommendationDtoCopyWith<$Res> {
  factory _$DividendRecommendationDtoCopyWith(_DividendRecommendationDto value, $Res Function(_DividendRecommendationDto) _then) = __$DividendRecommendationDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name,@DecimalConverter()@JsonKey(name: 'dividend_yield') Decimal dividendYield,@DecimalConverter()@JsonKey(name: 'dividend_amount') Decimal dividendAmount,@JsonKey(name: 'ex_dividend_date') DateTime exDividendDate,@JsonKey(name: 'buy_before_date') DateTime buyBeforeDate, String recommendation,@JsonKey(name: 'risk_level') String riskLevel, int confidence
});




}
/// @nodoc
class __$DividendRecommendationDtoCopyWithImpl<$Res>
    implements _$DividendRecommendationDtoCopyWith<$Res> {
  __$DividendRecommendationDtoCopyWithImpl(this._self, this._then);

  final _DividendRecommendationDto _self;
  final $Res Function(_DividendRecommendationDto) _then;

/// Create a copy of DividendRecommendationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? dividendYield = null,Object? dividendAmount = null,Object? exDividendDate = null,Object? buyBeforeDate = null,Object? recommendation = null,Object? riskLevel = null,Object? confidence = null,}) {
  return _then(_DividendRecommendationDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dividendYield: null == dividendYield ? _self.dividendYield : dividendYield // ignore: cast_nullable_to_non_nullable
as Decimal,dividendAmount: null == dividendAmount ? _self.dividendAmount : dividendAmount // ignore: cast_nullable_to_non_nullable
as Decimal,exDividendDate: null == exDividendDate ? _self.exDividendDate : exDividendDate // ignore: cast_nullable_to_non_nullable
as DateTime,buyBeforeDate: null == buyBeforeDate ? _self.buyBeforeDate : buyBeforeDate // ignore: cast_nullable_to_non_nullable
as DateTime,recommendation: null == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
