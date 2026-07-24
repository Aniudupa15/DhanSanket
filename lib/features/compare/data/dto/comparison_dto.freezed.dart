// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comparison_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComparisonEntryDto {

 StockDetailDto get detail; IndicatorsDto get indicators; FundamentalsDto get fundamentals;
/// Create a copy of ComparisonEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparisonEntryDtoCopyWith<ComparisonEntryDto> get copyWith => _$ComparisonEntryDtoCopyWithImpl<ComparisonEntryDto>(this as ComparisonEntryDto, _$identity);

  /// Serializes this ComparisonEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonEntryDto&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.indicators, indicators) || other.indicators == indicators)&&(identical(other.fundamentals, fundamentals) || other.fundamentals == fundamentals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,detail,indicators,fundamentals);

@override
String toString() {
  return 'ComparisonEntryDto(detail: $detail, indicators: $indicators, fundamentals: $fundamentals)';
}


}

/// @nodoc
abstract mixin class $ComparisonEntryDtoCopyWith<$Res>  {
  factory $ComparisonEntryDtoCopyWith(ComparisonEntryDto value, $Res Function(ComparisonEntryDto) _then) = _$ComparisonEntryDtoCopyWithImpl;
@useResult
$Res call({
 StockDetailDto detail, IndicatorsDto indicators, FundamentalsDto fundamentals
});


$StockDetailDtoCopyWith<$Res> get detail;$IndicatorsDtoCopyWith<$Res> get indicators;$FundamentalsDtoCopyWith<$Res> get fundamentals;

}
/// @nodoc
class _$ComparisonEntryDtoCopyWithImpl<$Res>
    implements $ComparisonEntryDtoCopyWith<$Res> {
  _$ComparisonEntryDtoCopyWithImpl(this._self, this._then);

  final ComparisonEntryDto _self;
  final $Res Function(ComparisonEntryDto) _then;

/// Create a copy of ComparisonEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? detail = null,Object? indicators = null,Object? fundamentals = null,}) {
  return _then(_self.copyWith(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as StockDetailDto,indicators: null == indicators ? _self.indicators : indicators // ignore: cast_nullable_to_non_nullable
as IndicatorsDto,fundamentals: null == fundamentals ? _self.fundamentals : fundamentals // ignore: cast_nullable_to_non_nullable
as FundamentalsDto,
  ));
}
/// Create a copy of ComparisonEntryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockDetailDtoCopyWith<$Res> get detail {
  
  return $StockDetailDtoCopyWith<$Res>(_self.detail, (value) {
    return _then(_self.copyWith(detail: value));
  });
}/// Create a copy of ComparisonEntryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IndicatorsDtoCopyWith<$Res> get indicators {
  
  return $IndicatorsDtoCopyWith<$Res>(_self.indicators, (value) {
    return _then(_self.copyWith(indicators: value));
  });
}/// Create a copy of ComparisonEntryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FundamentalsDtoCopyWith<$Res> get fundamentals {
  
  return $FundamentalsDtoCopyWith<$Res>(_self.fundamentals, (value) {
    return _then(_self.copyWith(fundamentals: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComparisonEntryDto].
extension ComparisonEntryDtoPatterns on ComparisonEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComparisonEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComparisonEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComparisonEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _ComparisonEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComparisonEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _ComparisonEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StockDetailDto detail,  IndicatorsDto indicators,  FundamentalsDto fundamentals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComparisonEntryDto() when $default != null:
return $default(_that.detail,_that.indicators,_that.fundamentals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StockDetailDto detail,  IndicatorsDto indicators,  FundamentalsDto fundamentals)  $default,) {final _that = this;
switch (_that) {
case _ComparisonEntryDto():
return $default(_that.detail,_that.indicators,_that.fundamentals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StockDetailDto detail,  IndicatorsDto indicators,  FundamentalsDto fundamentals)?  $default,) {final _that = this;
switch (_that) {
case _ComparisonEntryDto() when $default != null:
return $default(_that.detail,_that.indicators,_that.fundamentals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComparisonEntryDto implements ComparisonEntryDto {
  const _ComparisonEntryDto({required this.detail, required this.indicators, required this.fundamentals});
  factory _ComparisonEntryDto.fromJson(Map<String, dynamic> json) => _$ComparisonEntryDtoFromJson(json);

@override final  StockDetailDto detail;
@override final  IndicatorsDto indicators;
@override final  FundamentalsDto fundamentals;

/// Create a copy of ComparisonEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComparisonEntryDtoCopyWith<_ComparisonEntryDto> get copyWith => __$ComparisonEntryDtoCopyWithImpl<_ComparisonEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComparisonEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComparisonEntryDto&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.indicators, indicators) || other.indicators == indicators)&&(identical(other.fundamentals, fundamentals) || other.fundamentals == fundamentals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,detail,indicators,fundamentals);

@override
String toString() {
  return 'ComparisonEntryDto(detail: $detail, indicators: $indicators, fundamentals: $fundamentals)';
}


}

/// @nodoc
abstract mixin class _$ComparisonEntryDtoCopyWith<$Res> implements $ComparisonEntryDtoCopyWith<$Res> {
  factory _$ComparisonEntryDtoCopyWith(_ComparisonEntryDto value, $Res Function(_ComparisonEntryDto) _then) = __$ComparisonEntryDtoCopyWithImpl;
@override @useResult
$Res call({
 StockDetailDto detail, IndicatorsDto indicators, FundamentalsDto fundamentals
});


@override $StockDetailDtoCopyWith<$Res> get detail;@override $IndicatorsDtoCopyWith<$Res> get indicators;@override $FundamentalsDtoCopyWith<$Res> get fundamentals;

}
/// @nodoc
class __$ComparisonEntryDtoCopyWithImpl<$Res>
    implements _$ComparisonEntryDtoCopyWith<$Res> {
  __$ComparisonEntryDtoCopyWithImpl(this._self, this._then);

  final _ComparisonEntryDto _self;
  final $Res Function(_ComparisonEntryDto) _then;

/// Create a copy of ComparisonEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detail = null,Object? indicators = null,Object? fundamentals = null,}) {
  return _then(_ComparisonEntryDto(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as StockDetailDto,indicators: null == indicators ? _self.indicators : indicators // ignore: cast_nullable_to_non_nullable
as IndicatorsDto,fundamentals: null == fundamentals ? _self.fundamentals : fundamentals // ignore: cast_nullable_to_non_nullable
as FundamentalsDto,
  ));
}

/// Create a copy of ComparisonEntryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockDetailDtoCopyWith<$Res> get detail {
  
  return $StockDetailDtoCopyWith<$Res>(_self.detail, (value) {
    return _then(_self.copyWith(detail: value));
  });
}/// Create a copy of ComparisonEntryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IndicatorsDtoCopyWith<$Res> get indicators {
  
  return $IndicatorsDtoCopyWith<$Res>(_self.indicators, (value) {
    return _then(_self.copyWith(indicators: value));
  });
}/// Create a copy of ComparisonEntryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FundamentalsDtoCopyWith<$Res> get fundamentals {
  
  return $FundamentalsDtoCopyWith<$Res>(_self.fundamentals, (value) {
    return _then(_self.copyWith(fundamentals: value));
  });
}
}


/// @nodoc
mixin _$ComparisonDto {

 List<ComparisonEntryDto> get entries;
/// Create a copy of ComparisonDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparisonDtoCopyWith<ComparisonDto> get copyWith => _$ComparisonDtoCopyWithImpl<ComparisonDto>(this as ComparisonDto, _$identity);

  /// Serializes this ComparisonDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonDto&&const DeepCollectionEquality().equals(other.entries, entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(entries));

@override
String toString() {
  return 'ComparisonDto(entries: $entries)';
}


}

/// @nodoc
abstract mixin class $ComparisonDtoCopyWith<$Res>  {
  factory $ComparisonDtoCopyWith(ComparisonDto value, $Res Function(ComparisonDto) _then) = _$ComparisonDtoCopyWithImpl;
@useResult
$Res call({
 List<ComparisonEntryDto> entries
});




}
/// @nodoc
class _$ComparisonDtoCopyWithImpl<$Res>
    implements $ComparisonDtoCopyWith<$Res> {
  _$ComparisonDtoCopyWithImpl(this._self, this._then);

  final ComparisonDto _self;
  final $Res Function(ComparisonDto) _then;

/// Create a copy of ComparisonDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,}) {
  return _then(_self.copyWith(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<ComparisonEntryDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ComparisonDto].
extension ComparisonDtoPatterns on ComparisonDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComparisonDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComparisonDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComparisonDto value)  $default,){
final _that = this;
switch (_that) {
case _ComparisonDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComparisonDto value)?  $default,){
final _that = this;
switch (_that) {
case _ComparisonDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ComparisonEntryDto> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComparisonDto() when $default != null:
return $default(_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ComparisonEntryDto> entries)  $default,) {final _that = this;
switch (_that) {
case _ComparisonDto():
return $default(_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ComparisonEntryDto> entries)?  $default,) {final _that = this;
switch (_that) {
case _ComparisonDto() when $default != null:
return $default(_that.entries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComparisonDto implements ComparisonDto {
  const _ComparisonDto({required final  List<ComparisonEntryDto> entries}): _entries = entries;
  factory _ComparisonDto.fromJson(Map<String, dynamic> json) => _$ComparisonDtoFromJson(json);

 final  List<ComparisonEntryDto> _entries;
@override List<ComparisonEntryDto> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of ComparisonDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComparisonDtoCopyWith<_ComparisonDto> get copyWith => __$ComparisonDtoCopyWithImpl<_ComparisonDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComparisonDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComparisonDto&&const DeepCollectionEquality().equals(other._entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries));

@override
String toString() {
  return 'ComparisonDto(entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$ComparisonDtoCopyWith<$Res> implements $ComparisonDtoCopyWith<$Res> {
  factory _$ComparisonDtoCopyWith(_ComparisonDto value, $Res Function(_ComparisonDto) _then) = __$ComparisonDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ComparisonEntryDto> entries
});




}
/// @nodoc
class __$ComparisonDtoCopyWithImpl<$Res>
    implements _$ComparisonDtoCopyWith<$Res> {
  __$ComparisonDtoCopyWithImpl(this._self, this._then);

  final _ComparisonDto _self;
  final $Res Function(_ComparisonDto) _then;

/// Create a copy of ComparisonDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,}) {
  return _then(_ComparisonDto(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<ComparisonEntryDto>,
  ));
}


}

// dart format on
