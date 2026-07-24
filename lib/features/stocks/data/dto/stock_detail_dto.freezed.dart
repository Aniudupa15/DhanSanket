// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockDetailDto {

 String get symbol; String? get isin; String get name; String? get series; String? get sector; String? get industry;@JsonKey(name: 'instrument_type') InstrumentTypeDto get instrumentType;@JsonKey(name: 'listing_date') DateTime? get listingDate;@NullableDecimalConverter()@JsonKey(name: 'face_value') Decimal? get faceValue; QuoteDto? get quote;@JsonKey(name: 'quote_unavailable_reason') String? get quoteUnavailableReason;
/// Create a copy of StockDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockDetailDtoCopyWith<StockDetailDto> get copyWith => _$StockDetailDtoCopyWithImpl<StockDetailDto>(this as StockDetailDto, _$identity);

  /// Serializes this StockDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDetailDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.isin, isin) || other.isin == isin)&&(identical(other.name, name) || other.name == name)&&(identical(other.series, series) || other.series == series)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.industry, industry) || other.industry == industry)&&(identical(other.instrumentType, instrumentType) || other.instrumentType == instrumentType)&&(identical(other.listingDate, listingDate) || other.listingDate == listingDate)&&(identical(other.faceValue, faceValue) || other.faceValue == faceValue)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.quoteUnavailableReason, quoteUnavailableReason) || other.quoteUnavailableReason == quoteUnavailableReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,isin,name,series,sector,industry,instrumentType,listingDate,faceValue,quote,quoteUnavailableReason);

@override
String toString() {
  return 'StockDetailDto(symbol: $symbol, isin: $isin, name: $name, series: $series, sector: $sector, industry: $industry, instrumentType: $instrumentType, listingDate: $listingDate, faceValue: $faceValue, quote: $quote, quoteUnavailableReason: $quoteUnavailableReason)';
}


}

/// @nodoc
abstract mixin class $StockDetailDtoCopyWith<$Res>  {
  factory $StockDetailDtoCopyWith(StockDetailDto value, $Res Function(StockDetailDto) _then) = _$StockDetailDtoCopyWithImpl;
@useResult
$Res call({
 String symbol, String? isin, String name, String? series, String? sector, String? industry,@JsonKey(name: 'instrument_type') InstrumentTypeDto instrumentType,@JsonKey(name: 'listing_date') DateTime? listingDate,@NullableDecimalConverter()@JsonKey(name: 'face_value') Decimal? faceValue, QuoteDto? quote,@JsonKey(name: 'quote_unavailable_reason') String? quoteUnavailableReason
});


$QuoteDtoCopyWith<$Res>? get quote;

}
/// @nodoc
class _$StockDetailDtoCopyWithImpl<$Res>
    implements $StockDetailDtoCopyWith<$Res> {
  _$StockDetailDtoCopyWithImpl(this._self, this._then);

  final StockDetailDto _self;
  final $Res Function(StockDetailDto) _then;

/// Create a copy of StockDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? isin = freezed,Object? name = null,Object? series = freezed,Object? sector = freezed,Object? industry = freezed,Object? instrumentType = null,Object? listingDate = freezed,Object? faceValue = freezed,Object? quote = freezed,Object? quoteUnavailableReason = freezed,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,isin: freezed == isin ? _self.isin : isin // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,series: freezed == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as String?,sector: freezed == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String?,industry: freezed == industry ? _self.industry : industry // ignore: cast_nullable_to_non_nullable
as String?,instrumentType: null == instrumentType ? _self.instrumentType : instrumentType // ignore: cast_nullable_to_non_nullable
as InstrumentTypeDto,listingDate: freezed == listingDate ? _self.listingDate : listingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,faceValue: freezed == faceValue ? _self.faceValue : faceValue // ignore: cast_nullable_to_non_nullable
as Decimal?,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as QuoteDto?,quoteUnavailableReason: freezed == quoteUnavailableReason ? _self.quoteUnavailableReason : quoteUnavailableReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of StockDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteDtoCopyWith<$Res>? get quote {
    if (_self.quote == null) {
    return null;
  }

  return $QuoteDtoCopyWith<$Res>(_self.quote!, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockDetailDto].
extension StockDetailDtoPatterns on StockDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _StockDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _StockDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String? isin,  String name,  String? series,  String? sector,  String? industry, @JsonKey(name: 'instrument_type')  InstrumentTypeDto instrumentType, @JsonKey(name: 'listing_date')  DateTime? listingDate, @NullableDecimalConverter()@JsonKey(name: 'face_value')  Decimal? faceValue,  QuoteDto? quote, @JsonKey(name: 'quote_unavailable_reason')  String? quoteUnavailableReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockDetailDto() when $default != null:
return $default(_that.symbol,_that.isin,_that.name,_that.series,_that.sector,_that.industry,_that.instrumentType,_that.listingDate,_that.faceValue,_that.quote,_that.quoteUnavailableReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String? isin,  String name,  String? series,  String? sector,  String? industry, @JsonKey(name: 'instrument_type')  InstrumentTypeDto instrumentType, @JsonKey(name: 'listing_date')  DateTime? listingDate, @NullableDecimalConverter()@JsonKey(name: 'face_value')  Decimal? faceValue,  QuoteDto? quote, @JsonKey(name: 'quote_unavailable_reason')  String? quoteUnavailableReason)  $default,) {final _that = this;
switch (_that) {
case _StockDetailDto():
return $default(_that.symbol,_that.isin,_that.name,_that.series,_that.sector,_that.industry,_that.instrumentType,_that.listingDate,_that.faceValue,_that.quote,_that.quoteUnavailableReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String? isin,  String name,  String? series,  String? sector,  String? industry, @JsonKey(name: 'instrument_type')  InstrumentTypeDto instrumentType, @JsonKey(name: 'listing_date')  DateTime? listingDate, @NullableDecimalConverter()@JsonKey(name: 'face_value')  Decimal? faceValue,  QuoteDto? quote, @JsonKey(name: 'quote_unavailable_reason')  String? quoteUnavailableReason)?  $default,) {final _that = this;
switch (_that) {
case _StockDetailDto() when $default != null:
return $default(_that.symbol,_that.isin,_that.name,_that.series,_that.sector,_that.industry,_that.instrumentType,_that.listingDate,_that.faceValue,_that.quote,_that.quoteUnavailableReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockDetailDto implements StockDetailDto {
  const _StockDetailDto({required this.symbol, this.isin, required this.name, this.series, this.sector, this.industry, @JsonKey(name: 'instrument_type') required this.instrumentType, @JsonKey(name: 'listing_date') this.listingDate, @NullableDecimalConverter()@JsonKey(name: 'face_value') this.faceValue, this.quote, @JsonKey(name: 'quote_unavailable_reason') this.quoteUnavailableReason});
  factory _StockDetailDto.fromJson(Map<String, dynamic> json) => _$StockDetailDtoFromJson(json);

@override final  String symbol;
@override final  String? isin;
@override final  String name;
@override final  String? series;
@override final  String? sector;
@override final  String? industry;
@override@JsonKey(name: 'instrument_type') final  InstrumentTypeDto instrumentType;
@override@JsonKey(name: 'listing_date') final  DateTime? listingDate;
@override@NullableDecimalConverter()@JsonKey(name: 'face_value') final  Decimal? faceValue;
@override final  QuoteDto? quote;
@override@JsonKey(name: 'quote_unavailable_reason') final  String? quoteUnavailableReason;

/// Create a copy of StockDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockDetailDtoCopyWith<_StockDetailDto> get copyWith => __$StockDetailDtoCopyWithImpl<_StockDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDetailDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.isin, isin) || other.isin == isin)&&(identical(other.name, name) || other.name == name)&&(identical(other.series, series) || other.series == series)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.industry, industry) || other.industry == industry)&&(identical(other.instrumentType, instrumentType) || other.instrumentType == instrumentType)&&(identical(other.listingDate, listingDate) || other.listingDate == listingDate)&&(identical(other.faceValue, faceValue) || other.faceValue == faceValue)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.quoteUnavailableReason, quoteUnavailableReason) || other.quoteUnavailableReason == quoteUnavailableReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,isin,name,series,sector,industry,instrumentType,listingDate,faceValue,quote,quoteUnavailableReason);

@override
String toString() {
  return 'StockDetailDto(symbol: $symbol, isin: $isin, name: $name, series: $series, sector: $sector, industry: $industry, instrumentType: $instrumentType, listingDate: $listingDate, faceValue: $faceValue, quote: $quote, quoteUnavailableReason: $quoteUnavailableReason)';
}


}

/// @nodoc
abstract mixin class _$StockDetailDtoCopyWith<$Res> implements $StockDetailDtoCopyWith<$Res> {
  factory _$StockDetailDtoCopyWith(_StockDetailDto value, $Res Function(_StockDetailDto) _then) = __$StockDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String? isin, String name, String? series, String? sector, String? industry,@JsonKey(name: 'instrument_type') InstrumentTypeDto instrumentType,@JsonKey(name: 'listing_date') DateTime? listingDate,@NullableDecimalConverter()@JsonKey(name: 'face_value') Decimal? faceValue, QuoteDto? quote,@JsonKey(name: 'quote_unavailable_reason') String? quoteUnavailableReason
});


@override $QuoteDtoCopyWith<$Res>? get quote;

}
/// @nodoc
class __$StockDetailDtoCopyWithImpl<$Res>
    implements _$StockDetailDtoCopyWith<$Res> {
  __$StockDetailDtoCopyWithImpl(this._self, this._then);

  final _StockDetailDto _self;
  final $Res Function(_StockDetailDto) _then;

/// Create a copy of StockDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? isin = freezed,Object? name = null,Object? series = freezed,Object? sector = freezed,Object? industry = freezed,Object? instrumentType = null,Object? listingDate = freezed,Object? faceValue = freezed,Object? quote = freezed,Object? quoteUnavailableReason = freezed,}) {
  return _then(_StockDetailDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,isin: freezed == isin ? _self.isin : isin // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,series: freezed == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as String?,sector: freezed == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String?,industry: freezed == industry ? _self.industry : industry // ignore: cast_nullable_to_non_nullable
as String?,instrumentType: null == instrumentType ? _self.instrumentType : instrumentType // ignore: cast_nullable_to_non_nullable
as InstrumentTypeDto,listingDate: freezed == listingDate ? _self.listingDate : listingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,faceValue: freezed == faceValue ? _self.faceValue : faceValue // ignore: cast_nullable_to_non_nullable
as Decimal?,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as QuoteDto?,quoteUnavailableReason: freezed == quoteUnavailableReason ? _self.quoteUnavailableReason : quoteUnavailableReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of StockDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteDtoCopyWith<$Res>? get quote {
    if (_self.quote == null) {
    return null;
  }

  return $QuoteDtoCopyWith<$Res>(_self.quote!, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}

// dart format on
