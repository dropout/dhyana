// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cache_validation_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CacheValidationResultEntity {

 ChantEntity get chant; bool get isAudioCacheValid; bool get isLyricsCacheValid; String? get audioCachePath; String? get lyricsCachePath; ChantCacheEntity? get audioCacheEntry; ChantCacheEntity? get lyricsCacheEntry;
/// Create a copy of CacheValidationResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheValidationResultEntityCopyWith<CacheValidationResultEntity> get copyWith => _$CacheValidationResultEntityCopyWithImpl<CacheValidationResultEntity>(this as CacheValidationResultEntity, _$identity);

  /// Serializes this CacheValidationResultEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CacheValidationResultEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheValidationResultEntity&&(identical(other.chant, _this.chant) || other.chant == _this.chant)&&(identical(other.isAudioCacheValid, _this.isAudioCacheValid) || other.isAudioCacheValid == _this.isAudioCacheValid)&&(identical(other.isLyricsCacheValid, _this.isLyricsCacheValid) || other.isLyricsCacheValid == _this.isLyricsCacheValid)&&(identical(other.audioCachePath, _this.audioCachePath) || other.audioCachePath == _this.audioCachePath)&&(identical(other.lyricsCachePath, _this.lyricsCachePath) || other.lyricsCachePath == _this.lyricsCachePath)&&(identical(other.audioCacheEntry, _this.audioCacheEntry) || other.audioCacheEntry == _this.audioCacheEntry)&&(identical(other.lyricsCacheEntry, _this.lyricsCacheEntry) || other.lyricsCacheEntry == _this.lyricsCacheEntry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CacheValidationResultEntity;
  return Object.hash(runtimeType,_this.chant,_this.isAudioCacheValid,_this.isLyricsCacheValid,_this.audioCachePath,_this.lyricsCachePath,_this.audioCacheEntry,_this.lyricsCacheEntry);
}

@override
String toString() {
  final _this = this as CacheValidationResultEntity;
  return 'CacheValidationResultEntity(chant: ${_this.chant}, isAudioCacheValid: ${_this.isAudioCacheValid}, isLyricsCacheValid: ${_this.isLyricsCacheValid}, audioCachePath: ${_this.audioCachePath}, lyricsCachePath: ${_this.lyricsCachePath}, audioCacheEntry: ${_this.audioCacheEntry}, lyricsCacheEntry: ${_this.lyricsCacheEntry})';
}


}

/// @nodoc
abstract mixin class $CacheValidationResultEntityCopyWith<$Res>  {
  factory $CacheValidationResultEntityCopyWith(CacheValidationResultEntity value, $Res Function(CacheValidationResultEntity) _then) = _$CacheValidationResultEntityCopyWithImpl;
@useResult
$Res call({
 ChantEntity chant, bool isAudioCacheValid, bool isLyricsCacheValid, String? audioCachePath, String? lyricsCachePath, ChantCacheEntity? audioCacheEntry, ChantCacheEntity? lyricsCacheEntry
});


$ChantEntityCopyWith<$Res> get chant;$ChantCacheEntityCopyWith<$Res>? get audioCacheEntry;$ChantCacheEntityCopyWith<$Res>? get lyricsCacheEntry;

}
/// @nodoc
class _$CacheValidationResultEntityCopyWithImpl<$Res>
    implements $CacheValidationResultEntityCopyWith<$Res> {
  _$CacheValidationResultEntityCopyWithImpl(this._self, this._then);

  final CacheValidationResultEntity _self;
  final $Res Function(CacheValidationResultEntity) _then;

/// Create a copy of CacheValidationResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chant = null,Object? isAudioCacheValid = null,Object? isLyricsCacheValid = null,Object? audioCachePath = freezed,Object? lyricsCachePath = freezed,Object? audioCacheEntry = freezed,Object? lyricsCacheEntry = freezed,}) {
  return _then(CacheValidationResultEntity(
chant: null == chant ? _self.chant : chant // ignore: cast_nullable_to_non_nullable
as ChantEntity,isAudioCacheValid: null == isAudioCacheValid ? _self.isAudioCacheValid : isAudioCacheValid // ignore: cast_nullable_to_non_nullable
as bool,isLyricsCacheValid: null == isLyricsCacheValid ? _self.isLyricsCacheValid : isLyricsCacheValid // ignore: cast_nullable_to_non_nullable
as bool,audioCachePath: freezed == audioCachePath ? _self.audioCachePath : audioCachePath // ignore: cast_nullable_to_non_nullable
as String?,lyricsCachePath: freezed == lyricsCachePath ? _self.lyricsCachePath : lyricsCachePath // ignore: cast_nullable_to_non_nullable
as String?,audioCacheEntry: freezed == audioCacheEntry ? _self.audioCacheEntry : audioCacheEntry // ignore: cast_nullable_to_non_nullable
as ChantCacheEntity?,lyricsCacheEntry: freezed == lyricsCacheEntry ? _self.lyricsCacheEntry : lyricsCacheEntry // ignore: cast_nullable_to_non_nullable
as ChantCacheEntity?,
  ));
}
/// Create a copy of CacheValidationResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantEntityCopyWith<$Res> get chant {
  
  return $ChantEntityCopyWith<$Res>(_self.chant, (value) {
    return _then(_self.copyWith(chant: value));
  });
}/// Create a copy of CacheValidationResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantCacheEntityCopyWith<$Res>? get audioCacheEntry {
    if (_self.audioCacheEntry == null) {
    return null;
  }

  return $ChantCacheEntityCopyWith<$Res>(_self.audioCacheEntry!, (value) {
    return _then(_self.copyWith(audioCacheEntry: value));
  });
}/// Create a copy of CacheValidationResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantCacheEntityCopyWith<$Res>? get lyricsCacheEntry {
    if (_self.lyricsCacheEntry == null) {
    return null;
  }

  return $ChantCacheEntityCopyWith<$Res>(_self.lyricsCacheEntry!, (value) {
    return _then(_self.copyWith(lyricsCacheEntry: value));
  });
}
}


/// Adds pattern-matching-related methods to [CacheValidationResultEntity].
extension CacheValidationResultEntityPatterns on CacheValidationResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CacheValidationResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CacheValidationResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CacheValidationResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _CacheValidationResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CacheValidationResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CacheValidationResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChantEntity chant,  bool isAudioCacheValid,  bool isLyricsCacheValid,  String? audioCachePath,  String? lyricsCachePath,  ChantCacheEntity? audioCacheEntry,  ChantCacheEntity? lyricsCacheEntry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CacheValidationResultEntity() when $default != null:
return $default(_that.chant,_that.isAudioCacheValid,_that.isLyricsCacheValid,_that.audioCachePath,_that.lyricsCachePath,_that.audioCacheEntry,_that.lyricsCacheEntry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChantEntity chant,  bool isAudioCacheValid,  bool isLyricsCacheValid,  String? audioCachePath,  String? lyricsCachePath,  ChantCacheEntity? audioCacheEntry,  ChantCacheEntity? lyricsCacheEntry)  $default,) {final _that = this;
switch (_that) {
case _CacheValidationResultEntity():
return $default(_that.chant,_that.isAudioCacheValid,_that.isLyricsCacheValid,_that.audioCachePath,_that.lyricsCachePath,_that.audioCacheEntry,_that.lyricsCacheEntry);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChantEntity chant,  bool isAudioCacheValid,  bool isLyricsCacheValid,  String? audioCachePath,  String? lyricsCachePath,  ChantCacheEntity? audioCacheEntry,  ChantCacheEntity? lyricsCacheEntry)?  $default,) {final _that = this;
switch (_that) {
case _CacheValidationResultEntity() when $default != null:
return $default(_that.chant,_that.isAudioCacheValid,_that.isLyricsCacheValid,_that.audioCachePath,_that.lyricsCachePath,_that.audioCacheEntry,_that.lyricsCacheEntry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CacheValidationResultEntity extends CacheValidationResultEntity {
  const _CacheValidationResultEntity({required this.chant, required this.isAudioCacheValid, required this.isLyricsCacheValid, this.audioCachePath, this.lyricsCachePath, this.audioCacheEntry, this.lyricsCacheEntry}): super._();
  factory _CacheValidationResultEntity.fromJson(Map<String, dynamic> json) => _$CacheValidationResultEntityFromJson(json);

@override final  ChantEntity chant;
@override final  bool isAudioCacheValid;
@override final  bool isLyricsCacheValid;
@override final  String? audioCachePath;
@override final  String? lyricsCachePath;
@override final  ChantCacheEntity? audioCacheEntry;
@override final  ChantCacheEntity? lyricsCacheEntry;

/// Create a copy of CacheValidationResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CacheValidationResultEntityCopyWith<_CacheValidationResultEntity> get copyWith => __$CacheValidationResultEntityCopyWithImpl<_CacheValidationResultEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CacheValidationResultEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CacheValidationResultEntity&&(identical(other.chant, chant) || other.chant == chant)&&(identical(other.isAudioCacheValid, isAudioCacheValid) || other.isAudioCacheValid == isAudioCacheValid)&&(identical(other.isLyricsCacheValid, isLyricsCacheValid) || other.isLyricsCacheValid == isLyricsCacheValid)&&(identical(other.audioCachePath, audioCachePath) || other.audioCachePath == audioCachePath)&&(identical(other.lyricsCachePath, lyricsCachePath) || other.lyricsCachePath == lyricsCachePath)&&(identical(other.audioCacheEntry, audioCacheEntry) || other.audioCacheEntry == audioCacheEntry)&&(identical(other.lyricsCacheEntry, lyricsCacheEntry) || other.lyricsCacheEntry == lyricsCacheEntry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,chant,isAudioCacheValid,isLyricsCacheValid,audioCachePath,lyricsCachePath,audioCacheEntry,lyricsCacheEntry);
}

@override
String toString() {
    return 'CacheValidationResultEntity(chant: $chant, isAudioCacheValid: $isAudioCacheValid, isLyricsCacheValid: $isLyricsCacheValid, audioCachePath: $audioCachePath, lyricsCachePath: $lyricsCachePath, audioCacheEntry: $audioCacheEntry, lyricsCacheEntry: $lyricsCacheEntry)';
}


}

/// @nodoc
abstract mixin class _$CacheValidationResultEntityCopyWith<$Res> implements $CacheValidationResultEntityCopyWith<$Res> {
  factory _$CacheValidationResultEntityCopyWith(_CacheValidationResultEntity value, $Res Function(_CacheValidationResultEntity) _then) = __$CacheValidationResultEntityCopyWithImpl;
@override @useResult
$Res call({
 ChantEntity chant, bool isAudioCacheValid, bool isLyricsCacheValid, String? audioCachePath, String? lyricsCachePath, ChantCacheEntity? audioCacheEntry, ChantCacheEntity? lyricsCacheEntry
});


@override $ChantEntityCopyWith<$Res> get chant;@override $ChantCacheEntityCopyWith<$Res>? get audioCacheEntry;@override $ChantCacheEntityCopyWith<$Res>? get lyricsCacheEntry;

}
/// @nodoc
class __$CacheValidationResultEntityCopyWithImpl<$Res>
    implements _$CacheValidationResultEntityCopyWith<$Res> {
  __$CacheValidationResultEntityCopyWithImpl(this._self, this._then);

  final _CacheValidationResultEntity _self;
  final $Res Function(_CacheValidationResultEntity) _then;

/// Create a copy of CacheValidationResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chant = null,Object? isAudioCacheValid = null,Object? isLyricsCacheValid = null,Object? audioCachePath = freezed,Object? lyricsCachePath = freezed,Object? audioCacheEntry = freezed,Object? lyricsCacheEntry = freezed,}) {
  return _then(_CacheValidationResultEntity(
chant: null == chant ? _self.chant : chant // ignore: cast_nullable_to_non_nullable
as ChantEntity,isAudioCacheValid: null == isAudioCacheValid ? _self.isAudioCacheValid : isAudioCacheValid // ignore: cast_nullable_to_non_nullable
as bool,isLyricsCacheValid: null == isLyricsCacheValid ? _self.isLyricsCacheValid : isLyricsCacheValid // ignore: cast_nullable_to_non_nullable
as bool,audioCachePath: freezed == audioCachePath ? _self.audioCachePath : audioCachePath // ignore: cast_nullable_to_non_nullable
as String?,lyricsCachePath: freezed == lyricsCachePath ? _self.lyricsCachePath : lyricsCachePath // ignore: cast_nullable_to_non_nullable
as String?,audioCacheEntry: freezed == audioCacheEntry ? _self.audioCacheEntry : audioCacheEntry // ignore: cast_nullable_to_non_nullable
as ChantCacheEntity?,lyricsCacheEntry: freezed == lyricsCacheEntry ? _self.lyricsCacheEntry : lyricsCacheEntry // ignore: cast_nullable_to_non_nullable
as ChantCacheEntity?,
  ));
}

/// Create a copy of CacheValidationResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantEntityCopyWith<$Res> get chant {
  
  return $ChantEntityCopyWith<$Res>(_self.chant, (value) {
    return _then(_self.copyWith(chant: value));
  });
}/// Create a copy of CacheValidationResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantCacheEntityCopyWith<$Res>? get audioCacheEntry {
    if (_self.audioCacheEntry == null) {
    return null;
  }

  return $ChantCacheEntityCopyWith<$Res>(_self.audioCacheEntry!, (value) {
    return _then(_self.copyWith(audioCacheEntry: value));
  });
}/// Create a copy of CacheValidationResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantCacheEntityCopyWith<$Res>? get lyricsCacheEntry {
    if (_self.lyricsCacheEntry == null) {
    return null;
  }

  return $ChantCacheEntityCopyWith<$Res>(_self.lyricsCacheEntry!, (value) {
    return _then(_self.copyWith(lyricsCacheEntry: value));
  });
}
}

// dart format on
