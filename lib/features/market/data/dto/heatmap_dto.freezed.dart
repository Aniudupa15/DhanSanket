// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heatmap_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HeatmapTileDto {

 String get symbol; String get name;@DecimalConverter()@JsonKey(name: 'last_price') Decimal get lastPrice;@NullableDecimalConverter()@JsonKey(name: 'change_percent') Decimal? get changePercent; int get volume; String get bucket;
/// Create a copy of HeatmapTileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeatmapTileDtoCopyWith<HeatmapTileDto> get copyWith => _$HeatmapTileDtoCopyWithImpl<HeatmapTileDto>(this as HeatmapTileDto, _$identity);

  /// Serializes this HeatmapTileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeatmapTileDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.bucket, bucket) || other.bucket == bucket));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,lastPrice,changePercent,volume,bucket);

@override
String toString() {
  return 'HeatmapTileDto(symbol: $symbol, name: $name, lastPrice: $lastPrice, changePercent: $changePercent, volume: $volume, bucket: $bucket)';
}


}

/// @nodoc
abstract mixin class $HeatmapTileDtoCopyWith<$Res>  {
  factory $HeatmapTileDtoCopyWith(HeatmapTileDto value, $Res Function(HeatmapTileDto) _then) = _$HeatmapTileDtoCopyWithImpl;
@useResult
$Res call({
 String symbol, String name,@DecimalConverter()@JsonKey(name: 'last_price') Decimal lastPrice,@NullableDecimalConverter()@JsonKey(name: 'change_percent') Decimal? changePercent, int volume, String bucket
});




}
/// @nodoc
class _$HeatmapTileDtoCopyWithImpl<$Res>
    implements $HeatmapTileDtoCopyWith<$Res> {
  _$HeatmapTileDtoCopyWithImpl(this._self, this._then);

  final HeatmapTileDto _self;
  final $Res Function(HeatmapTileDto) _then;

/// Create a copy of HeatmapTileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? lastPrice = null,Object? changePercent = freezed,Object? volume = null,Object? bucket = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as Decimal,changePercent: freezed == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as Decimal?,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HeatmapTileDto].
extension HeatmapTileDtoPatterns on HeatmapTileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HeatmapTileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HeatmapTileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HeatmapTileDto value)  $default,){
final _that = this;
switch (_that) {
case _HeatmapTileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HeatmapTileDto value)?  $default,){
final _that = this;
switch (_that) {
case _HeatmapTileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name, @DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @NullableDecimalConverter()@JsonKey(name: 'change_percent')  Decimal? changePercent,  int volume,  String bucket)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HeatmapTileDto() when $default != null:
return $default(_that.symbol,_that.name,_that.lastPrice,_that.changePercent,_that.volume,_that.bucket);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name, @DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @NullableDecimalConverter()@JsonKey(name: 'change_percent')  Decimal? changePercent,  int volume,  String bucket)  $default,) {final _that = this;
switch (_that) {
case _HeatmapTileDto():
return $default(_that.symbol,_that.name,_that.lastPrice,_that.changePercent,_that.volume,_that.bucket);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name, @DecimalConverter()@JsonKey(name: 'last_price')  Decimal lastPrice, @NullableDecimalConverter()@JsonKey(name: 'change_percent')  Decimal? changePercent,  int volume,  String bucket)?  $default,) {final _that = this;
switch (_that) {
case _HeatmapTileDto() when $default != null:
return $default(_that.symbol,_that.name,_that.lastPrice,_that.changePercent,_that.volume,_that.bucket);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HeatmapTileDto implements HeatmapTileDto {
  const _HeatmapTileDto({required this.symbol, required this.name, @DecimalConverter()@JsonKey(name: 'last_price') required this.lastPrice, @NullableDecimalConverter()@JsonKey(name: 'change_percent') this.changePercent, required this.volume, required this.bucket});
  factory _HeatmapTileDto.fromJson(Map<String, dynamic> json) => _$HeatmapTileDtoFromJson(json);

@override final  String symbol;
@override final  String name;
@override@DecimalConverter()@JsonKey(name: 'last_price') final  Decimal lastPrice;
@override@NullableDecimalConverter()@JsonKey(name: 'change_percent') final  Decimal? changePercent;
@override final  int volume;
@override final  String bucket;

/// Create a copy of HeatmapTileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeatmapTileDtoCopyWith<_HeatmapTileDto> get copyWith => __$HeatmapTileDtoCopyWithImpl<_HeatmapTileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeatmapTileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeatmapTileDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastPrice, lastPrice) || other.lastPrice == lastPrice)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.bucket, bucket) || other.bucket == bucket));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,lastPrice,changePercent,volume,bucket);

@override
String toString() {
  return 'HeatmapTileDto(symbol: $symbol, name: $name, lastPrice: $lastPrice, changePercent: $changePercent, volume: $volume, bucket: $bucket)';
}


}

/// @nodoc
abstract mixin class _$HeatmapTileDtoCopyWith<$Res> implements $HeatmapTileDtoCopyWith<$Res> {
  factory _$HeatmapTileDtoCopyWith(_HeatmapTileDto value, $Res Function(_HeatmapTileDto) _then) = __$HeatmapTileDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name,@DecimalConverter()@JsonKey(name: 'last_price') Decimal lastPrice,@NullableDecimalConverter()@JsonKey(name: 'change_percent') Decimal? changePercent, int volume, String bucket
});




}
/// @nodoc
class __$HeatmapTileDtoCopyWithImpl<$Res>
    implements _$HeatmapTileDtoCopyWith<$Res> {
  __$HeatmapTileDtoCopyWithImpl(this._self, this._then);

  final _HeatmapTileDto _self;
  final $Res Function(_HeatmapTileDto) _then;

/// Create a copy of HeatmapTileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? lastPrice = null,Object? changePercent = freezed,Object? volume = null,Object? bucket = null,}) {
  return _then(_HeatmapTileDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastPrice: null == lastPrice ? _self.lastPrice : lastPrice // ignore: cast_nullable_to_non_nullable
as Decimal,changePercent: freezed == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as Decimal?,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HeatmapDto {

 List<HeatmapTileDto> get tiles; List<String> get notes;
/// Create a copy of HeatmapDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeatmapDtoCopyWith<HeatmapDto> get copyWith => _$HeatmapDtoCopyWithImpl<HeatmapDto>(this as HeatmapDto, _$identity);

  /// Serializes this HeatmapDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeatmapDto&&const DeepCollectionEquality().equals(other.tiles, tiles)&&const DeepCollectionEquality().equals(other.notes, notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tiles),const DeepCollectionEquality().hash(notes));

@override
String toString() {
  return 'HeatmapDto(tiles: $tiles, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $HeatmapDtoCopyWith<$Res>  {
  factory $HeatmapDtoCopyWith(HeatmapDto value, $Res Function(HeatmapDto) _then) = _$HeatmapDtoCopyWithImpl;
@useResult
$Res call({
 List<HeatmapTileDto> tiles, List<String> notes
});




}
/// @nodoc
class _$HeatmapDtoCopyWithImpl<$Res>
    implements $HeatmapDtoCopyWith<$Res> {
  _$HeatmapDtoCopyWithImpl(this._self, this._then);

  final HeatmapDto _self;
  final $Res Function(HeatmapDto) _then;

/// Create a copy of HeatmapDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tiles = null,Object? notes = null,}) {
  return _then(_self.copyWith(
tiles: null == tiles ? _self.tiles : tiles // ignore: cast_nullable_to_non_nullable
as List<HeatmapTileDto>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [HeatmapDto].
extension HeatmapDtoPatterns on HeatmapDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HeatmapDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HeatmapDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HeatmapDto value)  $default,){
final _that = this;
switch (_that) {
case _HeatmapDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HeatmapDto value)?  $default,){
final _that = this;
switch (_that) {
case _HeatmapDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HeatmapTileDto> tiles,  List<String> notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HeatmapDto() when $default != null:
return $default(_that.tiles,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HeatmapTileDto> tiles,  List<String> notes)  $default,) {final _that = this;
switch (_that) {
case _HeatmapDto():
return $default(_that.tiles,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HeatmapTileDto> tiles,  List<String> notes)?  $default,) {final _that = this;
switch (_that) {
case _HeatmapDto() when $default != null:
return $default(_that.tiles,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HeatmapDto implements HeatmapDto {
  const _HeatmapDto({required final  List<HeatmapTileDto> tiles, required final  List<String> notes}): _tiles = tiles,_notes = notes;
  factory _HeatmapDto.fromJson(Map<String, dynamic> json) => _$HeatmapDtoFromJson(json);

 final  List<HeatmapTileDto> _tiles;
@override List<HeatmapTileDto> get tiles {
  if (_tiles is EqualUnmodifiableListView) return _tiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tiles);
}

 final  List<String> _notes;
@override List<String> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}


/// Create a copy of HeatmapDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeatmapDtoCopyWith<_HeatmapDto> get copyWith => __$HeatmapDtoCopyWithImpl<_HeatmapDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeatmapDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeatmapDto&&const DeepCollectionEquality().equals(other._tiles, _tiles)&&const DeepCollectionEquality().equals(other._notes, _notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tiles),const DeepCollectionEquality().hash(_notes));

@override
String toString() {
  return 'HeatmapDto(tiles: $tiles, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$HeatmapDtoCopyWith<$Res> implements $HeatmapDtoCopyWith<$Res> {
  factory _$HeatmapDtoCopyWith(_HeatmapDto value, $Res Function(_HeatmapDto) _then) = __$HeatmapDtoCopyWithImpl;
@override @useResult
$Res call({
 List<HeatmapTileDto> tiles, List<String> notes
});




}
/// @nodoc
class __$HeatmapDtoCopyWithImpl<$Res>
    implements _$HeatmapDtoCopyWith<$Res> {
  __$HeatmapDtoCopyWithImpl(this._self, this._then);

  final _HeatmapDto _self;
  final $Res Function(_HeatmapDto) _then;

/// Create a copy of HeatmapDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tiles = null,Object? notes = null,}) {
  return _then(_HeatmapDto(
tiles: null == tiles ? _self._tiles : tiles // ignore: cast_nullable_to_non_nullable
as List<HeatmapTileDto>,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
