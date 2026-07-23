// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_article_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsArticleDto {

 String get headline; String? get summary; String get source; String get url; NewsCategoryDto get category;@JsonKey(name: 'related_symbols') List<String> get relatedSymbols;@JsonKey(name: 'published_at') DateTime get publishedAt;
/// Create a copy of NewsArticleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsArticleDtoCopyWith<NewsArticleDto> get copyWith => _$NewsArticleDtoCopyWithImpl<NewsArticleDto>(this as NewsArticleDto, _$identity);

  /// Serializes this NewsArticleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsArticleDto&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.source, source) || other.source == source)&&(identical(other.url, url) || other.url == url)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.relatedSymbols, relatedSymbols)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,headline,summary,source,url,category,const DeepCollectionEquality().hash(relatedSymbols),publishedAt);

@override
String toString() {
  return 'NewsArticleDto(headline: $headline, summary: $summary, source: $source, url: $url, category: $category, relatedSymbols: $relatedSymbols, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class $NewsArticleDtoCopyWith<$Res>  {
  factory $NewsArticleDtoCopyWith(NewsArticleDto value, $Res Function(NewsArticleDto) _then) = _$NewsArticleDtoCopyWithImpl;
@useResult
$Res call({
 String headline, String? summary, String source, String url, NewsCategoryDto category,@JsonKey(name: 'related_symbols') List<String> relatedSymbols,@JsonKey(name: 'published_at') DateTime publishedAt
});




}
/// @nodoc
class _$NewsArticleDtoCopyWithImpl<$Res>
    implements $NewsArticleDtoCopyWith<$Res> {
  _$NewsArticleDtoCopyWithImpl(this._self, this._then);

  final NewsArticleDto _self;
  final $Res Function(NewsArticleDto) _then;

/// Create a copy of NewsArticleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? headline = null,Object? summary = freezed,Object? source = null,Object? url = null,Object? category = null,Object? relatedSymbols = null,Object? publishedAt = null,}) {
  return _then(_self.copyWith(
headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as NewsCategoryDto,relatedSymbols: null == relatedSymbols ? _self.relatedSymbols : relatedSymbols // ignore: cast_nullable_to_non_nullable
as List<String>,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsArticleDto].
extension NewsArticleDtoPatterns on NewsArticleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsArticleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsArticleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsArticleDto value)  $default,){
final _that = this;
switch (_that) {
case _NewsArticleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsArticleDto value)?  $default,){
final _that = this;
switch (_that) {
case _NewsArticleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String headline,  String? summary,  String source,  String url,  NewsCategoryDto category, @JsonKey(name: 'related_symbols')  List<String> relatedSymbols, @JsonKey(name: 'published_at')  DateTime publishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsArticleDto() when $default != null:
return $default(_that.headline,_that.summary,_that.source,_that.url,_that.category,_that.relatedSymbols,_that.publishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String headline,  String? summary,  String source,  String url,  NewsCategoryDto category, @JsonKey(name: 'related_symbols')  List<String> relatedSymbols, @JsonKey(name: 'published_at')  DateTime publishedAt)  $default,) {final _that = this;
switch (_that) {
case _NewsArticleDto():
return $default(_that.headline,_that.summary,_that.source,_that.url,_that.category,_that.relatedSymbols,_that.publishedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String headline,  String? summary,  String source,  String url,  NewsCategoryDto category, @JsonKey(name: 'related_symbols')  List<String> relatedSymbols, @JsonKey(name: 'published_at')  DateTime publishedAt)?  $default,) {final _that = this;
switch (_that) {
case _NewsArticleDto() when $default != null:
return $default(_that.headline,_that.summary,_that.source,_that.url,_that.category,_that.relatedSymbols,_that.publishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsArticleDto implements NewsArticleDto {
  const _NewsArticleDto({required this.headline, this.summary, required this.source, required this.url, required this.category, @JsonKey(name: 'related_symbols') required final  List<String> relatedSymbols, @JsonKey(name: 'published_at') required this.publishedAt}): _relatedSymbols = relatedSymbols;
  factory _NewsArticleDto.fromJson(Map<String, dynamic> json) => _$NewsArticleDtoFromJson(json);

@override final  String headline;
@override final  String? summary;
@override final  String source;
@override final  String url;
@override final  NewsCategoryDto category;
 final  List<String> _relatedSymbols;
@override@JsonKey(name: 'related_symbols') List<String> get relatedSymbols {
  if (_relatedSymbols is EqualUnmodifiableListView) return _relatedSymbols;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relatedSymbols);
}

@override@JsonKey(name: 'published_at') final  DateTime publishedAt;

/// Create a copy of NewsArticleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsArticleDtoCopyWith<_NewsArticleDto> get copyWith => __$NewsArticleDtoCopyWithImpl<_NewsArticleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsArticleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsArticleDto&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.source, source) || other.source == source)&&(identical(other.url, url) || other.url == url)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._relatedSymbols, _relatedSymbols)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,headline,summary,source,url,category,const DeepCollectionEquality().hash(_relatedSymbols),publishedAt);

@override
String toString() {
  return 'NewsArticleDto(headline: $headline, summary: $summary, source: $source, url: $url, category: $category, relatedSymbols: $relatedSymbols, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class _$NewsArticleDtoCopyWith<$Res> implements $NewsArticleDtoCopyWith<$Res> {
  factory _$NewsArticleDtoCopyWith(_NewsArticleDto value, $Res Function(_NewsArticleDto) _then) = __$NewsArticleDtoCopyWithImpl;
@override @useResult
$Res call({
 String headline, String? summary, String source, String url, NewsCategoryDto category,@JsonKey(name: 'related_symbols') List<String> relatedSymbols,@JsonKey(name: 'published_at') DateTime publishedAt
});




}
/// @nodoc
class __$NewsArticleDtoCopyWithImpl<$Res>
    implements _$NewsArticleDtoCopyWith<$Res> {
  __$NewsArticleDtoCopyWithImpl(this._self, this._then);

  final _NewsArticleDto _self;
  final $Res Function(_NewsArticleDto) _then;

/// Create a copy of NewsArticleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? headline = null,Object? summary = freezed,Object? source = null,Object? url = null,Object? category = null,Object? relatedSymbols = null,Object? publishedAt = null,}) {
  return _then(_NewsArticleDto(
headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as NewsCategoryDto,relatedSymbols: null == relatedSymbols ? _self._relatedSymbols : relatedSymbols // ignore: cast_nullable_to_non_nullable
as List<String>,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
