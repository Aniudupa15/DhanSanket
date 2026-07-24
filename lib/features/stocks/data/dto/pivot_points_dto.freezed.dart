// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pivot_points_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PivotPointsDto {

@DecimalConverter() Decimal get pivot;@DecimalConverter() Decimal get r1;@DecimalConverter() Decimal get r2;@DecimalConverter() Decimal get r3;@DecimalConverter() Decimal get s1;@DecimalConverter() Decimal get s2;@DecimalConverter() Decimal get s3;
/// Create a copy of PivotPointsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PivotPointsDtoCopyWith<PivotPointsDto> get copyWith => _$PivotPointsDtoCopyWithImpl<PivotPointsDto>(this as PivotPointsDto, _$identity);

  /// Serializes this PivotPointsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PivotPointsDto&&(identical(other.pivot, pivot) || other.pivot == pivot)&&(identical(other.r1, r1) || other.r1 == r1)&&(identical(other.r2, r2) || other.r2 == r2)&&(identical(other.r3, r3) || other.r3 == r3)&&(identical(other.s1, s1) || other.s1 == s1)&&(identical(other.s2, s2) || other.s2 == s2)&&(identical(other.s3, s3) || other.s3 == s3));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pivot,r1,r2,r3,s1,s2,s3);

@override
String toString() {
  return 'PivotPointsDto(pivot: $pivot, r1: $r1, r2: $r2, r3: $r3, s1: $s1, s2: $s2, s3: $s3)';
}


}

/// @nodoc
abstract mixin class $PivotPointsDtoCopyWith<$Res>  {
  factory $PivotPointsDtoCopyWith(PivotPointsDto value, $Res Function(PivotPointsDto) _then) = _$PivotPointsDtoCopyWithImpl;
@useResult
$Res call({
@DecimalConverter() Decimal pivot,@DecimalConverter() Decimal r1,@DecimalConverter() Decimal r2,@DecimalConverter() Decimal r3,@DecimalConverter() Decimal s1,@DecimalConverter() Decimal s2,@DecimalConverter() Decimal s3
});




}
/// @nodoc
class _$PivotPointsDtoCopyWithImpl<$Res>
    implements $PivotPointsDtoCopyWith<$Res> {
  _$PivotPointsDtoCopyWithImpl(this._self, this._then);

  final PivotPointsDto _self;
  final $Res Function(PivotPointsDto) _then;

/// Create a copy of PivotPointsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pivot = null,Object? r1 = null,Object? r2 = null,Object? r3 = null,Object? s1 = null,Object? s2 = null,Object? s3 = null,}) {
  return _then(_self.copyWith(
pivot: null == pivot ? _self.pivot : pivot // ignore: cast_nullable_to_non_nullable
as Decimal,r1: null == r1 ? _self.r1 : r1 // ignore: cast_nullable_to_non_nullable
as Decimal,r2: null == r2 ? _self.r2 : r2 // ignore: cast_nullable_to_non_nullable
as Decimal,r3: null == r3 ? _self.r3 : r3 // ignore: cast_nullable_to_non_nullable
as Decimal,s1: null == s1 ? _self.s1 : s1 // ignore: cast_nullable_to_non_nullable
as Decimal,s2: null == s2 ? _self.s2 : s2 // ignore: cast_nullable_to_non_nullable
as Decimal,s3: null == s3 ? _self.s3 : s3 // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}

}


/// Adds pattern-matching-related methods to [PivotPointsDto].
extension PivotPointsDtoPatterns on PivotPointsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PivotPointsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PivotPointsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PivotPointsDto value)  $default,){
final _that = this;
switch (_that) {
case _PivotPointsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PivotPointsDto value)?  $default,){
final _that = this;
switch (_that) {
case _PivotPointsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DecimalConverter()  Decimal pivot, @DecimalConverter()  Decimal r1, @DecimalConverter()  Decimal r2, @DecimalConverter()  Decimal r3, @DecimalConverter()  Decimal s1, @DecimalConverter()  Decimal s2, @DecimalConverter()  Decimal s3)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PivotPointsDto() when $default != null:
return $default(_that.pivot,_that.r1,_that.r2,_that.r3,_that.s1,_that.s2,_that.s3);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DecimalConverter()  Decimal pivot, @DecimalConverter()  Decimal r1, @DecimalConverter()  Decimal r2, @DecimalConverter()  Decimal r3, @DecimalConverter()  Decimal s1, @DecimalConverter()  Decimal s2, @DecimalConverter()  Decimal s3)  $default,) {final _that = this;
switch (_that) {
case _PivotPointsDto():
return $default(_that.pivot,_that.r1,_that.r2,_that.r3,_that.s1,_that.s2,_that.s3);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DecimalConverter()  Decimal pivot, @DecimalConverter()  Decimal r1, @DecimalConverter()  Decimal r2, @DecimalConverter()  Decimal r3, @DecimalConverter()  Decimal s1, @DecimalConverter()  Decimal s2, @DecimalConverter()  Decimal s3)?  $default,) {final _that = this;
switch (_that) {
case _PivotPointsDto() when $default != null:
return $default(_that.pivot,_that.r1,_that.r2,_that.r3,_that.s1,_that.s2,_that.s3);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PivotPointsDto implements PivotPointsDto {
  const _PivotPointsDto({@DecimalConverter() required this.pivot, @DecimalConverter() required this.r1, @DecimalConverter() required this.r2, @DecimalConverter() required this.r3, @DecimalConverter() required this.s1, @DecimalConverter() required this.s2, @DecimalConverter() required this.s3});
  factory _PivotPointsDto.fromJson(Map<String, dynamic> json) => _$PivotPointsDtoFromJson(json);

@override@DecimalConverter() final  Decimal pivot;
@override@DecimalConverter() final  Decimal r1;
@override@DecimalConverter() final  Decimal r2;
@override@DecimalConverter() final  Decimal r3;
@override@DecimalConverter() final  Decimal s1;
@override@DecimalConverter() final  Decimal s2;
@override@DecimalConverter() final  Decimal s3;

/// Create a copy of PivotPointsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PivotPointsDtoCopyWith<_PivotPointsDto> get copyWith => __$PivotPointsDtoCopyWithImpl<_PivotPointsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PivotPointsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PivotPointsDto&&(identical(other.pivot, pivot) || other.pivot == pivot)&&(identical(other.r1, r1) || other.r1 == r1)&&(identical(other.r2, r2) || other.r2 == r2)&&(identical(other.r3, r3) || other.r3 == r3)&&(identical(other.s1, s1) || other.s1 == s1)&&(identical(other.s2, s2) || other.s2 == s2)&&(identical(other.s3, s3) || other.s3 == s3));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pivot,r1,r2,r3,s1,s2,s3);

@override
String toString() {
  return 'PivotPointsDto(pivot: $pivot, r1: $r1, r2: $r2, r3: $r3, s1: $s1, s2: $s2, s3: $s3)';
}


}

/// @nodoc
abstract mixin class _$PivotPointsDtoCopyWith<$Res> implements $PivotPointsDtoCopyWith<$Res> {
  factory _$PivotPointsDtoCopyWith(_PivotPointsDto value, $Res Function(_PivotPointsDto) _then) = __$PivotPointsDtoCopyWithImpl;
@override @useResult
$Res call({
@DecimalConverter() Decimal pivot,@DecimalConverter() Decimal r1,@DecimalConverter() Decimal r2,@DecimalConverter() Decimal r3,@DecimalConverter() Decimal s1,@DecimalConverter() Decimal s2,@DecimalConverter() Decimal s3
});




}
/// @nodoc
class __$PivotPointsDtoCopyWithImpl<$Res>
    implements _$PivotPointsDtoCopyWith<$Res> {
  __$PivotPointsDtoCopyWithImpl(this._self, this._then);

  final _PivotPointsDto _self;
  final $Res Function(_PivotPointsDto) _then;

/// Create a copy of PivotPointsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pivot = null,Object? r1 = null,Object? r2 = null,Object? r3 = null,Object? s1 = null,Object? s2 = null,Object? s3 = null,}) {
  return _then(_PivotPointsDto(
pivot: null == pivot ? _self.pivot : pivot // ignore: cast_nullable_to_non_nullable
as Decimal,r1: null == r1 ? _self.r1 : r1 // ignore: cast_nullable_to_non_nullable
as Decimal,r2: null == r2 ? _self.r2 : r2 // ignore: cast_nullable_to_non_nullable
as Decimal,r3: null == r3 ? _self.r3 : r3 // ignore: cast_nullable_to_non_nullable
as Decimal,s1: null == s1 ? _self.s1 : s1 // ignore: cast_nullable_to_non_nullable
as Decimal,s2: null == s2 ? _self.s2 : s2 // ignore: cast_nullable_to_non_nullable
as Decimal,s3: null == s3 ? _self.s3 : s3 // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}


}

// dart format on
