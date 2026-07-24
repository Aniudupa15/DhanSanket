// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchlistItemDto {

 String get symbol; String get name;@JsonKey(name: 'added_at') DateTime get addedAt;@NullableDecimalConverter()@JsonKey(name: 'last_price') Decimal? get lastPrice;@NullableDecimalConverter() Decimal? get change;@NullableDecimalConverter()@JsonKey(name: 'change_percent') Decimal? get changePercent;
/// Create a copy of WatchlistItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistItemDtoCopyWith<WatchlistItemDto> get copyWith => _$WatchlistItemDtoCopyWithImpl<WatchlistItemDto>(this as WatchlistItemDto, _$identity);

  /// Serializes this WatchlistItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistItemDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,addedAt,lastPrice,change,changePercent);

@override
String toString() {
  return 'WatchlistItemDto(symbol: $symbol, name: $name, addedAt: $addedAt, lastPrice: $lastPrice, change: $change, changePercent: $changePercent)';
}


}

/// @nodoc
abstract mixin class $WatchlistItemDtoCopyWith<$Res>  {
  factory $WatchlistItemDtoCopyWith(WatchlistItemDto value, $Res Function(WatchlistItemDto) _then) = _$WatchlistItemDtoCopyWithImpl;
@useResult
$Res call({
 String symbol, String name,@JsonKey(name: 'added_at') DateTime addedAt,@NullableDecimalConverter()@JsonKey(name: 'last_price') Decimal? lastPrice,@NullableDecimalConverter() Decimal? change,@NullableDecimalConverter()@JsonKey(name: 'change_percent') Decimal? changePercent
});




}
/// @nodoc
class _$WatchlistItemDtoCopyWithImpl<$Res>
    implements $WatchlistItemDtoCopyWith<$Res> {
  _$WatchlistItemDtoCopyWithImpl(this._self, this._then);

  final WatchlistItemDto _self;
  final $Res Function(WatchlistItemDto) _then;

/// Create a copy of WatchlistItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? addedAt = null,Object? lastPrice = freezed,Object? change = freezed,Object? changePercent = freezed,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastPrice: freezed == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as Decimal?,changePercent: freezed == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchlistItemDto].
extension WatchlistItemDtoPatterns on WatchlistItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchlistItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchlistItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchlistItemDto value)  $default,){
final _that = this;
switch (_that) {
case _WatchlistItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchlistItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _WatchlistItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name, @JsonKey(name: 'added_at')  DateTime addedAt, @NullableDecimalConverter()@JsonKey(name: 'last_price')  Decimal? lastPrice, @NullableDecimalConverter()  Decimal? change, @NullableDecimalConverter()@JsonKey(name: 'change_percent')  Decimal? changePercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchlistItemDto() when $default != null:
return $default(_that.symbol,_that.name,_that.addedAt,_that.lastPrice,_that.change,_that.changePercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name, @JsonKey(name: 'added_at')  DateTime addedAt, @NullableDecimalConverter()@JsonKey(name: 'last_price')  Decimal? lastPrice, @NullableDecimalConverter()  Decimal? change, @NullableDecimalConverter()@JsonKey(name: 'change_percent')  Decimal? changePercent)  $default,) {final _that = this;
switch (_that) {
case _WatchlistItemDto():
return $default(_that.symbol,_that.name,_that.addedAt,_that.lastPrice,_that.change,_that.changePercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name, @JsonKey(name: 'added_at')  DateTime addedAt, @NullableDecimalConverter()@JsonKey(name: 'last_price')  Decimal? lastPrice, @NullableDecimalConverter()  Decimal? change, @NullableDecimalConverter()@JsonKey(name: 'change_percent')  Decimal? changePercent)?  $default,) {final _that = this;
switch (_that) {
case _WatchlistItemDto() when $default != null:
return $default(_that.symbol,_that.name,_that.addedAt,_that.lastPrice,_that.change,_that.changePercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchlistItemDto implements WatchlistItemDto {
  const _WatchlistItemDto({required this.symbol, required this.name, @JsonKey(name: 'added_at') required this.addedAt, @NullableDecimalConverter()@JsonKey(name: 'last_price') this.lastPrice, @NullableDecimalConverter() this.change, @NullableDecimalConverter()@JsonKey(name: 'change_percent') this.changePercent});
  factory _WatchlistItemDto.fromJson(Map<String, dynamic> json) => _$WatchlistItemDtoFromJson(json);

@override final  String symbol;
@override final  String name;
@override@JsonKey(name: 'added_at') final  DateTime addedAt;
@override@NullableDecimalConverter()@JsonKey(name: 'last_price') final  Decimal? lastPrice;
@override@NullableDecimalConverter() final  Decimal? change;
@override@NullableDecimalConverter()@JsonKey(name: 'change_percent') final  Decimal? changePercent;

/// Create a copy of WatchlistItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistItemDtoCopyWith<_WatchlistItemDto> get copyWith => __$WatchlistItemDtoCopyWithImpl<_WatchlistItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchlistItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistItemDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,addedAt,lastPrice,change,changePercent);

@override
String toString() {
  return 'WatchlistItemDto(symbol: $symbol, name: $name, addedAt: $addedAt, lastPrice: $lastPrice, change: $change, changePercent: $changePercent)';
}


}

/// @nodoc
abstract mixin class _$WatchlistItemDtoCopyWith<$Res> implements $WatchlistItemDtoCopyWith<$Res> {
  factory _$WatchlistItemDtoCopyWith(_WatchlistItemDto value, $Res Function(_WatchlistItemDto) _then) = __$WatchlistItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name,@JsonKey(name: 'added_at') DateTime addedAt,@NullableDecimalConverter()@JsonKey(name: 'last_price') Decimal? lastPrice,@NullableDecimalConverter() Decimal? change,@NullableDecimalConverter()@JsonKey(name: 'change_percent') Decimal? changePercent
});




}
/// @nodoc
class __$WatchlistItemDtoCopyWithImpl<$Res>
    implements _$WatchlistItemDtoCopyWith<$Res> {
  __$WatchlistItemDtoCopyWithImpl(this._self, this._then);

  final _WatchlistItemDto _self;
  final $Res Function(_WatchlistItemDto) _then;

/// Create a copy of WatchlistItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? addedAt = null,Object? lastPrice = freezed,Object? change = freezed,Object? changePercent = freezed,}) {
  return _then(_WatchlistItemDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastPrice: freezed == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as Decimal?,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as Decimal?,changePercent: freezed == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as Decimal?,
  ));
}


}

// dart format on
