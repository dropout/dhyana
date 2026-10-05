// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chant_cache_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChantCacheEntity {

 String get id; String get contentId; CachedAssetType get assetType; String get storagePath; String get localFilePath; int get cachedVersion; int get remoteUpdatedAtEpochMs; String? get remoteHash; int? get remoteBytes; bool get isValid; CacheDownloadState get downloadState; int get failureCount; String? get lastError; int? get lastValidatedAtEpochMs; int get createdAtEpochMs; int get updatedAtEpochMs;
/// Create a copy of ChantCacheEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantCacheEntityCopyWith<ChantCacheEntity> get copyWith => _$ChantCacheEntityCopyWithImpl<ChantCacheEntity>(this as ChantCacheEntity, _$identity);

  /// Serializes this ChantCacheEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChantCacheEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantCacheEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.contentId, _this.contentId) || other.contentId == _this.contentId)&&(identical(other.assetType, _this.assetType) || other.assetType == _this.assetType)&&(identical(other.storagePath, _this.storagePath) || other.storagePath == _this.storagePath)&&(identical(other.localFilePath, _this.localFilePath) || other.localFilePath == _this.localFilePath)&&(identical(other.cachedVersion, _this.cachedVersion) || other.cachedVersion == _this.cachedVersion)&&(identical(other.remoteUpdatedAtEpochMs, _this.remoteUpdatedAtEpochMs) || other.remoteUpdatedAtEpochMs == _this.remoteUpdatedAtEpochMs)&&(identical(other.remoteHash, _this.remoteHash) || other.remoteHash == _this.remoteHash)&&(identical(other.remoteBytes, _this.remoteBytes) || other.remoteBytes == _this.remoteBytes)&&(identical(other.isValid, _this.isValid) || other.isValid == _this.isValid)&&(identical(other.downloadState, _this.downloadState) || other.downloadState == _this.downloadState)&&(identical(other.failureCount, _this.failureCount) || other.failureCount == _this.failureCount)&&(identical(other.lastError, _this.lastError) || other.lastError == _this.lastError)&&(identical(other.lastValidatedAtEpochMs, _this.lastValidatedAtEpochMs) || other.lastValidatedAtEpochMs == _this.lastValidatedAtEpochMs)&&(identical(other.createdAtEpochMs, _this.createdAtEpochMs) || other.createdAtEpochMs == _this.createdAtEpochMs)&&(identical(other.updatedAtEpochMs, _this.updatedAtEpochMs) || other.updatedAtEpochMs == _this.updatedAtEpochMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChantCacheEntity;
  return Object.hash(runtimeType,_this.id,_this.contentId,_this.assetType,_this.storagePath,_this.localFilePath,_this.cachedVersion,_this.remoteUpdatedAtEpochMs,_this.remoteHash,_this.remoteBytes,_this.isValid,_this.downloadState,_this.failureCount,_this.lastError,_this.lastValidatedAtEpochMs,_this.createdAtEpochMs,_this.updatedAtEpochMs);
}

@override
String toString() {
  final _this = this as ChantCacheEntity;
  return 'ChantCacheEntity(id: ${_this.id}, contentId: ${_this.contentId}, assetType: ${_this.assetType}, storagePath: ${_this.storagePath}, localFilePath: ${_this.localFilePath}, cachedVersion: ${_this.cachedVersion}, remoteUpdatedAtEpochMs: ${_this.remoteUpdatedAtEpochMs}, remoteHash: ${_this.remoteHash}, remoteBytes: ${_this.remoteBytes}, isValid: ${_this.isValid}, downloadState: ${_this.downloadState}, failureCount: ${_this.failureCount}, lastError: ${_this.lastError}, lastValidatedAtEpochMs: ${_this.lastValidatedAtEpochMs}, createdAtEpochMs: ${_this.createdAtEpochMs}, updatedAtEpochMs: ${_this.updatedAtEpochMs})';
}


}

/// @nodoc
abstract mixin class $ChantCacheEntityCopyWith<$Res>  {
  factory $ChantCacheEntityCopyWith(ChantCacheEntity value, $Res Function(ChantCacheEntity) _then) = _$ChantCacheEntityCopyWithImpl;
@useResult
$Res call({
 String id, String contentId, CachedAssetType assetType, String storagePath, String localFilePath, int cachedVersion, int remoteUpdatedAtEpochMs, String? remoteHash, int? remoteBytes, bool isValid, CacheDownloadState downloadState, int failureCount, String? lastError, int? lastValidatedAtEpochMs, int createdAtEpochMs, int updatedAtEpochMs
});




}
/// @nodoc
class _$ChantCacheEntityCopyWithImpl<$Res>
    implements $ChantCacheEntityCopyWith<$Res> {
  _$ChantCacheEntityCopyWithImpl(this._self, this._then);

  final ChantCacheEntity _self;
  final $Res Function(ChantCacheEntity) _then;

/// Create a copy of ChantCacheEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? contentId = null,Object? assetType = null,Object? storagePath = null,Object? localFilePath = null,Object? cachedVersion = null,Object? remoteUpdatedAtEpochMs = null,Object? remoteHash = freezed,Object? remoteBytes = freezed,Object? isValid = null,Object? downloadState = null,Object? failureCount = null,Object? lastError = freezed,Object? lastValidatedAtEpochMs = freezed,Object? createdAtEpochMs = null,Object? updatedAtEpochMs = null,}) {
  return _then(ChantCacheEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contentId: null == contentId ? _self.contentId : contentId // ignore: cast_nullable_to_non_nullable
as String,assetType: null == assetType ? _self.assetType : assetType // ignore: cast_nullable_to_non_nullable
as CachedAssetType,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,localFilePath: null == localFilePath ? _self.localFilePath : localFilePath // ignore: cast_nullable_to_non_nullable
as String,cachedVersion: null == cachedVersion ? _self.cachedVersion : cachedVersion // ignore: cast_nullable_to_non_nullable
as int,remoteUpdatedAtEpochMs: null == remoteUpdatedAtEpochMs ? _self.remoteUpdatedAtEpochMs : remoteUpdatedAtEpochMs // ignore: cast_nullable_to_non_nullable
as int,remoteHash: freezed == remoteHash ? _self.remoteHash : remoteHash // ignore: cast_nullable_to_non_nullable
as String?,remoteBytes: freezed == remoteBytes ? _self.remoteBytes : remoteBytes // ignore: cast_nullable_to_non_nullable
as int?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,downloadState: null == downloadState ? _self.downloadState : downloadState // ignore: cast_nullable_to_non_nullable
as CacheDownloadState,failureCount: null == failureCount ? _self.failureCount : failureCount // ignore: cast_nullable_to_non_nullable
as int,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,lastValidatedAtEpochMs: freezed == lastValidatedAtEpochMs ? _self.lastValidatedAtEpochMs : lastValidatedAtEpochMs // ignore: cast_nullable_to_non_nullable
as int?,createdAtEpochMs: null == createdAtEpochMs ? _self.createdAtEpochMs : createdAtEpochMs // ignore: cast_nullable_to_non_nullable
as int,updatedAtEpochMs: null == updatedAtEpochMs ? _self.updatedAtEpochMs : updatedAtEpochMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChantCacheEntity].
extension ChantCacheEntityPatterns on ChantCacheEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantCacheEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantCacheEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantCacheEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChantCacheEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantCacheEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChantCacheEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String contentId,  CachedAssetType assetType,  String storagePath,  String localFilePath,  int cachedVersion,  int remoteUpdatedAtEpochMs,  String? remoteHash,  int? remoteBytes,  bool isValid,  CacheDownloadState downloadState,  int failureCount,  String? lastError,  int? lastValidatedAtEpochMs,  int createdAtEpochMs,  int updatedAtEpochMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChantCacheEntity() when $default != null:
return $default(_that.id,_that.contentId,_that.assetType,_that.storagePath,_that.localFilePath,_that.cachedVersion,_that.remoteUpdatedAtEpochMs,_that.remoteHash,_that.remoteBytes,_that.isValid,_that.downloadState,_that.failureCount,_that.lastError,_that.lastValidatedAtEpochMs,_that.createdAtEpochMs,_that.updatedAtEpochMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String contentId,  CachedAssetType assetType,  String storagePath,  String localFilePath,  int cachedVersion,  int remoteUpdatedAtEpochMs,  String? remoteHash,  int? remoteBytes,  bool isValid,  CacheDownloadState downloadState,  int failureCount,  String? lastError,  int? lastValidatedAtEpochMs,  int createdAtEpochMs,  int updatedAtEpochMs)  $default,) {final _that = this;
switch (_that) {
case _ChantCacheEntity():
return $default(_that.id,_that.contentId,_that.assetType,_that.storagePath,_that.localFilePath,_that.cachedVersion,_that.remoteUpdatedAtEpochMs,_that.remoteHash,_that.remoteBytes,_that.isValid,_that.downloadState,_that.failureCount,_that.lastError,_that.lastValidatedAtEpochMs,_that.createdAtEpochMs,_that.updatedAtEpochMs);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String contentId,  CachedAssetType assetType,  String storagePath,  String localFilePath,  int cachedVersion,  int remoteUpdatedAtEpochMs,  String? remoteHash,  int? remoteBytes,  bool isValid,  CacheDownloadState downloadState,  int failureCount,  String? lastError,  int? lastValidatedAtEpochMs,  int createdAtEpochMs,  int updatedAtEpochMs)?  $default,) {final _that = this;
switch (_that) {
case _ChantCacheEntity() when $default != null:
return $default(_that.id,_that.contentId,_that.assetType,_that.storagePath,_that.localFilePath,_that.cachedVersion,_that.remoteUpdatedAtEpochMs,_that.remoteHash,_that.remoteBytes,_that.isValid,_that.downloadState,_that.failureCount,_that.lastError,_that.lastValidatedAtEpochMs,_that.createdAtEpochMs,_that.updatedAtEpochMs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChantCacheEntity extends ChantCacheEntity {
  const _ChantCacheEntity({required this.id, required this.contentId, required this.assetType, required this.storagePath, required this.localFilePath, required this.cachedVersion, required this.remoteUpdatedAtEpochMs, this.remoteHash, this.remoteBytes, this.isValid = false, this.downloadState = CacheDownloadState.pending, this.failureCount = 0, this.lastError, this.lastValidatedAtEpochMs, required this.createdAtEpochMs, required this.updatedAtEpochMs}): super._();
  factory _ChantCacheEntity.fromJson(Map<String, dynamic> json) => _$ChantCacheEntityFromJson(json);

@override final  String id;
@override final  String contentId;
@override final  CachedAssetType assetType;
@override final  String storagePath;
@override final  String localFilePath;
@override final  int cachedVersion;
@override final  int remoteUpdatedAtEpochMs;
@override final  String? remoteHash;
@override final  int? remoteBytes;
@override@JsonKey() final  bool isValid;
@override@JsonKey() final  CacheDownloadState downloadState;
@override@JsonKey() final  int failureCount;
@override final  String? lastError;
@override final  int? lastValidatedAtEpochMs;
@override final  int createdAtEpochMs;
@override final  int updatedAtEpochMs;

/// Create a copy of ChantCacheEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantCacheEntityCopyWith<_ChantCacheEntity> get copyWith => __$ChantCacheEntityCopyWithImpl<_ChantCacheEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChantCacheEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantCacheEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.contentId, contentId) || other.contentId == contentId)&&(identical(other.assetType, assetType) || other.assetType == assetType)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.localFilePath, localFilePath) || other.localFilePath == localFilePath)&&(identical(other.cachedVersion, cachedVersion) || other.cachedVersion == cachedVersion)&&(identical(other.remoteUpdatedAtEpochMs, remoteUpdatedAtEpochMs) || other.remoteUpdatedAtEpochMs == remoteUpdatedAtEpochMs)&&(identical(other.remoteHash, remoteHash) || other.remoteHash == remoteHash)&&(identical(other.remoteBytes, remoteBytes) || other.remoteBytes == remoteBytes)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.downloadState, downloadState) || other.downloadState == downloadState)&&(identical(other.failureCount, failureCount) || other.failureCount == failureCount)&&(identical(other.lastError, lastError) || other.lastError == lastError)&&(identical(other.lastValidatedAtEpochMs, lastValidatedAtEpochMs) || other.lastValidatedAtEpochMs == lastValidatedAtEpochMs)&&(identical(other.createdAtEpochMs, createdAtEpochMs) || other.createdAtEpochMs == createdAtEpochMs)&&(identical(other.updatedAtEpochMs, updatedAtEpochMs) || other.updatedAtEpochMs == updatedAtEpochMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,contentId,assetType,storagePath,localFilePath,cachedVersion,remoteUpdatedAtEpochMs,remoteHash,remoteBytes,isValid,downloadState,failureCount,lastError,lastValidatedAtEpochMs,createdAtEpochMs,updatedAtEpochMs);
}

@override
String toString() {
    return 'ChantCacheEntity(id: $id, contentId: $contentId, assetType: $assetType, storagePath: $storagePath, localFilePath: $localFilePath, cachedVersion: $cachedVersion, remoteUpdatedAtEpochMs: $remoteUpdatedAtEpochMs, remoteHash: $remoteHash, remoteBytes: $remoteBytes, isValid: $isValid, downloadState: $downloadState, failureCount: $failureCount, lastError: $lastError, lastValidatedAtEpochMs: $lastValidatedAtEpochMs, createdAtEpochMs: $createdAtEpochMs, updatedAtEpochMs: $updatedAtEpochMs)';
}


}

/// @nodoc
abstract mixin class _$ChantCacheEntityCopyWith<$Res> implements $ChantCacheEntityCopyWith<$Res> {
  factory _$ChantCacheEntityCopyWith(_ChantCacheEntity value, $Res Function(_ChantCacheEntity) _then) = __$ChantCacheEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String contentId, CachedAssetType assetType, String storagePath, String localFilePath, int cachedVersion, int remoteUpdatedAtEpochMs, String? remoteHash, int? remoteBytes, bool isValid, CacheDownloadState downloadState, int failureCount, String? lastError, int? lastValidatedAtEpochMs, int createdAtEpochMs, int updatedAtEpochMs
});




}
/// @nodoc
class __$ChantCacheEntityCopyWithImpl<$Res>
    implements _$ChantCacheEntityCopyWith<$Res> {
  __$ChantCacheEntityCopyWithImpl(this._self, this._then);

  final _ChantCacheEntity _self;
  final $Res Function(_ChantCacheEntity) _then;

/// Create a copy of ChantCacheEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? contentId = null,Object? assetType = null,Object? storagePath = null,Object? localFilePath = null,Object? cachedVersion = null,Object? remoteUpdatedAtEpochMs = null,Object? remoteHash = freezed,Object? remoteBytes = freezed,Object? isValid = null,Object? downloadState = null,Object? failureCount = null,Object? lastError = freezed,Object? lastValidatedAtEpochMs = freezed,Object? createdAtEpochMs = null,Object? updatedAtEpochMs = null,}) {
  return _then(_ChantCacheEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contentId: null == contentId ? _self.contentId : contentId // ignore: cast_nullable_to_non_nullable
as String,assetType: null == assetType ? _self.assetType : assetType // ignore: cast_nullable_to_non_nullable
as CachedAssetType,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,localFilePath: null == localFilePath ? _self.localFilePath : localFilePath // ignore: cast_nullable_to_non_nullable
as String,cachedVersion: null == cachedVersion ? _self.cachedVersion : cachedVersion // ignore: cast_nullable_to_non_nullable
as int,remoteUpdatedAtEpochMs: null == remoteUpdatedAtEpochMs ? _self.remoteUpdatedAtEpochMs : remoteUpdatedAtEpochMs // ignore: cast_nullable_to_non_nullable
as int,remoteHash: freezed == remoteHash ? _self.remoteHash : remoteHash // ignore: cast_nullable_to_non_nullable
as String?,remoteBytes: freezed == remoteBytes ? _self.remoteBytes : remoteBytes // ignore: cast_nullable_to_non_nullable
as int?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,downloadState: null == downloadState ? _self.downloadState : downloadState // ignore: cast_nullable_to_non_nullable
as CacheDownloadState,failureCount: null == failureCount ? _self.failureCount : failureCount // ignore: cast_nullable_to_non_nullable
as int,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,lastValidatedAtEpochMs: freezed == lastValidatedAtEpochMs ? _self.lastValidatedAtEpochMs : lastValidatedAtEpochMs // ignore: cast_nullable_to_non_nullable
as int?,createdAtEpochMs: null == createdAtEpochMs ? _self.createdAtEpochMs : createdAtEpochMs // ignore: cast_nullable_to_non_nullable
as int,updatedAtEpochMs: null == updatedAtEpochMs ? _self.updatedAtEpochMs : updatedAtEpochMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
