// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fundamentals_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FundamentalsDto {

 String get symbol;@JsonKey(name: 'has_data') bool get hasData;@JsonKey(name: 'latest_period_end') DateTime? get latestPeriodEnd;@NullableDecimalConverter()@JsonKey(name: 'revenue_growth_yoy') Decimal? get revenueGrowthYoy;@NullableDecimalConverter()@JsonKey(name: 'revenue_growth_qoq') Decimal? get revenueGrowthQoq;@NullableDecimalConverter()@JsonKey(name: 'profit_growth_yoy') Decimal? get profitGrowthYoy;@NullableDecimalConverter()@JsonKey(name: 'profit_growth_qoq') Decimal? get profitGrowthQoq;@NullableDecimalConverter()@JsonKey(name: 'ttm_eps') Decimal? get ttmEps;@NullableDecimalConverter()@JsonKey(name: 'pe_ratio') Decimal? get peRatio;@NullableDecimalConverter()@JsonKey(name: 'dividend_yield') Decimal? get dividendYield;@NullableDecimalConverter()@JsonKey(name: 'book_value') Decimal? get bookValue;@NullableDecimalConverter() Decimal? get roe;@NullableDecimalConverter() Decimal? get roce;@NullableDecimalConverter()@JsonKey(name: 'debt_to_equity') Decimal? get debtToEquity;
/// Create a copy of FundamentalsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FundamentalsDtoCopyWith<FundamentalsDto> get copyWith => _$FundamentalsDtoCopyWithImpl<FundamentalsDto>(this as FundamentalsDto, _$identity);

  /// Serializes this FundamentalsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FundamentalsDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.hasData, hasData) || other.hasData == hasData)&&(identical(other.latestPeriodEnd, latestPeriodEnd) || other.latestPeriodEnd == latestPeriodEnd)&&(identical(other.revenueGrowthYoy, revenueGrowthYoy) || other.revenueGrowthYoy == revenueGrowthYoy)&&(identical(other.revenueGrowthQoq, revenueGrowthQoq) || other.revenueGrowthQoq == revenueGrowthQoq)&&(identical(other.profitGrowthYoy, profitGrowthYoy) || other.profitGrowthYoy == profitGrowthYoy)&&(identical(other.profitGrowthQoq, profitGrowthQoq) || other.profitGrowthQoq == profitGrowthQoq)&&(identical(other.ttmEps, ttmEps) || other.ttmEps == ttmEps)&&(identical(other.peRatio, peRatio) || other.peRatio == peRatio)&&(identical(other.dividendYield, dividendYield) || other.dividendYield == dividendYield)&&(identical(other.bookValue, bookValue) || other.bookValue == bookValue)&&(identical(other.roe, roe) || other.roe == roe)&&(identical(other.roce, roce) || other.roce == roce)&&(identical(other.debtToEquity, debtToEquity) || other.debtToEquity == debtToEquity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,hasData,latestPeriodEnd,revenueGrowthYoy,revenueGrowthQoq,profitGrowthYoy,profitGrowthQoq,ttmEps,peRatio,dividendYield,bookValue,roe,roce,debtToEquity);

@override
String toString() {
  return 'FundamentalsDto(symbol: $symbol, hasData: $hasData, latestPeriodEnd: $latestPeriodEnd, revenueGrowthYoy: $revenueGrowthYoy, revenueGrowthQoq: $revenueGrowthQoq, profitGrowthYoy: $profitGrowthYoy, profitGrowthQoq: $profitGrowthQoq, ttmEps: $ttmEps, peRatio: $peRatio, dividendYield: $dividendYield, bookValue: $bookValue, roe: $roe, roce: $roce, debtToEquity: $debtToEquity)';
}


}

/// @nodoc
abstract mixin class $FundamentalsDtoCopyWith<$Res>  {
  factory $FundamentalsDtoCopyWith(FundamentalsDto value, $Res Function(FundamentalsDto) _then) = _$FundamentalsDtoCopyWithImpl;
@useResult
$Res call({
 String symbol,@JsonKey(name: 'has_data') bool hasData,@JsonKey(name: 'latest_period_end') DateTime? latestPeriodEnd,@NullableDecimalConverter()@JsonKey(name: 'revenue_growth_yoy') Decimal? revenueGrowthYoy,@NullableDecimalConverter()@JsonKey(name: 'revenue_growth_qoq') Decimal? revenueGrowthQoq,@NullableDecimalConverter()@JsonKey(name: 'profit_growth_yoy') Decimal? profitGrowthYoy,@NullableDecimalConverter()@JsonKey(name: 'profit_growth_qoq') Decimal? profitGrowthQoq,@NullableDecimalConverter()@JsonKey(name: 'ttm_eps') Decimal? ttmEps,@NullableDecimalConverter()@JsonKey(name: 'pe_ratio') Decimal? peRatio,@NullableDecimalConverter()@JsonKey(name: 'dividend_yield') Decimal? dividendYield,@NullableDecimalConverter()@JsonKey(name: 'book_value') Decimal? bookValue,@NullableDecimalConverter() Decimal? roe,@NullableDecimalConverter() Decimal? roce,@NullableDecimalConverter()@JsonKey(name: 'debt_to_equity') Decimal? debtToEquity
});




}
/// @nodoc
class _$FundamentalsDtoCopyWithImpl<$Res>
    implements $FundamentalsDtoCopyWith<$Res> {
  _$FundamentalsDtoCopyWithImpl(this._self, this._then);

  final FundamentalsDto _self;
  final $Res Function(FundamentalsDto) _then;

/// Create a copy of FundamentalsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? hasData = null,Object? latestPeriodEnd = freezed,Object? revenueGrowthYoy = freezed,Object? revenueGrowthQoq = freezed,Object? profitGrowthYoy = freezed,Object? profitGrowthQoq = freezed,Object? ttmEps = freezed,Object? peRatio = freezed,Object? dividendYield = freezed,Object? bookValue = freezed,Object? roe = freezed,Object? roce = freezed,Object? debtToEquity = freezed,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,hasData: null == hasData ? _self.hasData : hasData // ignore: cast_nullable_to_non_nullable
as bool,latestPeriodEnd: freezed == latestPeriodEnd ? _self.latestPeriodEnd : latestPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,revenueGrowthYoy: freezed == revenueGrowthYoy ? _self.revenueGrowthYoy : revenueGrowthYoy // ignore: cast_nullable_to_non_nullable
as Decimal?,revenueGrowthQoq: freezed == revenueGrowthQoq ? _self.revenueGrowthQoq : revenueGrowthQoq // ignore: cast_nullable_to_non_nullable
as Decimal?,profitGrowthYoy: freezed == profitGrowthYoy ? _self.profitGrowthYoy : profitGrowthYoy // ignore: cast_nullable_to_non_nullable
as Decimal?,profitGrowthQoq: freezed == profitGrowthQoq ? _self.profitGrowthQoq : profitGrowthQoq // ignore: cast_nullable_to_non_nullable
as Decimal?,ttmEps: freezed == ttmEps ? _self.ttmEps : ttmEps // ignore: cast_nullable_to_non_nullable
as Decimal?,peRatio: freezed == peRatio ? _self.peRatio : peRatio // ignore: cast_nullable_to_non_nullable
as Decimal?,dividendYield: freezed == dividendYield ? _self.dividendYield : dividendYield // ignore: cast_nullable_to_non_nullable
as Decimal?,bookValue: freezed == bookValue ? _self.bookValue : bookValue // ignore: cast_nullable_to_non_nullable
as Decimal?,roe: freezed == roe ? _self.roe : roe // ignore: cast_nullable_to_non_nullable
as Decimal?,roce: freezed == roce ? _self.roce : roce // ignore: cast_nullable_to_non_nullable
as Decimal?,debtToEquity: freezed == debtToEquity ? _self.debtToEquity : debtToEquity // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [FundamentalsDto].
extension FundamentalsDtoPatterns on FundamentalsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FundamentalsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FundamentalsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FundamentalsDto value)  $default,){
final _that = this;
switch (_that) {
case _FundamentalsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FundamentalsDto value)?  $default,){
final _that = this;
switch (_that) {
case _FundamentalsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol, @JsonKey(name: 'has_data')  bool hasData, @JsonKey(name: 'latest_period_end')  DateTime? latestPeriodEnd, @NullableDecimalConverter()@JsonKey(name: 'revenue_growth_yoy')  Decimal? revenueGrowthYoy, @NullableDecimalConverter()@JsonKey(name: 'revenue_growth_qoq')  Decimal? revenueGrowthQoq, @NullableDecimalConverter()@JsonKey(name: 'profit_growth_yoy')  Decimal? profitGrowthYoy, @NullableDecimalConverter()@JsonKey(name: 'profit_growth_qoq')  Decimal? profitGrowthQoq, @NullableDecimalConverter()@JsonKey(name: 'ttm_eps')  Decimal? ttmEps, @NullableDecimalConverter()@JsonKey(name: 'pe_ratio')  Decimal? peRatio, @NullableDecimalConverter()@JsonKey(name: 'dividend_yield')  Decimal? dividendYield, @NullableDecimalConverter()@JsonKey(name: 'book_value')  Decimal? bookValue, @NullableDecimalConverter()  Decimal? roe, @NullableDecimalConverter()  Decimal? roce, @NullableDecimalConverter()@JsonKey(name: 'debt_to_equity')  Decimal? debtToEquity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FundamentalsDto() when $default != null:
return $default(_that.symbol,_that.hasData,_that.latestPeriodEnd,_that.revenueGrowthYoy,_that.revenueGrowthQoq,_that.profitGrowthYoy,_that.profitGrowthQoq,_that.ttmEps,_that.peRatio,_that.dividendYield,_that.bookValue,_that.roe,_that.roce,_that.debtToEquity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol, @JsonKey(name: 'has_data')  bool hasData, @JsonKey(name: 'latest_period_end')  DateTime? latestPeriodEnd, @NullableDecimalConverter()@JsonKey(name: 'revenue_growth_yoy')  Decimal? revenueGrowthYoy, @NullableDecimalConverter()@JsonKey(name: 'revenue_growth_qoq')  Decimal? revenueGrowthQoq, @NullableDecimalConverter()@JsonKey(name: 'profit_growth_yoy')  Decimal? profitGrowthYoy, @NullableDecimalConverter()@JsonKey(name: 'profit_growth_qoq')  Decimal? profitGrowthQoq, @NullableDecimalConverter()@JsonKey(name: 'ttm_eps')  Decimal? ttmEps, @NullableDecimalConverter()@JsonKey(name: 'pe_ratio')  Decimal? peRatio, @NullableDecimalConverter()@JsonKey(name: 'dividend_yield')  Decimal? dividendYield, @NullableDecimalConverter()@JsonKey(name: 'book_value')  Decimal? bookValue, @NullableDecimalConverter()  Decimal? roe, @NullableDecimalConverter()  Decimal? roce, @NullableDecimalConverter()@JsonKey(name: 'debt_to_equity')  Decimal? debtToEquity)  $default,) {final _that = this;
switch (_that) {
case _FundamentalsDto():
return $default(_that.symbol,_that.hasData,_that.latestPeriodEnd,_that.revenueGrowthYoy,_that.revenueGrowthQoq,_that.profitGrowthYoy,_that.profitGrowthQoq,_that.ttmEps,_that.peRatio,_that.dividendYield,_that.bookValue,_that.roe,_that.roce,_that.debtToEquity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol, @JsonKey(name: 'has_data')  bool hasData, @JsonKey(name: 'latest_period_end')  DateTime? latestPeriodEnd, @NullableDecimalConverter()@JsonKey(name: 'revenue_growth_yoy')  Decimal? revenueGrowthYoy, @NullableDecimalConverter()@JsonKey(name: 'revenue_growth_qoq')  Decimal? revenueGrowthQoq, @NullableDecimalConverter()@JsonKey(name: 'profit_growth_yoy')  Decimal? profitGrowthYoy, @NullableDecimalConverter()@JsonKey(name: 'profit_growth_qoq')  Decimal? profitGrowthQoq, @NullableDecimalConverter()@JsonKey(name: 'ttm_eps')  Decimal? ttmEps, @NullableDecimalConverter()@JsonKey(name: 'pe_ratio')  Decimal? peRatio, @NullableDecimalConverter()@JsonKey(name: 'dividend_yield')  Decimal? dividendYield, @NullableDecimalConverter()@JsonKey(name: 'book_value')  Decimal? bookValue, @NullableDecimalConverter()  Decimal? roe, @NullableDecimalConverter()  Decimal? roce, @NullableDecimalConverter()@JsonKey(name: 'debt_to_equity')  Decimal? debtToEquity)?  $default,) {final _that = this;
switch (_that) {
case _FundamentalsDto() when $default != null:
return $default(_that.symbol,_that.hasData,_that.latestPeriodEnd,_that.revenueGrowthYoy,_that.revenueGrowthQoq,_that.profitGrowthYoy,_that.profitGrowthQoq,_that.ttmEps,_that.peRatio,_that.dividendYield,_that.bookValue,_that.roe,_that.roce,_that.debtToEquity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FundamentalsDto implements FundamentalsDto {
  const _FundamentalsDto({required this.symbol, @JsonKey(name: 'has_data') this.hasData = false, @JsonKey(name: 'latest_period_end') this.latestPeriodEnd, @NullableDecimalConverter()@JsonKey(name: 'revenue_growth_yoy') this.revenueGrowthYoy, @NullableDecimalConverter()@JsonKey(name: 'revenue_growth_qoq') this.revenueGrowthQoq, @NullableDecimalConverter()@JsonKey(name: 'profit_growth_yoy') this.profitGrowthYoy, @NullableDecimalConverter()@JsonKey(name: 'profit_growth_qoq') this.profitGrowthQoq, @NullableDecimalConverter()@JsonKey(name: 'ttm_eps') this.ttmEps, @NullableDecimalConverter()@JsonKey(name: 'pe_ratio') this.peRatio, @NullableDecimalConverter()@JsonKey(name: 'dividend_yield') this.dividendYield, @NullableDecimalConverter()@JsonKey(name: 'book_value') this.bookValue, @NullableDecimalConverter() this.roe, @NullableDecimalConverter() this.roce, @NullableDecimalConverter()@JsonKey(name: 'debt_to_equity') this.debtToEquity});
  factory _FundamentalsDto.fromJson(Map<String, dynamic> json) => _$FundamentalsDtoFromJson(json);

@override final  String symbol;
@override@JsonKey(name: 'has_data') final  bool hasData;
@override@JsonKey(name: 'latest_period_end') final  DateTime? latestPeriodEnd;
@override@NullableDecimalConverter()@JsonKey(name: 'revenue_growth_yoy') final  Decimal? revenueGrowthYoy;
@override@NullableDecimalConverter()@JsonKey(name: 'revenue_growth_qoq') final  Decimal? revenueGrowthQoq;
@override@NullableDecimalConverter()@JsonKey(name: 'profit_growth_yoy') final  Decimal? profitGrowthYoy;
@override@NullableDecimalConverter()@JsonKey(name: 'profit_growth_qoq') final  Decimal? profitGrowthQoq;
@override@NullableDecimalConverter()@JsonKey(name: 'ttm_eps') final  Decimal? ttmEps;
@override@NullableDecimalConverter()@JsonKey(name: 'pe_ratio') final  Decimal? peRatio;
@override@NullableDecimalConverter()@JsonKey(name: 'dividend_yield') final  Decimal? dividendYield;
@override@NullableDecimalConverter()@JsonKey(name: 'book_value') final  Decimal? bookValue;
@override@NullableDecimalConverter() final  Decimal? roe;
@override@NullableDecimalConverter() final  Decimal? roce;
@override@NullableDecimalConverter()@JsonKey(name: 'debt_to_equity') final  Decimal? debtToEquity;

/// Create a copy of FundamentalsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FundamentalsDtoCopyWith<_FundamentalsDto> get copyWith => __$FundamentalsDtoCopyWithImpl<_FundamentalsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FundamentalsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FundamentalsDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.hasData, hasData) || other.hasData == hasData)&&(identical(other.latestPeriodEnd, latestPeriodEnd) || other.latestPeriodEnd == latestPeriodEnd)&&(identical(other.revenueGrowthYoy, revenueGrowthYoy) || other.revenueGrowthYoy == revenueGrowthYoy)&&(identical(other.revenueGrowthQoq, revenueGrowthQoq) || other.revenueGrowthQoq == revenueGrowthQoq)&&(identical(other.profitGrowthYoy, profitGrowthYoy) || other.profitGrowthYoy == profitGrowthYoy)&&(identical(other.profitGrowthQoq, profitGrowthQoq) || other.profitGrowthQoq == profitGrowthQoq)&&(identical(other.ttmEps, ttmEps) || other.ttmEps == ttmEps)&&(identical(other.peRatio, peRatio) || other.peRatio == peRatio)&&(identical(other.dividendYield, dividendYield) || other.dividendYield == dividendYield)&&(identical(other.bookValue, bookValue) || other.bookValue == bookValue)&&(identical(other.roe, roe) || other.roe == roe)&&(identical(other.roce, roce) || other.roce == roce)&&(identical(other.debtToEquity, debtToEquity) || other.debtToEquity == debtToEquity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,hasData,latestPeriodEnd,revenueGrowthYoy,revenueGrowthQoq,profitGrowthYoy,profitGrowthQoq,ttmEps,peRatio,dividendYield,bookValue,roe,roce,debtToEquity);

@override
String toString() {
  return 'FundamentalsDto(symbol: $symbol, hasData: $hasData, latestPeriodEnd: $latestPeriodEnd, revenueGrowthYoy: $revenueGrowthYoy, revenueGrowthQoq: $revenueGrowthQoq, profitGrowthYoy: $profitGrowthYoy, profitGrowthQoq: $profitGrowthQoq, ttmEps: $ttmEps, peRatio: $peRatio, dividendYield: $dividendYield, bookValue: $bookValue, roe: $roe, roce: $roce, debtToEquity: $debtToEquity)';
}


}

/// @nodoc
abstract mixin class _$FundamentalsDtoCopyWith<$Res> implements $FundamentalsDtoCopyWith<$Res> {
  factory _$FundamentalsDtoCopyWith(_FundamentalsDto value, $Res Function(_FundamentalsDto) _then) = __$FundamentalsDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol,@JsonKey(name: 'has_data') bool hasData,@JsonKey(name: 'latest_period_end') DateTime? latestPeriodEnd,@NullableDecimalConverter()@JsonKey(name: 'revenue_growth_yoy') Decimal? revenueGrowthYoy,@NullableDecimalConverter()@JsonKey(name: 'revenue_growth_qoq') Decimal? revenueGrowthQoq,@NullableDecimalConverter()@JsonKey(name: 'profit_growth_yoy') Decimal? profitGrowthYoy,@NullableDecimalConverter()@JsonKey(name: 'profit_growth_qoq') Decimal? profitGrowthQoq,@NullableDecimalConverter()@JsonKey(name: 'ttm_eps') Decimal? ttmEps,@NullableDecimalConverter()@JsonKey(name: 'pe_ratio') Decimal? peRatio,@NullableDecimalConverter()@JsonKey(name: 'dividend_yield') Decimal? dividendYield,@NullableDecimalConverter()@JsonKey(name: 'book_value') Decimal? bookValue,@NullableDecimalConverter() Decimal? roe,@NullableDecimalConverter() Decimal? roce,@NullableDecimalConverter()@JsonKey(name: 'debt_to_equity') Decimal? debtToEquity
});




}
/// @nodoc
class __$FundamentalsDtoCopyWithImpl<$Res>
    implements _$FundamentalsDtoCopyWith<$Res> {
  __$FundamentalsDtoCopyWithImpl(this._self, this._then);

  final _FundamentalsDto _self;
  final $Res Function(_FundamentalsDto) _then;

/// Create a copy of FundamentalsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? hasData = null,Object? latestPeriodEnd = freezed,Object? revenueGrowthYoy = freezed,Object? revenueGrowthQoq = freezed,Object? profitGrowthYoy = freezed,Object? profitGrowthQoq = freezed,Object? ttmEps = freezed,Object? peRatio = freezed,Object? dividendYield = freezed,Object? bookValue = freezed,Object? roe = freezed,Object? roce = freezed,Object? debtToEquity = freezed,}) {
  return _then(_FundamentalsDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,hasData: null == hasData ? _self.hasData : hasData // ignore: cast_nullable_to_non_nullable
as bool,latestPeriodEnd: freezed == latestPeriodEnd ? _self.latestPeriodEnd : latestPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,revenueGrowthYoy: freezed == revenueGrowthYoy ? _self.revenueGrowthYoy : revenueGrowthYoy // ignore: cast_nullable_to_non_nullable
as Decimal?,revenueGrowthQoq: freezed == revenueGrowthQoq ? _self.revenueGrowthQoq : revenueGrowthQoq // ignore: cast_nullable_to_non_nullable
as Decimal?,profitGrowthYoy: freezed == profitGrowthYoy ? _self.profitGrowthYoy : profitGrowthYoy // ignore: cast_nullable_to_non_nullable
as Decimal?,profitGrowthQoq: freezed == profitGrowthQoq ? _self.profitGrowthQoq : profitGrowthQoq // ignore: cast_nullable_to_non_nullable
as Decimal?,ttmEps: freezed == ttmEps ? _self.ttmEps : ttmEps // ignore: cast_nullable_to_non_nullable
as Decimal?,peRatio: freezed == peRatio ? _self.peRatio : peRatio // ignore: cast_nullable_to_non_nullable
as Decimal?,dividendYield: freezed == dividendYield ? _self.dividendYield : dividendYield // ignore: cast_nullable_to_non_nullable
as Decimal?,bookValue: freezed == bookValue ? _self.bookValue : bookValue // ignore: cast_nullable_to_non_nullable
as Decimal?,roe: freezed == roe ? _self.roe : roe // ignore: cast_nullable_to_non_nullable
as Decimal?,roce: freezed == roce ? _self.roce : roce // ignore: cast_nullable_to_non_nullable
as Decimal?,debtToEquity: freezed == debtToEquity ? _self.debtToEquity : debtToEquity // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}


}

// dart format on
