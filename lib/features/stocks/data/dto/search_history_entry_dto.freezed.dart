// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_history_entry_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchHistoryEntryDto {

 String get query;@JsonKey(name: 'searched_at') DateTime get searchedAt;
/// Create a copy of SearchHistoryEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchHistoryEntryDtoCopyWith<SearchHistoryEntryDto> get copyWith => _$SearchHistoryEntryDtoCopyWithImpl<SearchHistoryEntryDto>(this as SearchHistoryEntryDto, _$identity);

  /// Serializes this SearchHistoryEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchHistoryEntryDto&&(identical(other.query, query) || other.query == query)&&(identical(other.searchedAt, searchedAt) || other.searchedAt == searchedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,searchedAt);

@override
String toString() {
  return 'SearchHistoryEntryDto(query: $query, searchedAt: $searchedAt)';
}


}

/// @nodoc
abstract mixin class $SearchHistoryEntryDtoCopyWith<$Res>  {
  factory $SearchHistoryEntryDtoCopyWith(SearchHistoryEntryDto value, $Res Function(SearchHistoryEntryDto) _then) = _$SearchHistoryEntryDtoCopyWithImpl;
@useResult
$Res call({
 String query,@JsonKey(name: 'searched_at') DateTime searchedAt
});




}
/// @nodoc
class _$SearchHistoryEntryDtoCopyWithImpl<$Res>
    implements $SearchHistoryEntryDtoCopyWith<$Res> {
  _$SearchHistoryEntryDtoCopyWithImpl(this._self, this._then);

  final SearchHistoryEntryDto _self;
  final $Res Function(SearchHistoryEntryDto) _then;

/// Create a copy of SearchHistoryEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? searchedAt = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,searchedAt: null == searchedAt ? _self.searchedAt : searchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchHistoryEntryDto].
extension SearchHistoryEntryDtoPatterns on SearchHistoryEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchHistoryEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchHistoryEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchHistoryEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _SearchHistoryEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchHistoryEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _SearchHistoryEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query, @JsonKey(name: 'searched_at')  DateTime searchedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchHistoryEntryDto() when $default != null:
return $default(_that.query,_that.searchedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query, @JsonKey(name: 'searched_at')  DateTime searchedAt)  $default,) {final _that = this;
switch (_that) {
case _SearchHistoryEntryDto():
return $default(_that.query,_that.searchedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query, @JsonKey(name: 'searched_at')  DateTime searchedAt)?  $default,) {final _that = this;
switch (_that) {
case _SearchHistoryEntryDto() when $default != null:
return $default(_that.query,_that.searchedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchHistoryEntryDto implements SearchHistoryEntryDto {
  const _SearchHistoryEntryDto({required this.query, @JsonKey(name: 'searched_at') required this.searchedAt});
  factory _SearchHistoryEntryDto.fromJson(Map<String, dynamic> json) => _$SearchHistoryEntryDtoFromJson(json);

@override final  String query;
@override@JsonKey(name: 'searched_at') final  DateTime searchedAt;

/// Create a copy of SearchHistoryEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchHistoryEntryDtoCopyWith<_SearchHistoryEntryDto> get copyWith => __$SearchHistoryEntryDtoCopyWithImpl<_SearchHistoryEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchHistoryEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchHistoryEntryDto&&(identical(other.query, query) || other.query == query)&&(identical(other.searchedAt, searchedAt) || other.searchedAt == searchedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,searchedAt);

@override
String toString() {
  return 'SearchHistoryEntryDto(query: $query, searchedAt: $searchedAt)';
}


}

/// @nodoc
abstract mixin class _$SearchHistoryEntryDtoCopyWith<$Res> implements $SearchHistoryEntryDtoCopyWith<$Res> {
  factory _$SearchHistoryEntryDtoCopyWith(_SearchHistoryEntryDto value, $Res Function(_SearchHistoryEntryDto) _then) = __$SearchHistoryEntryDtoCopyWithImpl;
@override @useResult
$Res call({
 String query,@JsonKey(name: 'searched_at') DateTime searchedAt
});




}
/// @nodoc
class __$SearchHistoryEntryDtoCopyWithImpl<$Res>
    implements _$SearchHistoryEntryDtoCopyWith<$Res> {
  __$SearchHistoryEntryDtoCopyWithImpl(this._self, this._then);

  final _SearchHistoryEntryDto _self;
  final $Res Function(_SearchHistoryEntryDto) _then;

/// Create a copy of SearchHistoryEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? searchedAt = null,}) {
  return _then(_SearchHistoryEntryDto(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,searchedAt: null == searchedAt ? _self.searchedAt : searchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
