// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indicators_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IndicatorsDto {

 String get symbol;@JsonKey(name: 'as_of') DateTime? get asOf;@JsonKey(name: 'has_data') bool get hasData;@NullableDecimalConverter()@JsonKey(name: 'sma_20') Decimal? get sma20;@NullableDecimalConverter()@JsonKey(name: 'sma_50') Decimal? get sma50;@NullableDecimalConverter()@JsonKey(name: 'sma_200') Decimal? get sma200;@NullableDecimalConverter()@JsonKey(name: 'ema_20') Decimal? get ema20;@NullableDecimalConverter()@JsonKey(name: 'ema_50') Decimal? get ema50;@NullableDecimalConverter()@JsonKey(name: 'rsi_14') Decimal? get rsi14; MacdDto? get macd; BollingerDto? get bollinger;@NullableDecimalConverter()@JsonKey(name: 'vwap_20') Decimal? get vwap20;@NullableDecimalConverter()@JsonKey(name: 'adx_14') Decimal? get adx14;@NullableDecimalConverter()@JsonKey(name: 'atr_14') Decimal? get atr14; SupertrendDto? get supertrend;@JsonKey(name: 'stochastic_rsi') StochRsiDto? get stochasticRsi;@JsonKey(name: 'pivot_points') PivotPointsDto? get pivotPoints;@JsonKey(name: 'volume_profile') List<VolumeProfileBinDto> get volumeProfile;@JsonKey(name: 'point_of_control') VolumeProfileBinDto? get pointOfControl;
/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndicatorsDtoCopyWith<IndicatorsDto> get copyWith => _$IndicatorsDtoCopyWithImpl<IndicatorsDto>(this as IndicatorsDto, _$identity);

  /// Serializes this IndicatorsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IndicatorsDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.hasData, hasData) || other.hasData == hasData)&&(identical(other.sma20, sma20) || other.sma20 == sma20)&&(identical(other.sma50, sma50) || other.sma50 == sma50)&&(identical(other.sma200, sma200) || other.sma200 == sma200)&&(identical(other.ema20, ema20) || other.ema20 == ema20)&&(identical(other.ema50, ema50) || other.ema50 == ema50)&&(identical(other.rsi14, rsi14) || other.rsi14 == rsi14)&&(identical(other.macd, macd) || other.macd == macd)&&(identical(other.bollinger, bollinger) || other.bollinger == bollinger)&&(identical(other.vwap20, vwap20) || other.vwap20 == vwap20)&&(identical(other.adx14, adx14) || other.adx14 == adx14)&&(identical(other.atr14, atr14) || other.atr14 == atr14)&&(identical(other.supertrend, supertrend) || other.supertrend == supertrend)&&(identical(other.stochasticRsi, stochasticRsi) || other.stochasticRsi == stochasticRsi)&&(identical(other.pivotPoints, pivotPoints) || other.pivotPoints == pivotPoints)&&const DeepCollectionEquality().equals(other.volumeProfile, volumeProfile)&&(identical(other.pointOfControl, pointOfControl) || other.pointOfControl == pointOfControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,symbol,asOf,hasData,sma20,sma50,sma200,ema20,ema50,rsi14,macd,bollinger,vwap20,adx14,atr14,supertrend,stochasticRsi,pivotPoints,const DeepCollectionEquality().hash(volumeProfile),pointOfControl]);

@override
String toString() {
  return 'IndicatorsDto(symbol: $symbol, asOf: $asOf, hasData: $hasData, sma20: $sma20, sma50: $sma50, sma200: $sma200, ema20: $ema20, ema50: $ema50, rsi14: $rsi14, macd: $macd, bollinger: $bollinger, vwap20: $vwap20, adx14: $adx14, atr14: $atr14, supertrend: $supertrend, stochasticRsi: $stochasticRsi, pivotPoints: $pivotPoints, volumeProfile: $volumeProfile, pointOfControl: $pointOfControl)';
}


}

/// @nodoc
abstract mixin class $IndicatorsDtoCopyWith<$Res>  {
  factory $IndicatorsDtoCopyWith(IndicatorsDto value, $Res Function(IndicatorsDto) _then) = _$IndicatorsDtoCopyWithImpl;
@useResult
$Res call({
 String symbol,@JsonKey(name: 'as_of') DateTime? asOf,@JsonKey(name: 'has_data') bool hasData,@NullableDecimalConverter()@JsonKey(name: 'sma_20') Decimal? sma20,@NullableDecimalConverter()@JsonKey(name: 'sma_50') Decimal? sma50,@NullableDecimalConverter()@JsonKey(name: 'sma_200') Decimal? sma200,@NullableDecimalConverter()@JsonKey(name: 'ema_20') Decimal? ema20,@NullableDecimalConverter()@JsonKey(name: 'ema_50') Decimal? ema50,@NullableDecimalConverter()@JsonKey(name: 'rsi_14') Decimal? rsi14, MacdDto? macd, BollingerDto? bollinger,@NullableDecimalConverter()@JsonKey(name: 'vwap_20') Decimal? vwap20,@NullableDecimalConverter()@JsonKey(name: 'adx_14') Decimal? adx14,@NullableDecimalConverter()@JsonKey(name: 'atr_14') Decimal? atr14, SupertrendDto? supertrend,@JsonKey(name: 'stochastic_rsi') StochRsiDto? stochasticRsi,@JsonKey(name: 'pivot_points') PivotPointsDto? pivotPoints,@JsonKey(name: 'volume_profile') List<VolumeProfileBinDto> volumeProfile,@JsonKey(name: 'point_of_control') VolumeProfileBinDto? pointOfControl
});


$MacdDtoCopyWith<$Res>? get macd;$BollingerDtoCopyWith<$Res>? get bollinger;$SupertrendDtoCopyWith<$Res>? get supertrend;$StochRsiDtoCopyWith<$Res>? get stochasticRsi;$PivotPointsDtoCopyWith<$Res>? get pivotPoints;$VolumeProfileBinDtoCopyWith<$Res>? get pointOfControl;

}
/// @nodoc
class _$IndicatorsDtoCopyWithImpl<$Res>
    implements $IndicatorsDtoCopyWith<$Res> {
  _$IndicatorsDtoCopyWithImpl(this._self, this._then);

  final IndicatorsDto _self;
  final $Res Function(IndicatorsDto) _then;

/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? asOf = freezed,Object? hasData = null,Object? sma20 = freezed,Object? sma50 = freezed,Object? sma200 = freezed,Object? ema20 = freezed,Object? ema50 = freezed,Object? rsi14 = freezed,Object? macd = freezed,Object? bollinger = freezed,Object? vwap20 = freezed,Object? adx14 = freezed,Object? atr14 = freezed,Object? supertrend = freezed,Object? stochasticRsi = freezed,Object? pivotPoints = freezed,Object? volumeProfile = null,Object? pointOfControl = freezed,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,asOf: freezed == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime?,hasData: null == hasData ? _self.hasData : hasData // ignore: cast_nullable_to_non_nullable
as bool,sma20: freezed == sma20 ? _self.sma20 : sma20 // ignore: cast_nullable_to_non_nullable
as Decimal?,sma50: freezed == sma50 ? _self.sma50 : sma50 // ignore: cast_nullable_to_non_nullable
as Decimal?,sma200: freezed == sma200 ? _self.sma200 : sma200 // ignore: cast_nullable_to_non_nullable
as Decimal?,ema20: freezed == ema20 ? _self.ema20 : ema20 // ignore: cast_nullable_to_non_nullable
as Decimal?,ema50: freezed == ema50 ? _self.ema50 : ema50 // ignore: cast_nullable_to_non_nullable
as Decimal?,rsi14: freezed == rsi14 ? _self.rsi14 : rsi14 // ignore: cast_nullable_to_non_nullable
as Decimal?,macd: freezed == macd ? _self.macd : macd // ignore: cast_nullable_to_non_nullable
as MacdDto?,bollinger: freezed == bollinger ? _self.bollinger : bollinger // ignore: cast_nullable_to_non_nullable
as BollingerDto?,vwap20: freezed == vwap20 ? _self.vwap20 : vwap20 // ignore: cast_nullable_to_non_nullable
as Decimal?,adx14: freezed == adx14 ? _self.adx14 : adx14 // ignore: cast_nullable_to_non_nullable
as Decimal?,atr14: freezed == atr14 ? _self.atr14 : atr14 // ignore: cast_nullable_to_non_nullable
as Decimal?,supertrend: freezed == supertrend ? _self.supertrend : supertrend // ignore: cast_nullable_to_non_nullable
as SupertrendDto?,stochasticRsi: freezed == stochasticRsi ? _self.stochasticRsi : stochasticRsi // ignore: cast_nullable_to_non_nullable
as StochRsiDto?,pivotPoints: freezed == pivotPoints ? _self.pivotPoints : pivotPoints // ignore: cast_nullable_to_non_nullable
as PivotPointsDto?,volumeProfile: null == volumeProfile ? _self.volumeProfile : volumeProfile // ignore: cast_nullable_to_non_nullable
as List<VolumeProfileBinDto>,pointOfControl: freezed == pointOfControl ? _self.pointOfControl : pointOfControl // ignore: cast_nullable_to_non_nullable
as VolumeProfileBinDto?,
  ));
}
/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MacdDtoCopyWith<$Res>? get macd {
    if (_self.macd == null) {
    return null;
  }

  return $MacdDtoCopyWith<$Res>(_self.macd!, (value) {
    return _then(_self.copyWith(macd: value));
  });
}/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BollingerDtoCopyWith<$Res>? get bollinger {
    if (_self.bollinger == null) {
    return null;
  }

  return $BollingerDtoCopyWith<$Res>(_self.bollinger!, (value) {
    return _then(_self.copyWith(bollinger: value));
  });
}/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupertrendDtoCopyWith<$Res>? get supertrend {
    if (_self.supertrend == null) {
    return null;
  }

  return $SupertrendDtoCopyWith<$Res>(_self.supertrend!, (value) {
    return _then(_self.copyWith(supertrend: value));
  });
}/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StochRsiDtoCopyWith<$Res>? get stochasticRsi {
    if (_self.stochasticRsi == null) {
    return null;
  }

  return $StochRsiDtoCopyWith<$Res>(_self.stochasticRsi!, (value) {
    return _then(_self.copyWith(stochasticRsi: value));
  });
}/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PivotPointsDtoCopyWith<$Res>? get pivotPoints {
    if (_self.pivotPoints == null) {
    return null;
  }

  return $PivotPointsDtoCopyWith<$Res>(_self.pivotPoints!, (value) {
    return _then(_self.copyWith(pivotPoints: value));
  });
}/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VolumeProfileBinDtoCopyWith<$Res>? get pointOfControl {
    if (_self.pointOfControl == null) {
    return null;
  }

  return $VolumeProfileBinDtoCopyWith<$Res>(_self.pointOfControl!, (value) {
    return _then(_self.copyWith(pointOfControl: value));
  });
}
}


/// Adds pattern-matching-related methods to [IndicatorsDto].
extension IndicatorsDtoPatterns on IndicatorsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IndicatorsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IndicatorsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IndicatorsDto value)  $default,){
final _that = this;
switch (_that) {
case _IndicatorsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IndicatorsDto value)?  $default,){
final _that = this;
switch (_that) {
case _IndicatorsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol, @JsonKey(name: 'as_of')  DateTime? asOf, @JsonKey(name: 'has_data')  bool hasData, @NullableDecimalConverter()@JsonKey(name: 'sma_20')  Decimal? sma20, @NullableDecimalConverter()@JsonKey(name: 'sma_50')  Decimal? sma50, @NullableDecimalConverter()@JsonKey(name: 'sma_200')  Decimal? sma200, @NullableDecimalConverter()@JsonKey(name: 'ema_20')  Decimal? ema20, @NullableDecimalConverter()@JsonKey(name: 'ema_50')  Decimal? ema50, @NullableDecimalConverter()@JsonKey(name: 'rsi_14')  Decimal? rsi14,  MacdDto? macd,  BollingerDto? bollinger, @NullableDecimalConverter()@JsonKey(name: 'vwap_20')  Decimal? vwap20, @NullableDecimalConverter()@JsonKey(name: 'adx_14')  Decimal? adx14, @NullableDecimalConverter()@JsonKey(name: 'atr_14')  Decimal? atr14,  SupertrendDto? supertrend, @JsonKey(name: 'stochastic_rsi')  StochRsiDto? stochasticRsi, @JsonKey(name: 'pivot_points')  PivotPointsDto? pivotPoints, @JsonKey(name: 'volume_profile')  List<VolumeProfileBinDto> volumeProfile, @JsonKey(name: 'point_of_control')  VolumeProfileBinDto? pointOfControl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndicatorsDto() when $default != null:
return $default(_that.symbol,_that.asOf,_that.hasData,_that.sma20,_that.sma50,_that.sma200,_that.ema20,_that.ema50,_that.rsi14,_that.macd,_that.bollinger,_that.vwap20,_that.adx14,_that.atr14,_that.supertrend,_that.stochasticRsi,_that.pivotPoints,_that.volumeProfile,_that.pointOfControl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol, @JsonKey(name: 'as_of')  DateTime? asOf, @JsonKey(name: 'has_data')  bool hasData, @NullableDecimalConverter()@JsonKey(name: 'sma_20')  Decimal? sma20, @NullableDecimalConverter()@JsonKey(name: 'sma_50')  Decimal? sma50, @NullableDecimalConverter()@JsonKey(name: 'sma_200')  Decimal? sma200, @NullableDecimalConverter()@JsonKey(name: 'ema_20')  Decimal? ema20, @NullableDecimalConverter()@JsonKey(name: 'ema_50')  Decimal? ema50, @NullableDecimalConverter()@JsonKey(name: 'rsi_14')  Decimal? rsi14,  MacdDto? macd,  BollingerDto? bollinger, @NullableDecimalConverter()@JsonKey(name: 'vwap_20')  Decimal? vwap20, @NullableDecimalConverter()@JsonKey(name: 'adx_14')  Decimal? adx14, @NullableDecimalConverter()@JsonKey(name: 'atr_14')  Decimal? atr14,  SupertrendDto? supertrend, @JsonKey(name: 'stochastic_rsi')  StochRsiDto? stochasticRsi, @JsonKey(name: 'pivot_points')  PivotPointsDto? pivotPoints, @JsonKey(name: 'volume_profile')  List<VolumeProfileBinDto> volumeProfile, @JsonKey(name: 'point_of_control')  VolumeProfileBinDto? pointOfControl)  $default,) {final _that = this;
switch (_that) {
case _IndicatorsDto():
return $default(_that.symbol,_that.asOf,_that.hasData,_that.sma20,_that.sma50,_that.sma200,_that.ema20,_that.ema50,_that.rsi14,_that.macd,_that.bollinger,_that.vwap20,_that.adx14,_that.atr14,_that.supertrend,_that.stochasticRsi,_that.pivotPoints,_that.volumeProfile,_that.pointOfControl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol, @JsonKey(name: 'as_of')  DateTime? asOf, @JsonKey(name: 'has_data')  bool hasData, @NullableDecimalConverter()@JsonKey(name: 'sma_20')  Decimal? sma20, @NullableDecimalConverter()@JsonKey(name: 'sma_50')  Decimal? sma50, @NullableDecimalConverter()@JsonKey(name: 'sma_200')  Decimal? sma200, @NullableDecimalConverter()@JsonKey(name: 'ema_20')  Decimal? ema20, @NullableDecimalConverter()@JsonKey(name: 'ema_50')  Decimal? ema50, @NullableDecimalConverter()@JsonKey(name: 'rsi_14')  Decimal? rsi14,  MacdDto? macd,  BollingerDto? bollinger, @NullableDecimalConverter()@JsonKey(name: 'vwap_20')  Decimal? vwap20, @NullableDecimalConverter()@JsonKey(name: 'adx_14')  Decimal? adx14, @NullableDecimalConverter()@JsonKey(name: 'atr_14')  Decimal? atr14,  SupertrendDto? supertrend, @JsonKey(name: 'stochastic_rsi')  StochRsiDto? stochasticRsi, @JsonKey(name: 'pivot_points')  PivotPointsDto? pivotPoints, @JsonKey(name: 'volume_profile')  List<VolumeProfileBinDto> volumeProfile, @JsonKey(name: 'point_of_control')  VolumeProfileBinDto? pointOfControl)?  $default,) {final _that = this;
switch (_that) {
case _IndicatorsDto() when $default != null:
return $default(_that.symbol,_that.asOf,_that.hasData,_that.sma20,_that.sma50,_that.sma200,_that.ema20,_that.ema50,_that.rsi14,_that.macd,_that.bollinger,_that.vwap20,_that.adx14,_that.atr14,_that.supertrend,_that.stochasticRsi,_that.pivotPoints,_that.volumeProfile,_that.pointOfControl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndicatorsDto implements IndicatorsDto {
  const _IndicatorsDto({required this.symbol, @JsonKey(name: 'as_of') this.asOf, @JsonKey(name: 'has_data') this.hasData = false, @NullableDecimalConverter()@JsonKey(name: 'sma_20') this.sma20, @NullableDecimalConverter()@JsonKey(name: 'sma_50') this.sma50, @NullableDecimalConverter()@JsonKey(name: 'sma_200') this.sma200, @NullableDecimalConverter()@JsonKey(name: 'ema_20') this.ema20, @NullableDecimalConverter()@JsonKey(name: 'ema_50') this.ema50, @NullableDecimalConverter()@JsonKey(name: 'rsi_14') this.rsi14, this.macd, this.bollinger, @NullableDecimalConverter()@JsonKey(name: 'vwap_20') this.vwap20, @NullableDecimalConverter()@JsonKey(name: 'adx_14') this.adx14, @NullableDecimalConverter()@JsonKey(name: 'atr_14') this.atr14, this.supertrend, @JsonKey(name: 'stochastic_rsi') this.stochasticRsi, @JsonKey(name: 'pivot_points') this.pivotPoints, @JsonKey(name: 'volume_profile') final  List<VolumeProfileBinDto> volumeProfile = const [], @JsonKey(name: 'point_of_control') this.pointOfControl}): _volumeProfile = volumeProfile;
  factory _IndicatorsDto.fromJson(Map<String, dynamic> json) => _$IndicatorsDtoFromJson(json);

@override final  String symbol;
@override@JsonKey(name: 'as_of') final  DateTime? asOf;
@override@JsonKey(name: 'has_data') final  bool hasData;
@override@NullableDecimalConverter()@JsonKey(name: 'sma_20') final  Decimal? sma20;
@override@NullableDecimalConverter()@JsonKey(name: 'sma_50') final  Decimal? sma50;
@override@NullableDecimalConverter()@JsonKey(name: 'sma_200') final  Decimal? sma200;
@override@NullableDecimalConverter()@JsonKey(name: 'ema_20') final  Decimal? ema20;
@override@NullableDecimalConverter()@JsonKey(name: 'ema_50') final  Decimal? ema50;
@override@NullableDecimalConverter()@JsonKey(name: 'rsi_14') final  Decimal? rsi14;
@override final  MacdDto? macd;
@override final  BollingerDto? bollinger;
@override@NullableDecimalConverter()@JsonKey(name: 'vwap_20') final  Decimal? vwap20;
@override@NullableDecimalConverter()@JsonKey(name: 'adx_14') final  Decimal? adx14;
@override@NullableDecimalConverter()@JsonKey(name: 'atr_14') final  Decimal? atr14;
@override final  SupertrendDto? supertrend;
@override@JsonKey(name: 'stochastic_rsi') final  StochRsiDto? stochasticRsi;
@override@JsonKey(name: 'pivot_points') final  PivotPointsDto? pivotPoints;
 final  List<VolumeProfileBinDto> _volumeProfile;
@override@JsonKey(name: 'volume_profile') List<VolumeProfileBinDto> get volumeProfile {
  if (_volumeProfile is EqualUnmodifiableListView) return _volumeProfile;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_volumeProfile);
}

@override@JsonKey(name: 'point_of_control') final  VolumeProfileBinDto? pointOfControl;

/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndicatorsDtoCopyWith<_IndicatorsDto> get copyWith => __$IndicatorsDtoCopyWithImpl<_IndicatorsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndicatorsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndicatorsDto&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.hasData, hasData) || other.hasData == hasData)&&(identical(other.sma20, sma20) || other.sma20 == sma20)&&(identical(other.sma50, sma50) || other.sma50 == sma50)&&(identical(other.sma200, sma200) || other.sma200 == sma200)&&(identical(other.ema20, ema20) || other.ema20 == ema20)&&(identical(other.ema50, ema50) || other.ema50 == ema50)&&(identical(other.rsi14, rsi14) || other.rsi14 == rsi14)&&(identical(other.macd, macd) || other.macd == macd)&&(identical(other.bollinger, bollinger) || other.bollinger == bollinger)&&(identical(other.vwap20, vwap20) || other.vwap20 == vwap20)&&(identical(other.adx14, adx14) || other.adx14 == adx14)&&(identical(other.atr14, atr14) || other.atr14 == atr14)&&(identical(other.supertrend, supertrend) || other.supertrend == supertrend)&&(identical(other.stochasticRsi, stochasticRsi) || other.stochasticRsi == stochasticRsi)&&(identical(other.pivotPoints, pivotPoints) || other.pivotPoints == pivotPoints)&&const DeepCollectionEquality().equals(other._volumeProfile, _volumeProfile)&&(identical(other.pointOfControl, pointOfControl) || other.pointOfControl == pointOfControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,symbol,asOf,hasData,sma20,sma50,sma200,ema20,ema50,rsi14,macd,bollinger,vwap20,adx14,atr14,supertrend,stochasticRsi,pivotPoints,const DeepCollectionEquality().hash(_volumeProfile),pointOfControl]);

@override
String toString() {
  return 'IndicatorsDto(symbol: $symbol, asOf: $asOf, hasData: $hasData, sma20: $sma20, sma50: $sma50, sma200: $sma200, ema20: $ema20, ema50: $ema50, rsi14: $rsi14, macd: $macd, bollinger: $bollinger, vwap20: $vwap20, adx14: $adx14, atr14: $atr14, supertrend: $supertrend, stochasticRsi: $stochasticRsi, pivotPoints: $pivotPoints, volumeProfile: $volumeProfile, pointOfControl: $pointOfControl)';
}


}

/// @nodoc
abstract mixin class _$IndicatorsDtoCopyWith<$Res> implements $IndicatorsDtoCopyWith<$Res> {
  factory _$IndicatorsDtoCopyWith(_IndicatorsDto value, $Res Function(_IndicatorsDto) _then) = __$IndicatorsDtoCopyWithImpl;
@override @useResult
$Res call({
 String symbol,@JsonKey(name: 'as_of') DateTime? asOf,@JsonKey(name: 'has_data') bool hasData,@NullableDecimalConverter()@JsonKey(name: 'sma_20') Decimal? sma20,@NullableDecimalConverter()@JsonKey(name: 'sma_50') Decimal? sma50,@NullableDecimalConverter()@JsonKey(name: 'sma_200') Decimal? sma200,@NullableDecimalConverter()@JsonKey(name: 'ema_20') Decimal? ema20,@NullableDecimalConverter()@JsonKey(name: 'ema_50') Decimal? ema50,@NullableDecimalConverter()@JsonKey(name: 'rsi_14') Decimal? rsi14, MacdDto? macd, BollingerDto? bollinger,@NullableDecimalConverter()@JsonKey(name: 'vwap_20') Decimal? vwap20,@NullableDecimalConverter()@JsonKey(name: 'adx_14') Decimal? adx14,@NullableDecimalConverter()@JsonKey(name: 'atr_14') Decimal? atr14, SupertrendDto? supertrend,@JsonKey(name: 'stochastic_rsi') StochRsiDto? stochasticRsi,@JsonKey(name: 'pivot_points') PivotPointsDto? pivotPoints,@JsonKey(name: 'volume_profile') List<VolumeProfileBinDto> volumeProfile,@JsonKey(name: 'point_of_control') VolumeProfileBinDto? pointOfControl
});


@override $MacdDtoCopyWith<$Res>? get macd;@override $BollingerDtoCopyWith<$Res>? get bollinger;@override $SupertrendDtoCopyWith<$Res>? get supertrend;@override $StochRsiDtoCopyWith<$Res>? get stochasticRsi;@override $PivotPointsDtoCopyWith<$Res>? get pivotPoints;@override $VolumeProfileBinDtoCopyWith<$Res>? get pointOfControl;

}
/// @nodoc
class __$IndicatorsDtoCopyWithImpl<$Res>
    implements _$IndicatorsDtoCopyWith<$Res> {
  __$IndicatorsDtoCopyWithImpl(this._self, this._then);

  final _IndicatorsDto _self;
  final $Res Function(_IndicatorsDto) _then;

/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? asOf = freezed,Object? hasData = null,Object? sma20 = freezed,Object? sma50 = freezed,Object? sma200 = freezed,Object? ema20 = freezed,Object? ema50 = freezed,Object? rsi14 = freezed,Object? macd = freezed,Object? bollinger = freezed,Object? vwap20 = freezed,Object? adx14 = freezed,Object? atr14 = freezed,Object? supertrend = freezed,Object? stochasticRsi = freezed,Object? pivotPoints = freezed,Object? volumeProfile = null,Object? pointOfControl = freezed,}) {
  return _then(_IndicatorsDto(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,asOf: freezed == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime?,hasData: null == hasData ? _self.hasData : hasData // ignore: cast_nullable_to_non_nullable
as bool,sma20: freezed == sma20 ? _self.sma20 : sma20 // ignore: cast_nullable_to_non_nullable
as Decimal?,sma50: freezed == sma50 ? _self.sma50 : sma50 // ignore: cast_nullable_to_non_nullable
as Decimal?,sma200: freezed == sma200 ? _self.sma200 : sma200 // ignore: cast_nullable_to_non_nullable
as Decimal?,ema20: freezed == ema20 ? _self.ema20 : ema20 // ignore: cast_nullable_to_non_nullable
as Decimal?,ema50: freezed == ema50 ? _self.ema50 : ema50 // ignore: cast_nullable_to_non_nullable
as Decimal?,rsi14: freezed == rsi14 ? _self.rsi14 : rsi14 // ignore: cast_nullable_to_non_nullable
as Decimal?,macd: freezed == macd ? _self.macd : macd // ignore: cast_nullable_to_non_nullable
as MacdDto?,bollinger: freezed == bollinger ? _self.bollinger : bollinger // ignore: cast_nullable_to_non_nullable
as BollingerDto?,vwap20: freezed == vwap20 ? _self.vwap20 : vwap20 // ignore: cast_nullable_to_non_nullable
as Decimal?,adx14: freezed == adx14 ? _self.adx14 : adx14 // ignore: cast_nullable_to_non_nullable
as Decimal?,atr14: freezed == atr14 ? _self.atr14 : atr14 // ignore: cast_nullable_to_non_nullable
as Decimal?,supertrend: freezed == supertrend ? _self.supertrend : supertrend // ignore: cast_nullable_to_non_nullable
as SupertrendDto?,stochasticRsi: freezed == stochasticRsi ? _self.stochasticRsi : stochasticRsi // ignore: cast_nullable_to_non_nullable
as StochRsiDto?,pivotPoints: freezed == pivotPoints ? _self.pivotPoints : pivotPoints // ignore: cast_nullable_to_non_nullable
as PivotPointsDto?,volumeProfile: null == volumeProfile ? _self._volumeProfile : volumeProfile // ignore: cast_nullable_to_non_nullable
as List<VolumeProfileBinDto>,pointOfControl: freezed == pointOfControl ? _self.pointOfControl : pointOfControl // ignore: cast_nullable_to_non_nullable
as VolumeProfileBinDto?,
  ));
}

/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MacdDtoCopyWith<$Res>? get macd {
    if (_self.macd == null) {
    return null;
  }

  return $MacdDtoCopyWith<$Res>(_self.macd!, (value) {
    return _then(_self.copyWith(macd: value));
  });
}/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BollingerDtoCopyWith<$Res>? get bollinger {
    if (_self.bollinger == null) {
    return null;
  }

  return $BollingerDtoCopyWith<$Res>(_self.bollinger!, (value) {
    return _then(_self.copyWith(bollinger: value));
  });
}/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupertrendDtoCopyWith<$Res>? get supertrend {
    if (_self.supertrend == null) {
    return null;
  }

  return $SupertrendDtoCopyWith<$Res>(_self.supertrend!, (value) {
    return _then(_self.copyWith(supertrend: value));
  });
}/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StochRsiDtoCopyWith<$Res>? get stochasticRsi {
    if (_self.stochasticRsi == null) {
    return null;
  }

  return $StochRsiDtoCopyWith<$Res>(_self.stochasticRsi!, (value) {
    return _then(_self.copyWith(stochasticRsi: value));
  });
}/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PivotPointsDtoCopyWith<$Res>? get pivotPoints {
    if (_self.pivotPoints == null) {
    return null;
  }

  return $PivotPointsDtoCopyWith<$Res>(_self.pivotPoints!, (value) {
    return _then(_self.copyWith(pivotPoints: value));
  });
}/// Create a copy of IndicatorsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VolumeProfileBinDtoCopyWith<$Res>? get pointOfControl {
    if (_self.pointOfControl == null) {
    return null;
  }

  return $VolumeProfileBinDtoCopyWith<$Res>(_self.pointOfControl!, (value) {
    return _then(_self.copyWith(pointOfControl: value));
  });
}
}

// dart format on
