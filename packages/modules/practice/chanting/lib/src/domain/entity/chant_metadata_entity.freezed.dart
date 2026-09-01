// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chant_metadata_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChantMetaDataEntity {

 String get id; int get audioVersion; int get lyricsVersion; int get coverVersion; String get audioSha256; String get lyricsSha256; String get coverSha256; int get audioBytes; int get lyricsBytes; int get coverBytes;@DateTimeConverter() DateTime get updatedAt;
/// Create a copy of ChantMetaDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantMetaDataEntityCopyWith<ChantMetaDataEntity> get copyWith => _$ChantMetaDataEntityCopyWithImpl<ChantMetaDataEntity>(this as ChantMetaDataEntity, _$identity);

  /// Serializes this ChantMetaDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantMetaDataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.audioVersion, audioVersion) || other.audioVersion == audioVersion)&&(identical(other.lyricsVersion, lyricsVersion) || other.lyricsVersion == lyricsVersion)&&(identical(other.coverVersion, coverVersion) || other.coverVersion == coverVersion)&&(identical(other.audioSha256, audioSha256) || other.audioSha256 == audioSha256)&&(identical(other.lyricsSha256, lyricsSha256) || other.lyricsSha256 == lyricsSha256)&&(identical(other.coverSha256, coverSha256) || other.coverSha256 == coverSha256)&&(identical(other.audioBytes, audioBytes) || other.audioBytes == audioBytes)&&(identical(other.lyricsBytes, lyricsBytes) || other.lyricsBytes == lyricsBytes)&&(identical(other.coverBytes, coverBytes) || other.coverBytes == coverBytes)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,audioVersion,lyricsVersion,coverVersion,audioSha256,lyricsSha256,coverSha256,audioBytes,lyricsBytes,coverBytes,updatedAt);

@override
String toString() {
  return 'ChantMetaDataEntity(id: $id, audioVersion: $audioVersion, lyricsVersion: $lyricsVersion, coverVersion: $coverVersion, audioSha256: $audioSha256, lyricsSha256: $lyricsSha256, coverSha256: $coverSha256, audioBytes: $audioBytes, lyricsBytes: $lyricsBytes, coverBytes: $coverBytes, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChantMetaDataEntityCopyWith<$Res>  {
  factory $ChantMetaDataEntityCopyWith(ChantMetaDataEntity value, $Res Function(ChantMetaDataEntity) _then) = _$ChantMetaDataEntityCopyWithImpl;
@useResult
$Res call({
 String id, int audioVersion, int lyricsVersion, int coverVersion, String audioSha256, String lyricsSha256, String coverSha256, int audioBytes, int lyricsBytes, int coverBytes,@DateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$ChantMetaDataEntityCopyWithImpl<$Res>
    implements $ChantMetaDataEntityCopyWith<$Res> {
  _$ChantMetaDataEntityCopyWithImpl(this._self, this._then);

  final ChantMetaDataEntity _self;
  final $Res Function(ChantMetaDataEntity) _then;

/// Create a copy of ChantMetaDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? audioVersion = null,Object? lyricsVersion = null,Object? coverVersion = null,Object? audioSha256 = null,Object? lyricsSha256 = null,Object? coverSha256 = null,Object? audioBytes = null,Object? lyricsBytes = null,Object? coverBytes = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,audioVersion: null == audioVersion ? _self.audioVersion : audioVersion // ignore: cast_nullable_to_non_nullable
as int,lyricsVersion: null == lyricsVersion ? _self.lyricsVersion : lyricsVersion // ignore: cast_nullable_to_non_nullable
as int,coverVersion: null == coverVersion ? _self.coverVersion : coverVersion // ignore: cast_nullable_to_non_nullable
as int,audioSha256: null == audioSha256 ? _self.audioSha256 : audioSha256 // ignore: cast_nullable_to_non_nullable
as String,lyricsSha256: null == lyricsSha256 ? _self.lyricsSha256 : lyricsSha256 // ignore: cast_nullable_to_non_nullable
as String,coverSha256: null == coverSha256 ? _self.coverSha256 : coverSha256 // ignore: cast_nullable_to_non_nullable
as String,audioBytes: null == audioBytes ? _self.audioBytes : audioBytes // ignore: cast_nullable_to_non_nullable
as int,lyricsBytes: null == lyricsBytes ? _self.lyricsBytes : lyricsBytes // ignore: cast_nullable_to_non_nullable
as int,coverBytes: null == coverBytes ? _self.coverBytes : coverBytes // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChantMetaDataEntity].
extension ChantMetaDataEntityPatterns on ChantMetaDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantMetaDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantMetaDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantMetaDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChantMetaDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantMetaDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChantMetaDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int audioVersion,  int lyricsVersion,  int coverVersion,  String audioSha256,  String lyricsSha256,  String coverSha256,  int audioBytes,  int lyricsBytes,  int coverBytes, @DateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChantMetaDataEntity() when $default != null:
return $default(_that.id,_that.audioVersion,_that.lyricsVersion,_that.coverVersion,_that.audioSha256,_that.lyricsSha256,_that.coverSha256,_that.audioBytes,_that.lyricsBytes,_that.coverBytes,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int audioVersion,  int lyricsVersion,  int coverVersion,  String audioSha256,  String lyricsSha256,  String coverSha256,  int audioBytes,  int lyricsBytes,  int coverBytes, @DateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChantMetaDataEntity():
return $default(_that.id,_that.audioVersion,_that.lyricsVersion,_that.coverVersion,_that.audioSha256,_that.lyricsSha256,_that.coverSha256,_that.audioBytes,_that.lyricsBytes,_that.coverBytes,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int audioVersion,  int lyricsVersion,  int coverVersion,  String audioSha256,  String lyricsSha256,  String coverSha256,  int audioBytes,  int lyricsBytes,  int coverBytes, @DateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChantMetaDataEntity() when $default != null:
return $default(_that.id,_that.audioVersion,_that.lyricsVersion,_that.coverVersion,_that.audioSha256,_that.lyricsSha256,_that.coverSha256,_that.audioBytes,_that.lyricsBytes,_that.coverBytes,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChantMetaDataEntity extends ChantMetaDataEntity {
  const _ChantMetaDataEntity({required this.id, required this.audioVersion, required this.lyricsVersion, required this.coverVersion, required this.audioSha256, required this.lyricsSha256, required this.coverSha256, required this.audioBytes, required this.lyricsBytes, required this.coverBytes, @DateTimeConverter() required this.updatedAt}): super._();
  factory _ChantMetaDataEntity.fromJson(Map<String, dynamic> json) => _$ChantMetaDataEntityFromJson(json);

@override final  String id;
@override final  int audioVersion;
@override final  int lyricsVersion;
@override final  int coverVersion;
@override final  String audioSha256;
@override final  String lyricsSha256;
@override final  String coverSha256;
@override final  int audioBytes;
@override final  int lyricsBytes;
@override final  int coverBytes;
@override@DateTimeConverter() final  DateTime updatedAt;

/// Create a copy of ChantMetaDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantMetaDataEntityCopyWith<_ChantMetaDataEntity> get copyWith => __$ChantMetaDataEntityCopyWithImpl<_ChantMetaDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChantMetaDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantMetaDataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.audioVersion, audioVersion) || other.audioVersion == audioVersion)&&(identical(other.lyricsVersion, lyricsVersion) || other.lyricsVersion == lyricsVersion)&&(identical(other.coverVersion, coverVersion) || other.coverVersion == coverVersion)&&(identical(other.audioSha256, audioSha256) || other.audioSha256 == audioSha256)&&(identical(other.lyricsSha256, lyricsSha256) || other.lyricsSha256 == lyricsSha256)&&(identical(other.coverSha256, coverSha256) || other.coverSha256 == coverSha256)&&(identical(other.audioBytes, audioBytes) || other.audioBytes == audioBytes)&&(identical(other.lyricsBytes, lyricsBytes) || other.lyricsBytes == lyricsBytes)&&(identical(other.coverBytes, coverBytes) || other.coverBytes == coverBytes)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,audioVersion,lyricsVersion,coverVersion,audioSha256,lyricsSha256,coverSha256,audioBytes,lyricsBytes,coverBytes,updatedAt);

@override
String toString() {
  return 'ChantMetaDataEntity(id: $id, audioVersion: $audioVersion, lyricsVersion: $lyricsVersion, coverVersion: $coverVersion, audioSha256: $audioSha256, lyricsSha256: $lyricsSha256, coverSha256: $coverSha256, audioBytes: $audioBytes, lyricsBytes: $lyricsBytes, coverBytes: $coverBytes, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChantMetaDataEntityCopyWith<$Res> implements $ChantMetaDataEntityCopyWith<$Res> {
  factory _$ChantMetaDataEntityCopyWith(_ChantMetaDataEntity value, $Res Function(_ChantMetaDataEntity) _then) = __$ChantMetaDataEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, int audioVersion, int lyricsVersion, int coverVersion, String audioSha256, String lyricsSha256, String coverSha256, int audioBytes, int lyricsBytes, int coverBytes,@DateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$ChantMetaDataEntityCopyWithImpl<$Res>
    implements _$ChantMetaDataEntityCopyWith<$Res> {
  __$ChantMetaDataEntityCopyWithImpl(this._self, this._then);

  final _ChantMetaDataEntity _self;
  final $Res Function(_ChantMetaDataEntity) _then;

/// Create a copy of ChantMetaDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? audioVersion = null,Object? lyricsVersion = null,Object? coverVersion = null,Object? audioSha256 = null,Object? lyricsSha256 = null,Object? coverSha256 = null,Object? audioBytes = null,Object? lyricsBytes = null,Object? coverBytes = null,Object? updatedAt = null,}) {
  return _then(_ChantMetaDataEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,audioVersion: null == audioVersion ? _self.audioVersion : audioVersion // ignore: cast_nullable_to_non_nullable
as int,lyricsVersion: null == lyricsVersion ? _self.lyricsVersion : lyricsVersion // ignore: cast_nullable_to_non_nullable
as int,coverVersion: null == coverVersion ? _self.coverVersion : coverVersion // ignore: cast_nullable_to_non_nullable
as int,audioSha256: null == audioSha256 ? _self.audioSha256 : audioSha256 // ignore: cast_nullable_to_non_nullable
as String,lyricsSha256: null == lyricsSha256 ? _self.lyricsSha256 : lyricsSha256 // ignore: cast_nullable_to_non_nullable
as String,coverSha256: null == coverSha256 ? _self.coverSha256 : coverSha256 // ignore: cast_nullable_to_non_nullable
as String,audioBytes: null == audioBytes ? _self.audioBytes : audioBytes // ignore: cast_nullable_to_non_nullable
as int,lyricsBytes: null == lyricsBytes ? _self.lyricsBytes : lyricsBytes // ignore: cast_nullable_to_non_nullable
as int,coverBytes: null == coverBytes ? _self.coverBytes : coverBytes // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
