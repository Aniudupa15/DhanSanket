// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioDetailDto {

 String get id; String get name;@JsonKey(name: 'created_at') DateTime get createdAt; List<HoldingDto> get holdings;
/// Create a copy of PortfolioDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioDetailDtoCopyWith<PortfolioDetailDto> get copyWith => _$PortfolioDetailDtoCopyWithImpl<PortfolioDetailDto>(this as PortfolioDetailDto, _$identity);

  /// Serializes this PortfolioDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.holdings, holdings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,const DeepCollectionEquality().hash(holdings));

@override
String toString() {
  return 'PortfolioDetailDto(id: $id, name: $name, createdAt: $createdAt, holdings: $holdings)';
}


}

/// @nodoc
abstract mixin class $PortfolioDetailDtoCopyWith<$Res>  {
  factory $PortfolioDetailDtoCopyWith(PortfolioDetailDto value, $Res Function(PortfolioDetailDto) _then) = _$PortfolioDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'created_at') DateTime createdAt, List<HoldingDto> holdings
});




}
/// @nodoc
class _$PortfolioDetailDtoCopyWithImpl<$Res>
    implements $PortfolioDetailDtoCopyWith<$Res> {
  _$PortfolioDetailDtoCopyWithImpl(this._self, this._then);

  final PortfolioDetailDto _self;
  final $Res Function(PortfolioDetailDto) _then;

/// Create a copy of PortfolioDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? holdings = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,holdings: null == holdings ? _self.holdings : holdings // ignore: cast_nullable_to_non_nullable
as List<HoldingDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioDetailDto].
extension PortfolioDetailDtoPatterns on PortfolioDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'created_at')  DateTime createdAt,  List<HoldingDto> holdings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.createdAt,_that.holdings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'created_at')  DateTime createdAt,  List<HoldingDto> holdings)  $default,) {final _that = this;
switch (_that) {
case _PortfolioDetailDto():
return $default(_that.id,_that.name,_that.createdAt,_that.holdings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'created_at')  DateTime createdAt,  List<HoldingDto> holdings)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.createdAt,_that.holdings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioDetailDto implements PortfolioDetailDto {
  const _PortfolioDetailDto({required this.id, required this.name, @JsonKey(name: 'created_at') required this.createdAt, required final  List<HoldingDto> holdings}): _holdings = holdings;
  factory _PortfolioDetailDto.fromJson(Map<String, dynamic> json) => _$PortfolioDetailDtoFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
 final  List<HoldingDto> _holdings;
@override List<HoldingDto> get holdings {
  if (_holdings is EqualUnmodifiableListView) return _holdings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_holdings);
}


/// Create a copy of PortfolioDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioDetailDtoCopyWith<_PortfolioDetailDto> get copyWith => __$PortfolioDetailDtoCopyWithImpl<_PortfolioDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._holdings, _holdings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,const DeepCollectionEquality().hash(_holdings));

@override
String toString() {
  return 'PortfolioDetailDto(id: $id, name: $name, createdAt: $createdAt, holdings: $holdings)';
}


}

/// @nodoc
abstract mixin class _$PortfolioDetailDtoCopyWith<$Res> implements $PortfolioDetailDtoCopyWith<$Res> {
  factory _$PortfolioDetailDtoCopyWith(_PortfolioDetailDto value, $Res Function(_PortfolioDetailDto) _then) = __$PortfolioDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'created_at') DateTime createdAt, List<HoldingDto> holdings
});




}
/// @nodoc
class __$PortfolioDetailDtoCopyWithImpl<$Res>
    implements _$PortfolioDetailDtoCopyWith<$Res> {
  __$PortfolioDetailDtoCopyWithImpl(this._self, this._then);

  final _PortfolioDetailDto _self;
  final $Res Function(_PortfolioDetailDto) _then;

/// Create a copy of PortfolioDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? holdings = null,}) {
  return _then(_PortfolioDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,holdings: null == holdings ? _self._holdings : holdings // ignore: cast_nullable_to_non_nullable
as List<HoldingDto>,
  ));
}


}

// dart format on
