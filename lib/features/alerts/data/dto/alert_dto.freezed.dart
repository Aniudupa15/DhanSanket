// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertDto {

 String get id; String get symbol;@JsonKey(name: 'alert_type') AlertTypeDto get alertType;// Decimal values here ride whatever shape the backend serializes them as
// (string or number) - parsed defensively in the repository mapper
// rather than via a converter, since json_serializable converters apply
// per-field, not per-map-value.
 Map<String, dynamic> get condition; AlertStatusDto get status;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'triggered_at') DateTime? get triggeredAt;
/// Create a copy of AlertDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertDtoCopyWith<AlertDto> get copyWith => _$AlertDtoCopyWithImpl<AlertDto>(this as AlertDto, _$identity);

  /// Serializes this AlertDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertDto&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.alertType, alertType) || other.alertType == alertType)&&const DeepCollectionEquality().equals(other.condition, condition)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,symbol,alertType,const DeepCollectionEquality().hash(condition),status,createdAt,triggeredAt);

@override
String toString() {
  return 'AlertDto(id: $id, symbol: $symbol, alertType: $alertType, condition: $condition, status: $status, createdAt: $createdAt, triggeredAt: $triggeredAt)';
}


}

/// @nodoc
abstract mixin class $AlertDtoCopyWith<$Res>  {
  factory $AlertDtoCopyWith(AlertDto value, $Res Function(AlertDto) _then) = _$AlertDtoCopyWithImpl;
@useResult
$Res call({
 String id, String symbol,@JsonKey(name: 'alert_type') AlertTypeDto alertType, Map<String, dynamic> condition, AlertStatusDto status,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'triggered_at') DateTime? triggeredAt
});




}
/// @nodoc
class _$AlertDtoCopyWithImpl<$Res>
    implements $AlertDtoCopyWith<$Res> {
  _$AlertDtoCopyWithImpl(this._self, this._then);

  final AlertDto _self;
  final $Res Function(AlertDto) _then;

/// Create a copy of AlertDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? alertType = null,Object? condition = null,Object? status = null,Object? createdAt = null,Object? triggeredAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,alertType: null == alertType ? _self.alertType : alertType // ignore: cast_nullable_to_non_nullable
as AlertTypeDto,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AlertStatusDto,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,triggeredAt: freezed == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertDto].
extension AlertDtoPatterns on AlertDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertDto value)  $default,){
final _that = this;
switch (_that) {
case _AlertDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertDto value)?  $default,){
final _that = this;
switch (_that) {
case _AlertDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol, @JsonKey(name: 'alert_type')  AlertTypeDto alertType,  Map<String, dynamic> condition,  AlertStatusDto status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'triggered_at')  DateTime? triggeredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertDto() when $default != null:
return $default(_that.id,_that.symbol,_that.alertType,_that.condition,_that.status,_that.createdAt,_that.triggeredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol, @JsonKey(name: 'alert_type')  AlertTypeDto alertType,  Map<String, dynamic> condition,  AlertStatusDto status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'triggered_at')  DateTime? triggeredAt)  $default,) {final _that = this;
switch (_that) {
case _AlertDto():
return $default(_that.id,_that.symbol,_that.alertType,_that.condition,_that.status,_that.createdAt,_that.triggeredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol, @JsonKey(name: 'alert_type')  AlertTypeDto alertType,  Map<String, dynamic> condition,  AlertStatusDto status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'triggered_at')  DateTime? triggeredAt)?  $default,) {final _that = this;
switch (_that) {
case _AlertDto() when $default != null:
return $default(_that.id,_that.symbol,_that.alertType,_that.condition,_that.status,_that.createdAt,_that.triggeredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertDto implements AlertDto {
  const _AlertDto({required this.id, required this.symbol, @JsonKey(name: 'alert_type') required this.alertType, required final  Map<String, dynamic> condition, required this.status, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'triggered_at') this.triggeredAt}): _condition = condition;
  factory _AlertDto.fromJson(Map<String, dynamic> json) => _$AlertDtoFromJson(json);

@override final  String id;
@override final  String symbol;
@override@JsonKey(name: 'alert_type') final  AlertTypeDto alertType;
// Decimal values here ride whatever shape the backend serializes them as
// (string or number) - parsed defensively in the repository mapper
// rather than via a converter, since json_serializable converters apply
// per-field, not per-map-value.
 final  Map<String, dynamic> _condition;
// Decimal values here ride whatever shape the backend serializes them as
// (string or number) - parsed defensively in the repository mapper
// rather than via a converter, since json_serializable converters apply
// per-field, not per-map-value.
@override Map<String, dynamic> get condition {
  if (_condition is EqualUnmodifiableMapView) return _condition;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_condition);
}

@override final  AlertStatusDto status;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'triggered_at') final  DateTime? triggeredAt;

/// Create a copy of AlertDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertDtoCopyWith<_AlertDto> get copyWith => __$AlertDtoCopyWithImpl<_AlertDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertDto&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.alertType, alertType) || other.alertType == alertType)&&const DeepCollectionEquality().equals(other._condition, _condition)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,symbol,alertType,const DeepCollectionEquality().hash(_condition),status,createdAt,triggeredAt);

@override
String toString() {
  return 'AlertDto(id: $id, symbol: $symbol, alertType: $alertType, condition: $condition, status: $status, createdAt: $createdAt, triggeredAt: $triggeredAt)';
}


}

/// @nodoc
abstract mixin class _$AlertDtoCopyWith<$Res> implements $AlertDtoCopyWith<$Res> {
  factory _$AlertDtoCopyWith(_AlertDto value, $Res Function(_AlertDto) _then) = __$AlertDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol,@JsonKey(name: 'alert_type') AlertTypeDto alertType, Map<String, dynamic> condition, AlertStatusDto status,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'triggered_at') DateTime? triggeredAt
});




}
/// @nodoc
class __$AlertDtoCopyWithImpl<$Res>
    implements _$AlertDtoCopyWith<$Res> {
  __$AlertDtoCopyWithImpl(this._self, this._then);

  final _AlertDto _self;
  final $Res Function(_AlertDto) _then;

/// Create a copy of AlertDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? alertType = null,Object? condition = null,Object? status = null,Object? createdAt = null,Object? triggeredAt = freezed,}) {
  return _then(_AlertDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,alertType: null == alertType ? _self.alertType : alertType // ignore: cast_nullable_to_non_nullable
as AlertTypeDto,condition: null == condition ? _self._condition : condition // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AlertStatusDto,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,triggeredAt: freezed == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
