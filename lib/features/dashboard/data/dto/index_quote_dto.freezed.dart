// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'index_quote_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IndexQuoteDto {

@JsonKey(name: 'index_name') String get indexName;@DecimalConverter()@JsonKey(name: 'last_price') Decimal get lastPrice;@DecimalConverter() Decimal get change;@DecimalConverter()@JsonKey(name: 'change_percent') Decimal get changePercent;
/// Create a copy of IndexQuoteDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndexQuoteDtoCopyWith<IndexQuoteDto> get copyWith => _$IndexQuoteDtoCopyWithImpl<IndexQuoteDto>(this as IndexQuoteDto, _$identity);

  /// Serializes this IndexQuoteDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IndexQuoteDto&&(identical(other.indexName, indexName) || other.indexName == indexName)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,indexName,lastPrice,change,changePercent);

@override
String toString() {
  return 'IndexQuoteDto(indexName: $indexName, lastPrice: $lastPrice, change: $change, changePercent: $changePercent)';
}


}

/// @nodoc
abstract mixin class $IndexQuoteDtoCopyWith<$Res>  {
  factory $IndexQuoteDtoCopyWith(IndexQuoteDto value, $Res Function(IndexQuoteDto) _then) = _$IndexQuoteDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'index_name') String indexName,@DecimalConverter()@JsonKey(name: 'last_price') Decimal lastPrice,@DecimalConverter() Decimal change,@DecimalConverter()@JsonKey(name: 'change_percent') Decimal changePercent
});




}
/// @nodoc
class _$IndexQuoteDtoCopyWithImpl<$Res>
    implements $IndexQuoteDtoCopyWith<$Res> {
  _$IndexQuoteDtoCopyWithImpl(this._self, this._then);

  final IndexQuoteDto _self;
  final $Res Function(IndexQuoteDto) _then;

/// Create a copy of IndexQuoteDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? indexName = null,Object? lastPrice = null,Object? change = null,Object? changePercent = null,}) {
  return _then(_self.copyWith(
indexName: null == indexName ? _self.indexName : indexName // ignore: cast_nullable_to_non_nullable
as String,lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as Decimal,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as Decimal,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}

}


/// Adds pattern-matching-related methods to [IndexQuoteDto].
extension IndexQuoteDtoPatterns on IndexQuoteDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IndexQuoteDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IndexQuoteDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IndexQuoteDto value)  $default,){
final _that = this;
switch (_that) {
case _IndexQuoteDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IndexQuoteDto value)?  $default,){
final _that = this;
switch (_that) {
case _IndexQuoteDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'index_name')  String indexName, @DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @DecimalConverter()  Decimal change, @DecimalConverter()@JsonKey(name: 'change_percent')  Decimal changePercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndexQuoteDto() when $default != null:
return $default(_that.indexName,_that.lastPrice,_that.change,_that.changePercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'index_name')  String indexName, @DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @DecimalConverter()  Decimal change, @DecimalConverter()@JsonKey(name: 'change_percent')  Decimal changePercent)  $default,) {final _that = this;
switch (_that) {
case _IndexQuoteDto():
return $default(_that.indexName,_that.lastPrice,_that.change,_that.changePercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'index_name')  String indexName, @DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @DecimalConverter()  Decimal change, @DecimalConverter()@JsonKey(name: 'change_percent')  Decimal changePercent)?  $default,) {final _that = this;
switch (_that) {
case _IndexQuoteDto() when $default != null:
return $default(_that.indexName,_that.lastPrice,_that.change,_that.changePercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndexQuoteDto implements IndexQuoteDto {
  const _IndexQuoteDto({@JsonKey(name: 'index_name') required this.indexName, @DecimalConverter()@JsonKey(name: 'last_price') required this.lastPrice, @DecimalConverter() required this.change, @DecimalConverter()@JsonKey(name: 'change_percent') required this.changePercent});
  factory _IndexQuoteDto.fromJson(Map<String, dynamic> json) => _$IndexQuoteDtoFromJson(json);

@override@JsonKey(name: 'index_name') final  String indexName;
@override@DecimalConverter()@JsonKey(name: 'last_price') final  Decimal lastPrice;
@override@DecimalConverter() final  Decimal change;
@override@DecimalConverter()@JsonKey(name: 'change_percent') final  Decimal changePercent;

/// Create a copy of IndexQuoteDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndexQuoteDtoCopyWith<_IndexQuoteDto> get copyWith => __$IndexQuoteDtoCopyWithImpl<_IndexQuoteDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndexQuoteDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndexQuoteDto&&(identical(other.indexName, indexName) || other.indexName == indexName)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,indexName,lastPrice,change,changePercent);

@override
String toString() {
  return 'IndexQuoteDto(indexName: $indexName, lastPrice: $lastPrice, change: $change, changePercent: $changePercent)';
}


}

/// @nodoc
abstract mixin class _$IndexQuoteDtoCopyWith<$Res> implements $IndexQuoteDtoCopyWith<$Res> {
  factory _$IndexQuoteDtoCopyWith(_IndexQuoteDto value, $Res Function(_IndexQuoteDto) _then) = __$IndexQuoteDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'index_name') String indexName,@DecimalConverter()@JsonKey(name: 'last_price') Decimal lastPrice,@DecimalConverter() Decimal change,@DecimalConverter()@JsonKey(name: 'change_percent') Decimal changePercent
});




}
/// @nodoc
class __$IndexQuoteDtoCopyWithImpl<$Res>
    implements _$IndexQuoteDtoCopyWith<$Res> {
  __$IndexQuoteDtoCopyWithImpl(this._self, this._then);

  final _IndexQuoteDto _self;
  final $Res Function(_IndexQuoteDto) _then;

/// Create a copy of IndexQuoteDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? indexName = null,Object? lastPrice = null,Object? change = null,Object? changePercent = null,}) {
  return _then(_IndexQuoteDto(
indexName: null == indexName ? _self.indexName : indexName // ignore: cast_nullable_to_non_nullable
as String,lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as Decimal,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as Decimal,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}


}

// dart format on
