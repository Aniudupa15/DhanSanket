// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchlistDetailDto {

 String get id; String get name;@JsonKey(name: 'created_at') DateTime get createdAt; List<WatchlistItemDto> get items;
/// Create a copy of WatchlistDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistDetailDtoCopyWith<WatchlistDetailDto> get copyWith => _$WatchlistDetailDtoCopyWithImpl<WatchlistDetailDto>(this as WatchlistDetailDto, _$identity);

  /// Serializes this WatchlistDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'WatchlistDetailDto(id: $id, name: $name, createdAt: $createdAt, items: $items)';
}


}

/// @nodoc
abstract mixin class $WatchlistDetailDtoCopyWith<$Res>  {
  factory $WatchlistDetailDtoCopyWith(WatchlistDetailDto value, $Res Function(WatchlistDetailDto) _then) = _$WatchlistDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'created_at') DateTime createdAt, List<WatchlistItemDto> items
});




}
/// @nodoc
class _$WatchlistDetailDtoCopyWithImpl<$Res>
    implements $WatchlistDetailDtoCopyWith<$Res> {
  _$WatchlistDetailDtoCopyWithImpl(this._self, this._then);

  final WatchlistDetailDto _self;
  final $Res Function(WatchlistDetailDto) _then;

/// Create a copy of WatchlistDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<WatchlistItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchlistDetailDto].
extension WatchlistDetailDtoPatterns on WatchlistDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchlistDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchlistDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchlistDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _WatchlistDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchlistDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _WatchlistDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'created_at')  DateTime createdAt,  List<WatchlistItemDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchlistDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.createdAt,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'created_at')  DateTime createdAt,  List<WatchlistItemDto> items)  $default,) {final _that = this;
switch (_that) {
case _WatchlistDetailDto():
return $default(_that.id,_that.name,_that.createdAt,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'created_at')  DateTime createdAt,  List<WatchlistItemDto> items)?  $default,) {final _that = this;
switch (_that) {
case _WatchlistDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.createdAt,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchlistDetailDto implements WatchlistDetailDto {
  const _WatchlistDetailDto({required this.id, required this.name, @JsonKey(name: 'created_at') required this.createdAt, required final  List<WatchlistItemDto> items}): _items = items;
  factory _WatchlistDetailDto.fromJson(Map<String, dynamic> json) => _$WatchlistDetailDtoFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
 final  List<WatchlistItemDto> _items;
@override List<WatchlistItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of WatchlistDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistDetailDtoCopyWith<_WatchlistDetailDto> get copyWith => __$WatchlistDetailDtoCopyWithImpl<_WatchlistDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchlistDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'WatchlistDetailDto(id: $id, name: $name, createdAt: $createdAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$WatchlistDetailDtoCopyWith<$Res> implements $WatchlistDetailDtoCopyWith<$Res> {
  factory _$WatchlistDetailDtoCopyWith(_WatchlistDetailDto value, $Res Function(_WatchlistDetailDto) _then) = __$WatchlistDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'created_at') DateTime createdAt, List<WatchlistItemDto> items
});




}
/// @nodoc
class __$WatchlistDetailDtoCopyWithImpl<$Res>
    implements _$WatchlistDetailDtoCopyWith<$Res> {
  __$WatchlistDetailDtoCopyWithImpl(this._self, this._then);

  final _WatchlistDetailDto _self;
  final $Res Function(_WatchlistDetailDto) _then;

/// Create a copy of WatchlistDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? items = null,}) {
  return _then(_WatchlistDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<WatchlistItemDto>,
  ));
}


}

// dart format on
