// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardDto {

@JsonKey(name: 'market_status') List<MarketStatusDto> get marketStatus; List<IndexQuoteDto> get indices; List<MarketMoverDto> get gainers; List<MarketMoverDto> get losers;@JsonKey(name: 'most_active') List<MarketMoverDto> get mostActive;@JsonKey(name: 'fifty_two_week_high') List<MarketMoverDto> get fiftyTwoWeekHigh;@JsonKey(name: 'fifty_two_week_low') List<MarketMoverDto> get fiftyTwoWeekLow;@JsonKey(name: 'latest_news') List<NewsArticleDto> get latestNews; List<String> get notes;
/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardDtoCopyWith<DashboardDto> get copyWith => _$DashboardDtoCopyWithImpl<DashboardDto>(this as DashboardDto, _$identity);

  /// Serializes this DashboardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardDto&&const DeepCollectionEquality().equals(other.marketStatus, marketStatus)&&const DeepCollectionEquality().equals(other.indices, indices)&&const DeepCollectionEquality().equals(other.gainers, gainers)&&const DeepCollectionEquality().equals(other.losers, losers)&&const DeepCollectionEquality().equals(other.mostActive, mostActive)&&const DeepCollectionEquality().equals(other.fiftyTwoWeekHigh, fiftyTwoWeekHigh)&&const DeepCollectionEquality().equals(other.fiftyTwoWeekLow, fiftyTwoWeekLow)&&const DeepCollectionEquality().equals(other.latestNews, latestNews)&&const DeepCollectionEquality().equals(other.notes, notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(marketStatus),const DeepCollectionEquality().hash(indices),const DeepCollectionEquality().hash(gainers),const DeepCollectionEquality().hash(losers),const DeepCollectionEquality().hash(mostActive),const DeepCollectionEquality().hash(fiftyTwoWeekHigh),const DeepCollectionEquality().hash(fiftyTwoWeekLow),const DeepCollectionEquality().hash(latestNews),const DeepCollectionEquality().hash(notes));

@override
String toString() {
  return 'DashboardDto(marketStatus: $marketStatus, indices: $indices, gainers: $gainers, losers: $losers, mostActive: $mostActive, fiftyTwoWeekHigh: $fiftyTwoWeekHigh, fiftyTwoWeekLow: $fiftyTwoWeekLow, latestNews: $latestNews, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $DashboardDtoCopyWith<$Res>  {
  factory $DashboardDtoCopyWith(DashboardDto value, $Res Function(DashboardDto) _then) = _$DashboardDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'market_status') List<MarketStatusDto> marketStatus, List<IndexQuoteDto> indices, List<MarketMoverDto> gainers, List<MarketMoverDto> losers,@JsonKey(name: 'most_active') List<MarketMoverDto> mostActive,@JsonKey(name: 'fifty_two_week_high') List<MarketMoverDto> fiftyTwoWeekHigh,@JsonKey(name: 'fifty_two_week_low') List<MarketMoverDto> fiftyTwoWeekLow,@JsonKey(name: 'latest_news') List<NewsArticleDto> latestNews, List<String> notes
});




}
/// @nodoc
class _$DashboardDtoCopyWithImpl<$Res>
    implements $DashboardDtoCopyWith<$Res> {
  _$DashboardDtoCopyWithImpl(this._self, this._then);

  final DashboardDto _self;
  final $Res Function(DashboardDto) _then;

/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marketStatus = null,Object? indices = null,Object? gainers = null,Object? losers = null,Object? mostActive = null,Object? fiftyTwoWeekHigh = null,Object? fiftyTwoWeekLow = null,Object? latestNews = null,Object? notes = null,}) {
  return _then(_self.copyWith(
marketStatus: null == marketStatus ? _self.marketStatus : marketStatus // ignore: cast_nullable_to_non_nullable
as List<MarketStatusDto>,indices: null == indices ? _self.indices : indices // ignore: cast_nullable_to_non_nullable
as List<IndexQuoteDto>,gainers: null == gainers ? _self.gainers : gainers // ignore: cast_nullable_to_non_nullable
as List<MarketMoverDto>,losers: null == losers ? _self.losers : losers // ignore: cast_nullable_to_non_nullable
as List<MarketMoverDto>,mostActive: null == mostActive ? _self.mostActive : mostActive // ignore: cast_nullable_to_non_nullable
as List<MarketMoverDto>,fiftyTwoWeekHigh: null == fiftyTwoWeekHigh ? _self.fiftyTwoWeekHigh : fiftyTwoWeekHigh // ignore: cast_nullable_to_non_nullable
as List<MarketMoverDto>,fiftyTwoWeekLow: null == fiftyTwoWeekLow ? _self.fiftyTwoWeekLow : fiftyTwoWeekLow // ignore: cast_nullable_to_non_nullable
as List<MarketMoverDto>,latestNews: null == latestNews ? _self.latestNews : latestNews // ignore: cast_nullable_to_non_nullable
as List<NewsArticleDto>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardDto].
extension DashboardDtoPatterns on DashboardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardDto value)  $default,){
final _that = this;
switch (_that) {
case _DashboardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardDto value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'market_status')  List<MarketStatusDto> marketStatus,  List<IndexQuoteDto> indices,  List<MarketMoverDto> gainers,  List<MarketMoverDto> losers, @JsonKey(name: 'most_active')  List<MarketMoverDto> mostActive, @JsonKey(name: 'fifty_two_week_high')  List<MarketMoverDto> fiftyTwoWeekHigh, @JsonKey(name: 'fifty_two_week_low')  List<MarketMoverDto> fiftyTwoWeekLow, @JsonKey(name: 'latest_news')  List<NewsArticleDto> latestNews,  List<String> notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
return $default(_that.marketStatus,_that.indices,_that.gainers,_that.losers,_that.mostActive,_that.fiftyTwoWeekHigh,_that.fiftyTwoWeekLow,_that.latestNews,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'market_status')  List<MarketStatusDto> marketStatus,  List<IndexQuoteDto> indices,  List<MarketMoverDto> gainers,  List<MarketMoverDto> losers, @JsonKey(name: 'most_active')  List<MarketMoverDto> mostActive, @JsonKey(name: 'fifty_two_week_high')  List<MarketMoverDto> fiftyTwoWeekHigh, @JsonKey(name: 'fifty_two_week_low')  List<MarketMoverDto> fiftyTwoWeekLow, @JsonKey(name: 'latest_news')  List<NewsArticleDto> latestNews,  List<String> notes)  $default,) {final _that = this;
switch (_that) {
case _DashboardDto():
return $default(_that.marketStatus,_that.indices,_that.gainers,_that.losers,_that.mostActive,_that.fiftyTwoWeekHigh,_that.fiftyTwoWeekLow,_that.latestNews,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'market_status')  List<MarketStatusDto> marketStatus,  List<IndexQuoteDto> indices,  List<MarketMoverDto> gainers,  List<MarketMoverDto> losers, @JsonKey(name: 'most_active')  List<MarketMoverDto> mostActive, @JsonKey(name: 'fifty_two_week_high')  List<MarketMoverDto> fiftyTwoWeekHigh, @JsonKey(name: 'fifty_two_week_low')  List<MarketMoverDto> fiftyTwoWeekLow, @JsonKey(name: 'latest_news')  List<NewsArticleDto> latestNews,  List<String> notes)?  $default,) {final _that = this;
switch (_that) {
case _DashboardDto() when $default != null:
return $default(_that.marketStatus,_that.indices,_that.gainers,_that.losers,_that.mostActive,_that.fiftyTwoWeekHigh,_that.fiftyTwoWeekLow,_that.latestNews,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardDto implements DashboardDto {
  const _DashboardDto({@JsonKey(name: 'market_status') required final  List<MarketStatusDto> marketStatus, required final  List<IndexQuoteDto> indices, required final  List<MarketMoverDto> gainers, required final  List<MarketMoverDto> losers, @JsonKey(name: 'most_active') required final  List<MarketMoverDto> mostActive, @JsonKey(name: 'fifty_two_week_high') required final  List<MarketMoverDto> fiftyTwoWeekHigh, @JsonKey(name: 'fifty_two_week_low') required final  List<MarketMoverDto> fiftyTwoWeekLow, @JsonKey(name: 'latest_news') required final  List<NewsArticleDto> latestNews, required final  List<String> notes}): _marketStatus = marketStatus,_indices = indices,_gainers = gainers,_losers = losers,_mostActive = mostActive,_fiftyTwoWeekHigh = fiftyTwoWeekHigh,_fiftyTwoWeekLow = fiftyTwoWeekLow,_latestNews = latestNews,_notes = notes;
  factory _DashboardDto.fromJson(Map<String, dynamic> json) => _$DashboardDtoFromJson(json);

 final  List<MarketStatusDto> _marketStatus;
@override@JsonKey(name: 'market_status') List<MarketStatusDto> get marketStatus {
  if (_marketStatus is EqualUnmodifiableListView) return _marketStatus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_marketStatus);
}

 final  List<IndexQuoteDto> _indices;
@override List<IndexQuoteDto> get indices {
  if (_indices is EqualUnmodifiableListView) return _indices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_indices);
}

 final  List<MarketMoverDto> _gainers;
@override List<MarketMoverDto> get gainers {
  if (_gainers is EqualUnmodifiableListView) return _gainers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gainers);
}

 final  List<MarketMoverDto> _losers;
@override List<MarketMoverDto> get losers {
  if (_losers is EqualUnmodifiableListView) return _losers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_losers);
}

 final  List<MarketMoverDto> _mostActive;
@override@JsonKey(name: 'most_active') List<MarketMoverDto> get mostActive {
  if (_mostActive is EqualUnmodifiableListView) return _mostActive;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mostActive);
}

 final  List<MarketMoverDto> _fiftyTwoWeekHigh;
@override@JsonKey(name: 'fifty_two_week_high') List<MarketMoverDto> get fiftyTwoWeekHigh {
  if (_fiftyTwoWeekHigh is EqualUnmodifiableListView) return _fiftyTwoWeekHigh;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fiftyTwoWeekHigh);
}

 final  List<MarketMoverDto> _fiftyTwoWeekLow;
@override@JsonKey(name: 'fifty_two_week_low') List<MarketMoverDto> get fiftyTwoWeekLow {
  if (_fiftyTwoWeekLow is EqualUnmodifiableListView) return _fiftyTwoWeekLow;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fiftyTwoWeekLow);
}

 final  List<NewsArticleDto> _latestNews;
@override@JsonKey(name: 'latest_news') List<NewsArticleDto> get latestNews {
  if (_latestNews is EqualUnmodifiableListView) return _latestNews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_latestNews);
}

 final  List<String> _notes;
@override List<String> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}


/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardDtoCopyWith<_DashboardDto> get copyWith => __$DashboardDtoCopyWithImpl<_DashboardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardDto&&const DeepCollectionEquality().equals(other._marketStatus, _marketStatus)&&const DeepCollectionEquality().equals(other._indices, _indices)&&const DeepCollectionEquality().equals(other._gainers, _gainers)&&const DeepCollectionEquality().equals(other._losers, _losers)&&const DeepCollectionEquality().equals(other._mostActive, _mostActive)&&const DeepCollectionEquality().equals(other._fiftyTwoWeekHigh, _fiftyTwoWeekHigh)&&const DeepCollectionEquality().equals(other._fiftyTwoWeekLow, _fiftyTwoWeekLow)&&const DeepCollectionEquality().equals(other._latestNews, _latestNews)&&const DeepCollectionEquality().equals(other._notes, _notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_marketStatus),const DeepCollectionEquality().hash(_indices),const DeepCollectionEquality().hash(_gainers),const DeepCollectionEquality().hash(_losers),const DeepCollectionEquality().hash(_mostActive),const DeepCollectionEquality().hash(_fiftyTwoWeekHigh),const DeepCollectionEquality().hash(_fiftyTwoWeekLow),const DeepCollectionEquality().hash(_latestNews),const DeepCollectionEquality().hash(_notes));

@override
String toString() {
  return 'DashboardDto(marketStatus: $marketStatus, indices: $indices, gainers: $gainers, losers: $losers, mostActive: $mostActive, fiftyTwoWeekHigh: $fiftyTwoWeekHigh, fiftyTwoWeekLow: $fiftyTwoWeekLow, latestNews: $latestNews, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$DashboardDtoCopyWith<$Res> implements $DashboardDtoCopyWith<$Res> {
  factory _$DashboardDtoCopyWith(_DashboardDto value, $Res Function(_DashboardDto) _then) = __$DashboardDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'market_status') List<MarketStatusDto> marketStatus, List<IndexQuoteDto> indices, List<MarketMoverDto> gainers, List<MarketMoverDto> losers,@JsonKey(name: 'most_active') List<MarketMoverDto> mostActive,@JsonKey(name: 'fifty_two_week_high') List<MarketMoverDto> fiftyTwoWeekHigh,@JsonKey(name: 'fifty_two_week_low') List<MarketMoverDto> fiftyTwoWeekLow,@JsonKey(name: 'latest_news') List<NewsArticleDto> latestNews, List<String> notes
});




}
/// @nodoc
class __$DashboardDtoCopyWithImpl<$Res>
    implements _$DashboardDtoCopyWith<$Res> {
  __$DashboardDtoCopyWithImpl(this._self, this._then);

  final _DashboardDto _self;
  final $Res Function(_DashboardDto) _then;

/// Create a copy of DashboardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marketStatus = null,Object? indices = null,Object? gainers = null,Object? losers = null,Object? mostActive = null,Object? fiftyTwoWeekHigh = null,Object? fiftyTwoWeekLow = null,Object? latestNews = null,Object? notes = null,}) {
  return _then(_DashboardDto(
marketStatus: null == marketStatus ? _self._marketStatus : marketStatus // ignore: cast_nullable_to_non_nullable
as List<MarketStatusDto>,indices: null == indices ? _self._indices : indices // ignore: cast_nullable_to_non_nullable
as List<IndexQuoteDto>,gainers: null == gainers ? _self._gainers : gainers // ignore: cast_nullable_to_non_nullable
as List<MarketMoverDto>,losers: null == losers ? _self._losers : losers // ignore: cast_nullable_to_non_nullable
as List<MarketMoverDto>,mostActive: null == mostActive ? _self._mostActive : mostActive // ignore: cast_nullable_to_non_nullable
as List<MarketMoverDto>,fiftyTwoWeekHigh: null == fiftyTwoWeekHigh ? _self._fiftyTwoWeekHigh : fiftyTwoWeekHigh // ignore: cast_nullable_to_non_nullable
as List<MarketMoverDto>,fiftyTwoWeekLow: null == fiftyTwoWeekLow ? _self._fiftyTwoWeekLow : fiftyTwoWeekLow // ignore: cast_nullable_to_non_nullable
as List<MarketMoverDto>,latestNews: null == latestNews ? _self._latestNews : latestNews // ignore: cast_nullable_to_non_nullable
as List<NewsArticleDto>,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
