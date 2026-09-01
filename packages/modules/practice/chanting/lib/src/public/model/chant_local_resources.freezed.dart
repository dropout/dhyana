// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chant_local_resources.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChantLocalResources {

 Chant get chant; String get audioLocalPath; String get lyricsLocalPath; int get audioVersion; int get lyricsVersion; bool get usedStaleCache;
/// Create a copy of ChantLocalResources
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantLocalResourcesCopyWith<ChantLocalResources> get copyWith => _$ChantLocalResourcesCopyWithImpl<ChantLocalResources>(this as ChantLocalResources, _$identity);

  /// Serializes this ChantLocalResources to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantLocalResources&&(identical(other.chant, chant) || other.chant == chant)&&(identical(other.audioLocalPath, audioLocalPath) || other.audioLocalPath == audioLocalPath)&&(identical(other.lyricsLocalPath, lyricsLocalPath) || other.lyricsLocalPath == lyricsLocalPath)&&(identical(other.audioVersion, audioVersion) || other.audioVersion == audioVersion)&&(identical(other.lyricsVersion, lyricsVersion) || other.lyricsVersion == lyricsVersion)&&(identical(other.usedStaleCache, usedStaleCache) || other.usedStaleCache == usedStaleCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chant,audioLocalPath,lyricsLocalPath,audioVersion,lyricsVersion,usedStaleCache);

@override
String toString() {
  return 'ChantLocalResources(chant: $chant, audioLocalPath: $audioLocalPath, lyricsLocalPath: $lyricsLocalPath, audioVersion: $audioVersion, lyricsVersion: $lyricsVersion, usedStaleCache: $usedStaleCache)';
}


}

/// @nodoc
abstract mixin class $ChantLocalResourcesCopyWith<$Res>  {
  factory $ChantLocalResourcesCopyWith(ChantLocalResources value, $Res Function(ChantLocalResources) _then) = _$ChantLocalResourcesCopyWithImpl;
@useResult
$Res call({
 Chant chant, String audioLocalPath, String lyricsLocalPath, int audioVersion, int lyricsVersion, bool usedStaleCache
});


$ChantCopyWith<$Res> get chant;

}
/// @nodoc
class _$ChantLocalResourcesCopyWithImpl<$Res>
    implements $ChantLocalResourcesCopyWith<$Res> {
  _$ChantLocalResourcesCopyWithImpl(this._self, this._then);

  final ChantLocalResources _self;
  final $Res Function(ChantLocalResources) _then;

/// Create a copy of ChantLocalResources
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chant = null,Object? audioLocalPath = null,Object? lyricsLocalPath = null,Object? audioVersion = null,Object? lyricsVersion = null,Object? usedStaleCache = null,}) {
  return _then(_self.copyWith(
chant: null == chant ? _self.chant : chant // ignore: cast_nullable_to_non_nullable
as Chant,audioLocalPath: null == audioLocalPath ? _self.audioLocalPath : audioLocalPath // ignore: cast_nullable_to_non_nullable
as String,lyricsLocalPath: null == lyricsLocalPath ? _self.lyricsLocalPath : lyricsLocalPath // ignore: cast_nullable_to_non_nullable
as String,audioVersion: null == audioVersion ? _self.audioVersion : audioVersion // ignore: cast_nullable_to_non_nullable
as int,lyricsVersion: null == lyricsVersion ? _self.lyricsVersion : lyricsVersion // ignore: cast_nullable_to_non_nullable
as int,usedStaleCache: null == usedStaleCache ? _self.usedStaleCache : usedStaleCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChantLocalResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantCopyWith<$Res> get chant {
  
  return $ChantCopyWith<$Res>(_self.chant, (value) {
    return _then(_self.copyWith(chant: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChantLocalResources].
extension ChantLocalResourcesPatterns on ChantLocalResources {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantLocalResources value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantLocalResources() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantLocalResources value)  $default,){
final _that = this;
switch (_that) {
case _ChantLocalResources():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantLocalResources value)?  $default,){
final _that = this;
switch (_that) {
case _ChantLocalResources() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Chant chant,  String audioLocalPath,  String lyricsLocalPath,  int audioVersion,  int lyricsVersion,  bool usedStaleCache)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChantLocalResources() when $default != null:
return $default(_that.chant,_that.audioLocalPath,_that.lyricsLocalPath,_that.audioVersion,_that.lyricsVersion,_that.usedStaleCache);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Chant chant,  String audioLocalPath,  String lyricsLocalPath,  int audioVersion,  int lyricsVersion,  bool usedStaleCache)  $default,) {final _that = this;
switch (_that) {
case _ChantLocalResources():
return $default(_that.chant,_that.audioLocalPath,_that.lyricsLocalPath,_that.audioVersion,_that.lyricsVersion,_that.usedStaleCache);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Chant chant,  String audioLocalPath,  String lyricsLocalPath,  int audioVersion,  int lyricsVersion,  bool usedStaleCache)?  $default,) {final _that = this;
switch (_that) {
case _ChantLocalResources() when $default != null:
return $default(_that.chant,_that.audioLocalPath,_that.lyricsLocalPath,_that.audioVersion,_that.lyricsVersion,_that.usedStaleCache);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChantLocalResources extends ChantLocalResources {
  const _ChantLocalResources({required this.chant, required this.audioLocalPath, required this.lyricsLocalPath, required this.audioVersion, required this.lyricsVersion, this.usedStaleCache = false}): super._();
  factory _ChantLocalResources.fromJson(Map<String, dynamic> json) => _$ChantLocalResourcesFromJson(json);

@override final  Chant chant;
@override final  String audioLocalPath;
@override final  String lyricsLocalPath;
@override final  int audioVersion;
@override final  int lyricsVersion;
@override@JsonKey() final  bool usedStaleCache;

/// Create a copy of ChantLocalResources
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantLocalResourcesCopyWith<_ChantLocalResources> get copyWith => __$ChantLocalResourcesCopyWithImpl<_ChantLocalResources>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChantLocalResourcesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantLocalResources&&(identical(other.chant, chant) || other.chant == chant)&&(identical(other.audioLocalPath, audioLocalPath) || other.audioLocalPath == audioLocalPath)&&(identical(other.lyricsLocalPath, lyricsLocalPath) || other.lyricsLocalPath == lyricsLocalPath)&&(identical(other.audioVersion, audioVersion) || other.audioVersion == audioVersion)&&(identical(other.lyricsVersion, lyricsVersion) || other.lyricsVersion == lyricsVersion)&&(identical(other.usedStaleCache, usedStaleCache) || other.usedStaleCache == usedStaleCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chant,audioLocalPath,lyricsLocalPath,audioVersion,lyricsVersion,usedStaleCache);

@override
String toString() {
  return 'ChantLocalResources(chant: $chant, audioLocalPath: $audioLocalPath, lyricsLocalPath: $lyricsLocalPath, audioVersion: $audioVersion, lyricsVersion: $lyricsVersion, usedStaleCache: $usedStaleCache)';
}


}

/// @nodoc
abstract mixin class _$ChantLocalResourcesCopyWith<$Res> implements $ChantLocalResourcesCopyWith<$Res> {
  factory _$ChantLocalResourcesCopyWith(_ChantLocalResources value, $Res Function(_ChantLocalResources) _then) = __$ChantLocalResourcesCopyWithImpl;
@override @useResult
$Res call({
 Chant chant, String audioLocalPath, String lyricsLocalPath, int audioVersion, int lyricsVersion, bool usedStaleCache
});


@override $ChantCopyWith<$Res> get chant;

}
/// @nodoc
class __$ChantLocalResourcesCopyWithImpl<$Res>
    implements _$ChantLocalResourcesCopyWith<$Res> {
  __$ChantLocalResourcesCopyWithImpl(this._self, this._then);

  final _ChantLocalResources _self;
  final $Res Function(_ChantLocalResources) _then;

/// Create a copy of ChantLocalResources
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chant = null,Object? audioLocalPath = null,Object? lyricsLocalPath = null,Object? audioVersion = null,Object? lyricsVersion = null,Object? usedStaleCache = null,}) {
  return _then(_ChantLocalResources(
chant: null == chant ? _self.chant : chant // ignore: cast_nullable_to_non_nullable
as Chant,audioLocalPath: null == audioLocalPath ? _self.audioLocalPath : audioLocalPath // ignore: cast_nullable_to_non_nullable
as String,lyricsLocalPath: null == lyricsLocalPath ? _self.lyricsLocalPath : lyricsLocalPath // ignore: cast_nullable_to_non_nullable
as String,audioVersion: null == audioVersion ? _self.audioVersion : audioVersion // ignore: cast_nullable_to_non_nullable
as int,lyricsVersion: null == lyricsVersion ? _self.lyricsVersion : lyricsVersion // ignore: cast_nullable_to_non_nullable
as int,usedStaleCache: null == usedStaleCache ? _self.usedStaleCache : usedStaleCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChantLocalResources
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantCopyWith<$Res> get chant {
  
  return $ChantCopyWith<$Res>(_self.chant, (value) {
    return _then(_self.copyWith(chant: value));
  });
}
}

// dart format on
