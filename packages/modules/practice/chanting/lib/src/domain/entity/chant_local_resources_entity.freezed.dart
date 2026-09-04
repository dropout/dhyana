// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chant_local_resources_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChantLocalResourcesEntity {

 ChantEntity get chant; String get audioLocalPath; String get lyricsLocalPath; int get audioVersion; int get lyricsVersion; bool get usedStaleCache;
/// Create a copy of ChantLocalResourcesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantLocalResourcesEntityCopyWith<ChantLocalResourcesEntity> get copyWith => _$ChantLocalResourcesEntityCopyWithImpl<ChantLocalResourcesEntity>(this as ChantLocalResourcesEntity, _$identity);

  /// Serializes this ChantLocalResourcesEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChantLocalResourcesEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantLocalResourcesEntity&&(identical(other.chant, _this.chant) || other.chant == _this.chant)&&(identical(other.audioLocalPath, _this.audioLocalPath) || other.audioLocalPath == _this.audioLocalPath)&&(identical(other.lyricsLocalPath, _this.lyricsLocalPath) || other.lyricsLocalPath == _this.lyricsLocalPath)&&(identical(other.audioVersion, _this.audioVersion) || other.audioVersion == _this.audioVersion)&&(identical(other.lyricsVersion, _this.lyricsVersion) || other.lyricsVersion == _this.lyricsVersion)&&(identical(other.usedStaleCache, _this.usedStaleCache) || other.usedStaleCache == _this.usedStaleCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChantLocalResourcesEntity;
  return Object.hash(runtimeType,_this.chant,_this.audioLocalPath,_this.lyricsLocalPath,_this.audioVersion,_this.lyricsVersion,_this.usedStaleCache);
}

@override
String toString() {
  final _this = this as ChantLocalResourcesEntity;
  return 'ChantLocalResourcesEntity(chant: ${_this.chant}, audioLocalPath: ${_this.audioLocalPath}, lyricsLocalPath: ${_this.lyricsLocalPath}, audioVersion: ${_this.audioVersion}, lyricsVersion: ${_this.lyricsVersion}, usedStaleCache: ${_this.usedStaleCache})';
}


}

/// @nodoc
abstract mixin class $ChantLocalResourcesEntityCopyWith<$Res>  {
  factory $ChantLocalResourcesEntityCopyWith(ChantLocalResourcesEntity value, $Res Function(ChantLocalResourcesEntity) _then) = _$ChantLocalResourcesEntityCopyWithImpl;
@useResult
$Res call({
 ChantEntity chant, String audioLocalPath, String lyricsLocalPath, int audioVersion, int lyricsVersion, bool usedStaleCache
});


$ChantEntityCopyWith<$Res> get chant;

}
/// @nodoc
class _$ChantLocalResourcesEntityCopyWithImpl<$Res>
    implements $ChantLocalResourcesEntityCopyWith<$Res> {
  _$ChantLocalResourcesEntityCopyWithImpl(this._self, this._then);

  final ChantLocalResourcesEntity _self;
  final $Res Function(ChantLocalResourcesEntity) _then;

/// Create a copy of ChantLocalResourcesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chant = null,Object? audioLocalPath = null,Object? lyricsLocalPath = null,Object? audioVersion = null,Object? lyricsVersion = null,Object? usedStaleCache = null,}) {
  return _then(ChantLocalResourcesEntity(
chant: null == chant ? _self.chant : chant // ignore: cast_nullable_to_non_nullable
as ChantEntity,audioLocalPath: null == audioLocalPath ? _self.audioLocalPath : audioLocalPath // ignore: cast_nullable_to_non_nullable
as String,lyricsLocalPath: null == lyricsLocalPath ? _self.lyricsLocalPath : lyricsLocalPath // ignore: cast_nullable_to_non_nullable
as String,audioVersion: null == audioVersion ? _self.audioVersion : audioVersion // ignore: cast_nullable_to_non_nullable
as int,lyricsVersion: null == lyricsVersion ? _self.lyricsVersion : lyricsVersion // ignore: cast_nullable_to_non_nullable
as int,usedStaleCache: null == usedStaleCache ? _self.usedStaleCache : usedStaleCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChantLocalResourcesEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantEntityCopyWith<$Res> get chant {
  
  return $ChantEntityCopyWith<$Res>(_self.chant, (value) {
    return _then(_self.copyWith(chant: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChantLocalResourcesEntity].
extension ChantLocalResourcesEntityPatterns on ChantLocalResourcesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantLocalResourcesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantLocalResourcesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantLocalResourcesEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChantLocalResourcesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantLocalResourcesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChantLocalResourcesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChantEntity chant,  String audioLocalPath,  String lyricsLocalPath,  int audioVersion,  int lyricsVersion,  bool usedStaleCache)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChantLocalResourcesEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChantEntity chant,  String audioLocalPath,  String lyricsLocalPath,  int audioVersion,  int lyricsVersion,  bool usedStaleCache)  $default,) {final _that = this;
switch (_that) {
case _ChantLocalResourcesEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChantEntity chant,  String audioLocalPath,  String lyricsLocalPath,  int audioVersion,  int lyricsVersion,  bool usedStaleCache)?  $default,) {final _that = this;
switch (_that) {
case _ChantLocalResourcesEntity() when $default != null:
return $default(_that.chant,_that.audioLocalPath,_that.lyricsLocalPath,_that.audioVersion,_that.lyricsVersion,_that.usedStaleCache);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChantLocalResourcesEntity extends ChantLocalResourcesEntity {
  const _ChantLocalResourcesEntity({required this.chant, required this.audioLocalPath, required this.lyricsLocalPath, required this.audioVersion, required this.lyricsVersion, this.usedStaleCache = false}): super._();
  factory _ChantLocalResourcesEntity.fromJson(Map<String, dynamic> json) => _$ChantLocalResourcesEntityFromJson(json);

@override final  ChantEntity chant;
@override final  String audioLocalPath;
@override final  String lyricsLocalPath;
@override final  int audioVersion;
@override final  int lyricsVersion;
@override@JsonKey() final  bool usedStaleCache;

/// Create a copy of ChantLocalResourcesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantLocalResourcesEntityCopyWith<_ChantLocalResourcesEntity> get copyWith => __$ChantLocalResourcesEntityCopyWithImpl<_ChantLocalResourcesEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChantLocalResourcesEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantLocalResourcesEntity&&(identical(other.chant, chant) || other.chant == chant)&&(identical(other.audioLocalPath, audioLocalPath) || other.audioLocalPath == audioLocalPath)&&(identical(other.lyricsLocalPath, lyricsLocalPath) || other.lyricsLocalPath == lyricsLocalPath)&&(identical(other.audioVersion, audioVersion) || other.audioVersion == audioVersion)&&(identical(other.lyricsVersion, lyricsVersion) || other.lyricsVersion == lyricsVersion)&&(identical(other.usedStaleCache, usedStaleCache) || other.usedStaleCache == usedStaleCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,chant,audioLocalPath,lyricsLocalPath,audioVersion,lyricsVersion,usedStaleCache);
}

@override
String toString() {
    return 'ChantLocalResourcesEntity(chant: $chant, audioLocalPath: $audioLocalPath, lyricsLocalPath: $lyricsLocalPath, audioVersion: $audioVersion, lyricsVersion: $lyricsVersion, usedStaleCache: $usedStaleCache)';
}


}

/// @nodoc
abstract mixin class _$ChantLocalResourcesEntityCopyWith<$Res> implements $ChantLocalResourcesEntityCopyWith<$Res> {
  factory _$ChantLocalResourcesEntityCopyWith(_ChantLocalResourcesEntity value, $Res Function(_ChantLocalResourcesEntity) _then) = __$ChantLocalResourcesEntityCopyWithImpl;
@override @useResult
$Res call({
 ChantEntity chant, String audioLocalPath, String lyricsLocalPath, int audioVersion, int lyricsVersion, bool usedStaleCache
});


@override $ChantEntityCopyWith<$Res> get chant;

}
/// @nodoc
class __$ChantLocalResourcesEntityCopyWithImpl<$Res>
    implements _$ChantLocalResourcesEntityCopyWith<$Res> {
  __$ChantLocalResourcesEntityCopyWithImpl(this._self, this._then);

  final _ChantLocalResourcesEntity _self;
  final $Res Function(_ChantLocalResourcesEntity) _then;

/// Create a copy of ChantLocalResourcesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chant = null,Object? audioLocalPath = null,Object? lyricsLocalPath = null,Object? audioVersion = null,Object? lyricsVersion = null,Object? usedStaleCache = null,}) {
  return _then(_ChantLocalResourcesEntity(
chant: null == chant ? _self.chant : chant // ignore: cast_nullable_to_non_nullable
as ChantEntity,audioLocalPath: null == audioLocalPath ? _self.audioLocalPath : audioLocalPath // ignore: cast_nullable_to_non_nullable
as String,lyricsLocalPath: null == lyricsLocalPath ? _self.lyricsLocalPath : lyricsLocalPath // ignore: cast_nullable_to_non_nullable
as String,audioVersion: null == audioVersion ? _self.audioVersion : audioVersion // ignore: cast_nullable_to_non_nullable
as int,lyricsVersion: null == lyricsVersion ? _self.lyricsVersion : lyricsVersion // ignore: cast_nullable_to_non_nullable
as int,usedStaleCache: null == usedStaleCache ? _self.usedStaleCache : usedStaleCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChantLocalResourcesEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantEntityCopyWith<$Res> get chant {
  
  return $ChantEntityCopyWith<$Res>(_self.chant, (value) {
    return _then(_self.copyWith(chant: value));
  });
}
}

// dart format on
