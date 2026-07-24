// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'corporate_action_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CorporateActionDto {

 String get purpose;@NullableDecimalConverter()@JsonKey(name: 'face_value') Decimal? get faceValue;@JsonKey(name: 'ex_date') DateTime? get exDate;@JsonKey(name: 'record_date') DateTime? get recordDate;@JsonKey(name: 'book_closure_start') DateTime? get bookClosureStart;@JsonKey(name: 'book_closure_end') DateTime? get bookClosureEnd;
/// Create a copy of CorporateActionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorporateActionDtoCopyWith<CorporateActionDto> get copyWith => _$CorporateActionDtoCopyWithImpl<CorporateActionDto>(this as CorporateActionDto, _$identity);

  /// Serializes this CorporateActionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorporateActionDto&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.faceValue, faceValue) || other.faceValue == faceValue)&&(identical(other.exDate, exDate) || other.exDate == exDate)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.bookClosureStart, bookClosureStart) || other.bookClosureStart == bookClosureStart)&&(identical(other.bookClosureEnd, bookClosureEnd) || other.bookClosureEnd == bookClosureEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,purpose,faceValue,exDate,recordDate,bookClosureStart,bookClosureEnd);

@override
String toString() {
  return 'CorporateActionDto(purpose: $purpose, faceValue: $faceValue, exDate: $exDate, recordDate: $recordDate, bookClosureStart: $bookClosureStart, bookClosureEnd: $bookClosureEnd)';
}


}

/// @nodoc
abstract mixin class $CorporateActionDtoCopyWith<$Res>  {
  factory $CorporateActionDtoCopyWith(CorporateActionDto value, $Res Function(CorporateActionDto) _then) = _$CorporateActionDtoCopyWithImpl;
@useResult
$Res call({
 String purpose,@NullableDecimalConverter()@JsonKey(name: 'face_value') Decimal? faceValue,@JsonKey(name: 'ex_date') DateTime? exDate,@JsonKey(name: 'record_date') DateTime? recordDate,@JsonKey(name: 'book_closure_start') DateTime? bookClosureStart,@JsonKey(name: 'book_closure_end') DateTime? bookClosureEnd
});




}
/// @nodoc
class _$CorporateActionDtoCopyWithImpl<$Res>
    implements $CorporateActionDtoCopyWith<$Res> {
  _$CorporateActionDtoCopyWithImpl(this._self, this._then);

  final CorporateActionDto _self;
  final $Res Function(CorporateActionDto) _then;

/// Create a copy of CorporateActionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? purpose = null,Object? faceValue = freezed,Object? exDate = freezed,Object? recordDate = freezed,Object? bookClosureStart = freezed,Object? bookClosureEnd = freezed,}) {
  return _then(_self.copyWith(
purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,faceValue: freezed == faceValue ? _self.faceValue : faceValue // ignore: cast_nullable_to_non_nullable
as Decimal?,exDate: freezed == exDate ? _self.exDate : exDate // ignore: cast_nullable_to_non_nullable
as DateTime?,recordDate: freezed == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime?,bookClosureStart: freezed == bookClosureStart ? _self.bookClosureStart : bookClosureStart // ignore: cast_nullable_to_non_nullable
as DateTime?,bookClosureEnd: freezed == bookClosureEnd ? _self.bookClosureEnd : bookClosureEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CorporateActionDto].
extension CorporateActionDtoPatterns on CorporateActionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CorporateActionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CorporateActionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CorporateActionDto value)  $default,){
final _that = this;
switch (_that) {
case _CorporateActionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CorporateActionDto value)?  $default,){
final _that = this;
switch (_that) {
case _CorporateActionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String purpose, @NullableDecimalConverter()@JsonKey(name: 'face_value')  Decimal? faceValue, @JsonKey(name: 'ex_date')  DateTime? exDate, @JsonKey(name: 'record_date')  DateTime? recordDate, @JsonKey(name: 'book_closure_start')  DateTime? bookClosureStart, @JsonKey(name: 'book_closure_end')  DateTime? bookClosureEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CorporateActionDto() when $default != null:
return $default(_that.purpose,_that.faceValue,_that.exDate,_that.recordDate,_that.bookClosureStart,_that.bookClosureEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String purpose, @NullableDecimalConverter()@JsonKey(name: 'face_value')  Decimal? faceValue, @JsonKey(name: 'ex_date')  DateTime? exDate, @JsonKey(name: 'record_date')  DateTime? recordDate, @JsonKey(name: 'book_closure_start')  DateTime? bookClosureStart, @JsonKey(name: 'book_closure_end')  DateTime? bookClosureEnd)  $default,) {final _that = this;
switch (_that) {
case _CorporateActionDto():
return $default(_that.purpose,_that.faceValue,_that.exDate,_that.recordDate,_that.bookClosureStart,_that.bookClosureEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String purpose, @NullableDecimalConverter()@JsonKey(name: 'face_value')  Decimal? faceValue, @JsonKey(name: 'ex_date')  DateTime? exDate, @JsonKey(name: 'record_date')  DateTime? recordDate, @JsonKey(name: 'book_closure_start')  DateTime? bookClosureStart, @JsonKey(name: 'book_closure_end')  DateTime? bookClosureEnd)?  $default,) {final _that = this;
switch (_that) {
case _CorporateActionDto() when $default != null:
return $default(_that.purpose,_that.faceValue,_that.exDate,_that.recordDate,_that.bookClosureStart,_that.bookClosureEnd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CorporateActionDto implements CorporateActionDto {
  const _CorporateActionDto({required this.purpose, @NullableDecimalConverter()@JsonKey(name: 'face_value') this.faceValue, @JsonKey(name: 'ex_date') this.exDate, @JsonKey(name: 'record_date') this.recordDate, @JsonKey(name: 'book_closure_start') this.bookClosureStart, @JsonKey(name: 'book_closure_end') this.bookClosureEnd});
  factory _CorporateActionDto.fromJson(Map<String, dynamic> json) => _$CorporateActionDtoFromJson(json);

@override final  String purpose;
@override@NullableDecimalConverter()@JsonKey(name: 'face_value') final  Decimal? faceValue;
@override@JsonKey(name: 'ex_date') final  DateTime? exDate;
@override@JsonKey(name: 'record_date') final  DateTime? recordDate;
@override@JsonKey(name: 'book_closure_start') final  DateTime? bookClosureStart;
@override@JsonKey(name: 'book_closure_end') final  DateTime? bookClosureEnd;

/// Create a copy of CorporateActionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorporateActionDtoCopyWith<_CorporateActionDto> get copyWith => __$CorporateActionDtoCopyWithImpl<_CorporateActionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CorporateActionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CorporateActionDto&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.faceValue, faceValue) || other.faceValue == faceValue)&&(identical(other.exDate, exDate) || other.exDate == exDate)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.bookClosureStart, bookClosureStart) || other.bookClosureStart == bookClosureStart)&&(identical(other.bookClosureEnd, bookClosureEnd) || other.bookClosureEnd == bookClosureEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,purpose,faceValue,exDate,recordDate,bookClosureStart,bookClosureEnd);

@override
String toString() {
  return 'CorporateActionDto(purpose: $purpose, faceValue: $faceValue, exDate: $exDate, recordDate: $recordDate, bookClosureStart: $bookClosureStart, bookClosureEnd: $bookClosureEnd)';
}


}

/// @nodoc
abstract mixin class _$CorporateActionDtoCopyWith<$Res> implements $CorporateActionDtoCopyWith<$Res> {
  factory _$CorporateActionDtoCopyWith(_CorporateActionDto value, $Res Function(_CorporateActionDto) _then) = __$CorporateActionDtoCopyWithImpl;
@override @useResult
$Res call({
 String purpose,@NullableDecimalConverter()@JsonKey(name: 'face_value') Decimal? faceValue,@JsonKey(name: 'ex_date') DateTime? exDate,@JsonKey(name: 'record_date') DateTime? recordDate,@JsonKey(name: 'book_closure_start') DateTime? bookClosureStart,@JsonKey(name: 'book_closure_end') DateTime? bookClosureEnd
});




}
/// @nodoc
class __$CorporateActionDtoCopyWithImpl<$Res>
    implements _$CorporateActionDtoCopyWith<$Res> {
  __$CorporateActionDtoCopyWithImpl(this._self, this._then);

  final _CorporateActionDto _self;
  final $Res Function(_CorporateActionDto) _then;

/// Create a copy of CorporateActionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? purpose = null,Object? faceValue = freezed,Object? exDate = freezed,Object? recordDate = freezed,Object? bookClosureStart = freezed,Object? bookClosureEnd = freezed,}) {
  return _then(_CorporateActionDto(
purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,faceValue: freezed == faceValue ? _self.faceValue : faceValue // ignore: cast_nullable_to_non_nullable
as Decimal?,exDate: freezed == exDate ? _self.exDate : exDate // ignore: cast_nullable_to_non_nullable
as DateTime?,recordDate: freezed == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime?,bookClosureStart: freezed == bookClosureStart ? _self.bookClosureStart : bookClosureStart // ignore: cast_nullable_to_non_nullable
as DateTime?,bookClosureEnd: freezed == bookClosureEnd ? _self.bookClosureEnd : bookClosureEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
