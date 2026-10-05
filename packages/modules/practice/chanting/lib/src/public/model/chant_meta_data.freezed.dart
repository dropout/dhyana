// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chant_meta_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChantMetaData {

 String get id; int get audioVersion; int get lyricsVersion; int get coverVersion; String get audioSha256; String get lyricsSha256; String get coverSha256; int get audioBytes; int get lyricsBytes; int get coverBytes;@DateTimeConverter() DateTime get updatedAt;
/// Create a copy of ChantMetaData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantMetaDataCopyWith<ChantMetaData> get copyWith => _$ChantMetaDataCopyWithImpl<ChantMetaData>(this as ChantMetaData, _$identity);

  /// Serializes this ChantMetaData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChantMetaData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantMetaData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.audioVersion, _this.audioVersion) || other.audioVersion == _this.audioVersion)&&(identical(other.lyricsVersion, _this.lyricsVersion) || other.lyricsVersion == _this.lyricsVersion)&&(identical(other.coverVersion, _this.coverVersion) || other.coverVersion == _this.coverVersion)&&(identical(other.audioSha256, _this.audioSha256) || other.audioSha256 == _this.audioSha256)&&(identical(other.lyricsSha256, _this.lyricsSha256) || other.lyricsSha256 == _this.lyricsSha256)&&(identical(other.coverSha256, _this.coverSha256) || other.coverSha256 == _this.coverSha256)&&(identical(other.audioBytes, _this.audioBytes) || other.audioBytes == _this.audioBytes)&&(identical(other.lyricsBytes, _this.lyricsBytes) || other.lyricsBytes == _this.lyricsBytes)&&(identical(other.coverBytes, _this.coverBytes) || other.coverBytes == _this.coverBytes)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChantMetaData;
  return Object.hash(runtimeType,_this.id,_this.audioVersion,_this.lyricsVersion,_this.coverVersion,_this.audioSha256,_this.lyricsSha256,_this.coverSha256,_this.audioBytes,_this.lyricsBytes,_this.coverBytes,_this.updatedAt);
}

@override
String toString() {
  final _this = this as ChantMetaData;
  return 'ChantMetaData(id: ${_this.id}, audioVersion: ${_this.audioVersion}, lyricsVersion: ${_this.lyricsVersion}, coverVersion: ${_this.coverVersion}, audioSha256: ${_this.audioSha256}, lyricsSha256: ${_this.lyricsSha256}, coverSha256: ${_this.coverSha256}, audioBytes: ${_this.audioBytes}, lyricsBytes: ${_this.lyricsBytes}, coverBytes: ${_this.coverBytes}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ChantMetaDataCopyWith<$Res>  {
  factory $ChantMetaDataCopyWith(ChantMetaData value, $Res Function(ChantMetaData) _then) = _$ChantMetaDataCopyWithImpl;
@useResult
$Res call({
 String id, int audioVersion, int lyricsVersion, int coverVersion, String audioSha256, String lyricsSha256, String coverSha256, int audioBytes, int lyricsBytes, int coverBytes,@DateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$ChantMetaDataCopyWithImpl<$Res>
    implements $ChantMetaDataCopyWith<$Res> {
  _$ChantMetaDataCopyWithImpl(this._self, this._then);

  final ChantMetaData _self;
  final $Res Function(ChantMetaData) _then;

/// Create a copy of ChantMetaData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? audioVersion = null,Object? lyricsVersion = null,Object? coverVersion = null,Object? audioSha256 = null,Object? lyricsSha256 = null,Object? coverSha256 = null,Object? audioBytes = null,Object? lyricsBytes = null,Object? coverBytes = null,Object? updatedAt = null,}) {
  return _then(ChantMetaData(
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


/// Adds pattern-matching-related methods to [ChantMetaData].
extension ChantMetaDataPatterns on ChantMetaData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantMetaData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantMetaData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantMetaData value)  $default,){
final _that = this;
switch (_that) {
case _ChantMetaData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantMetaData value)?  $default,){
final _that = this;
switch (_that) {
case _ChantMetaData() when $default != null:
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
case _ChantMetaData() when $default != null:
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
case _ChantMetaData():
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
case _ChantMetaData() when $default != null:
return $default(_that.id,_that.audioVersion,_that.lyricsVersion,_that.coverVersion,_that.audioSha256,_that.lyricsSha256,_that.coverSha256,_that.audioBytes,_that.lyricsBytes,_that.coverBytes,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChantMetaData extends ChantMetaData {
  const _ChantMetaData({required this.id, required this.audioVersion, required this.lyricsVersion, required this.coverVersion, required this.audioSha256, required this.lyricsSha256, required this.coverSha256, required this.audioBytes, required this.lyricsBytes, required this.coverBytes, @DateTimeConverter() required this.updatedAt}): super._();
  factory _ChantMetaData.fromJson(Map<String, dynamic> json) => _$ChantMetaDataFromJson(json);

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

/// Create a copy of ChantMetaData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantMetaDataCopyWith<_ChantMetaData> get copyWith => __$ChantMetaDataCopyWithImpl<_ChantMetaData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChantMetaDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantMetaData&&(identical(other.id, id) || other.id == id)&&(identical(other.audioVersion, audioVersion) || other.audioVersion == audioVersion)&&(identical(other.lyricsVersion, lyricsVersion) || other.lyricsVersion == lyricsVersion)&&(identical(other.coverVersion, coverVersion) || other.coverVersion == coverVersion)&&(identical(other.audioSha256, audioSha256) || other.audioSha256 == audioSha256)&&(identical(other.lyricsSha256, lyricsSha256) || other.lyricsSha256 == lyricsSha256)&&(identical(other.coverSha256, coverSha256) || other.coverSha256 == coverSha256)&&(identical(other.audioBytes, audioBytes) || other.audioBytes == audioBytes)&&(identical(other.lyricsBytes, lyricsBytes) || other.lyricsBytes == lyricsBytes)&&(identical(other.coverBytes, coverBytes) || other.coverBytes == coverBytes)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,audioVersion,lyricsVersion,coverVersion,audioSha256,lyricsSha256,coverSha256,audioBytes,lyricsBytes,coverBytes,updatedAt);
}

@override
String toString() {
    return 'ChantMetaData(id: $id, audioVersion: $audioVersion, lyricsVersion: $lyricsVersion, coverVersion: $coverVersion, audioSha256: $audioSha256, lyricsSha256: $lyricsSha256, coverSha256: $coverSha256, audioBytes: $audioBytes, lyricsBytes: $lyricsBytes, coverBytes: $coverBytes, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChantMetaDataCopyWith<$Res> implements $ChantMetaDataCopyWith<$Res> {
  factory _$ChantMetaDataCopyWith(_ChantMetaData value, $Res Function(_ChantMetaData) _then) = __$ChantMetaDataCopyWithImpl;
@override @useResult
$Res call({
 String id, int audioVersion, int lyricsVersion, int coverVersion, String audioSha256, String lyricsSha256, String coverSha256, int audioBytes, int lyricsBytes, int coverBytes,@DateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$ChantMetaDataCopyWithImpl<$Res>
    implements _$ChantMetaDataCopyWith<$Res> {
  __$ChantMetaDataCopyWithImpl(this._self, this._then);

  final _ChantMetaData _self;
  final $Res Function(_ChantMetaData) _then;

/// Create a copy of ChantMetaData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? audioVersion = null,Object? lyricsVersion = null,Object? coverVersion = null,Object? audioSha256 = null,Object? lyricsSha256 = null,Object? coverSha256 = null,Object? audioBytes = null,Object? lyricsBytes = null,Object? coverBytes = null,Object? updatedAt = null,}) {
  return _then(_ChantMetaData(
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
