// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chanting_state_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChantingStateEntity {

 ChantingSettings get chantingSettings; CachingProgressEntity get cachingProgress; List<ChantLocalResourcesEntity> get chantResources; PlaybackState get playbackState; Duration get elapsedTime; ProcessingState get loadingState; MediaItem? get mediaItem; Duration get outputLatency; int get activeLineIndex; ProcessingState get lyricsLoadingState; LyricsDocumentEntity? get lyricsDocument; DateTime? get startTime; DateTime? get endTime; Duration get elapsedSessionTime;
/// Create a copy of ChantingStateEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantingStateEntityCopyWith<ChantingStateEntity> get copyWith => _$ChantingStateEntityCopyWithImpl<ChantingStateEntity>(this as ChantingStateEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChantingStateEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantingStateEntity&&(identical(other.chantingSettings, _this.chantingSettings) || other.chantingSettings == _this.chantingSettings)&&(identical(other.cachingProgress, _this.cachingProgress) || other.cachingProgress == _this.cachingProgress)&&const DeepCollectionEquality().equals(other.chantResources, _this.chantResources)&&(identical(other.playbackState, _this.playbackState) || other.playbackState == _this.playbackState)&&(identical(other.elapsedTime, _this.elapsedTime) || other.elapsedTime == _this.elapsedTime)&&(identical(other.loadingState, _this.loadingState) || other.loadingState == _this.loadingState)&&(identical(other.mediaItem, _this.mediaItem) || other.mediaItem == _this.mediaItem)&&(identical(other.outputLatency, _this.outputLatency) || other.outputLatency == _this.outputLatency)&&(identical(other.activeLineIndex, _this.activeLineIndex) || other.activeLineIndex == _this.activeLineIndex)&&(identical(other.lyricsLoadingState, _this.lyricsLoadingState) || other.lyricsLoadingState == _this.lyricsLoadingState)&&(identical(other.lyricsDocument, _this.lyricsDocument) || other.lyricsDocument == _this.lyricsDocument)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime)&&(identical(other.elapsedSessionTime, _this.elapsedSessionTime) || other.elapsedSessionTime == _this.elapsedSessionTime));
}


@override
int get hashCode {
  final _this = this as ChantingStateEntity;
  return Object.hash(runtimeType,_this.chantingSettings,_this.cachingProgress,const DeepCollectionEquality().hash(_this.chantResources),_this.playbackState,_this.elapsedTime,_this.loadingState,_this.mediaItem,_this.outputLatency,_this.activeLineIndex,_this.lyricsLoadingState,_this.lyricsDocument,_this.startTime,_this.endTime,_this.elapsedSessionTime);
}

@override
String toString() {
  final _this = this as ChantingStateEntity;
  return 'ChantingStateEntity(chantingSettings: ${_this.chantingSettings}, cachingProgress: ${_this.cachingProgress}, chantResources: ${_this.chantResources}, playbackState: ${_this.playbackState}, elapsedTime: ${_this.elapsedTime}, loadingState: ${_this.loadingState}, mediaItem: ${_this.mediaItem}, outputLatency: ${_this.outputLatency}, activeLineIndex: ${_this.activeLineIndex}, lyricsLoadingState: ${_this.lyricsLoadingState}, lyricsDocument: ${_this.lyricsDocument}, startTime: ${_this.startTime}, endTime: ${_this.endTime}, elapsedSessionTime: ${_this.elapsedSessionTime})';
}


}

/// @nodoc
abstract mixin class $ChantingStateEntityCopyWith<$Res>  {
  factory $ChantingStateEntityCopyWith(ChantingStateEntity value, $Res Function(ChantingStateEntity) _then) = _$ChantingStateEntityCopyWithImpl;
@useResult
$Res call({
 ChantingSettings chantingSettings, CachingProgressEntity cachingProgress, List<ChantLocalResourcesEntity> chantResources, PlaybackState playbackState, Duration elapsedTime, ProcessingState loadingState, MediaItem? mediaItem, Duration outputLatency, int activeLineIndex, ProcessingState lyricsLoadingState, LyricsDocumentEntity? lyricsDocument, DateTime? startTime, DateTime? endTime, Duration elapsedSessionTime
});


$ChantingSettingsCopyWith<$Res> get chantingSettings;$CachingProgressEntityCopyWith<$Res> get cachingProgress;$LyricsDocumentEntityCopyWith<$Res>? get lyricsDocument;

}
/// @nodoc
class _$ChantingStateEntityCopyWithImpl<$Res>
    implements $ChantingStateEntityCopyWith<$Res> {
  _$ChantingStateEntityCopyWithImpl(this._self, this._then);

  final ChantingStateEntity _self;
  final $Res Function(ChantingStateEntity) _then;

/// Create a copy of ChantingStateEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chantingSettings = null,Object? cachingProgress = null,Object? chantResources = null,Object? playbackState = null,Object? elapsedTime = null,Object? loadingState = null,Object? mediaItem = freezed,Object? outputLatency = null,Object? activeLineIndex = null,Object? lyricsLoadingState = null,Object? lyricsDocument = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? elapsedSessionTime = null,}) {
  return _then(ChantingStateEntity(
chantingSettings: null == chantingSettings ? _self.chantingSettings : chantingSettings // ignore: cast_nullable_to_non_nullable
as ChantingSettings,cachingProgress: null == cachingProgress ? _self.cachingProgress : cachingProgress // ignore: cast_nullable_to_non_nullable
as CachingProgressEntity,chantResources: null == chantResources ? _self.chantResources : chantResources // ignore: cast_nullable_to_non_nullable
as List<ChantLocalResourcesEntity>,playbackState: null == playbackState ? _self.playbackState : playbackState // ignore: cast_nullable_to_non_nullable
as PlaybackState,elapsedTime: null == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as Duration,loadingState: null == loadingState ? _self.loadingState : loadingState // ignore: cast_nullable_to_non_nullable
as ProcessingState,mediaItem: freezed == mediaItem ? _self.mediaItem : mediaItem // ignore: cast_nullable_to_non_nullable
as MediaItem?,outputLatency: null == outputLatency ? _self.outputLatency : outputLatency // ignore: cast_nullable_to_non_nullable
as Duration,activeLineIndex: null == activeLineIndex ? _self.activeLineIndex : activeLineIndex // ignore: cast_nullable_to_non_nullable
as int,lyricsLoadingState: null == lyricsLoadingState ? _self.lyricsLoadingState : lyricsLoadingState // ignore: cast_nullable_to_non_nullable
as ProcessingState,lyricsDocument: freezed == lyricsDocument ? _self.lyricsDocument : lyricsDocument // ignore: cast_nullable_to_non_nullable
as LyricsDocumentEntity?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,elapsedSessionTime: null == elapsedSessionTime ? _self.elapsedSessionTime : elapsedSessionTime // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}
/// Create a copy of ChantingStateEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantingSettingsCopyWith<$Res> get chantingSettings {
  
  return $ChantingSettingsCopyWith<$Res>(_self.chantingSettings, (value) {
    return _then(_self.copyWith(chantingSettings: value));
  });
}/// Create a copy of ChantingStateEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CachingProgressEntityCopyWith<$Res> get cachingProgress {
  
  return $CachingProgressEntityCopyWith<$Res>(_self.cachingProgress, (value) {
    return _then(_self.copyWith(cachingProgress: value));
  });
}/// Create a copy of ChantingStateEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LyricsDocumentEntityCopyWith<$Res>? get lyricsDocument {
    if (_self.lyricsDocument == null) {
    return null;
  }

  return $LyricsDocumentEntityCopyWith<$Res>(_self.lyricsDocument!, (value) {
    return _then(_self.copyWith(lyricsDocument: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChantingStateEntity].
extension ChantingStateEntityPatterns on ChantingStateEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantingStateEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantingStateEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantingStateEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChantingStateEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantingStateEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChantingStateEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChantingSettings chantingSettings,  CachingProgressEntity cachingProgress,  List<ChantLocalResourcesEntity> chantResources,  PlaybackState playbackState,  Duration elapsedTime,  ProcessingState loadingState,  MediaItem? mediaItem,  Duration outputLatency,  int activeLineIndex,  ProcessingState lyricsLoadingState,  LyricsDocumentEntity? lyricsDocument,  DateTime? startTime,  DateTime? endTime,  Duration elapsedSessionTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChantingStateEntity() when $default != null:
return $default(_that.chantingSettings,_that.cachingProgress,_that.chantResources,_that.playbackState,_that.elapsedTime,_that.loadingState,_that.mediaItem,_that.outputLatency,_that.activeLineIndex,_that.lyricsLoadingState,_that.lyricsDocument,_that.startTime,_that.endTime,_that.elapsedSessionTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChantingSettings chantingSettings,  CachingProgressEntity cachingProgress,  List<ChantLocalResourcesEntity> chantResources,  PlaybackState playbackState,  Duration elapsedTime,  ProcessingState loadingState,  MediaItem? mediaItem,  Duration outputLatency,  int activeLineIndex,  ProcessingState lyricsLoadingState,  LyricsDocumentEntity? lyricsDocument,  DateTime? startTime,  DateTime? endTime,  Duration elapsedSessionTime)  $default,) {final _that = this;
switch (_that) {
case _ChantingStateEntity():
return $default(_that.chantingSettings,_that.cachingProgress,_that.chantResources,_that.playbackState,_that.elapsedTime,_that.loadingState,_that.mediaItem,_that.outputLatency,_that.activeLineIndex,_that.lyricsLoadingState,_that.lyricsDocument,_that.startTime,_that.endTime,_that.elapsedSessionTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChantingSettings chantingSettings,  CachingProgressEntity cachingProgress,  List<ChantLocalResourcesEntity> chantResources,  PlaybackState playbackState,  Duration elapsedTime,  ProcessingState loadingState,  MediaItem? mediaItem,  Duration outputLatency,  int activeLineIndex,  ProcessingState lyricsLoadingState,  LyricsDocumentEntity? lyricsDocument,  DateTime? startTime,  DateTime? endTime,  Duration elapsedSessionTime)?  $default,) {final _that = this;
switch (_that) {
case _ChantingStateEntity() when $default != null:
return $default(_that.chantingSettings,_that.cachingProgress,_that.chantResources,_that.playbackState,_that.elapsedTime,_that.loadingState,_that.mediaItem,_that.outputLatency,_that.activeLineIndex,_that.lyricsLoadingState,_that.lyricsDocument,_that.startTime,_that.endTime,_that.elapsedSessionTime);case _:
  return null;

}
}

}

/// @nodoc


class _ChantingStateEntity extends ChantingStateEntity {
  const _ChantingStateEntity({required this.chantingSettings, this.cachingProgress = const CachingProgressEntity(),  List<ChantLocalResourcesEntity> chantResources = const [], required this.playbackState, this.elapsedTime = Duration.zero, this.loadingState = ProcessingState.processing, this.mediaItem, this.outputLatency = Duration.zero, this.activeLineIndex = 0, this.lyricsLoadingState = ProcessingState.processing, this.lyricsDocument, this.startTime, this.endTime, this.elapsedSessionTime = Duration.zero}): _chantResources = chantResources,super._();
  

@override final  ChantingSettings chantingSettings;
@override@JsonKey() final  CachingProgressEntity cachingProgress;
 final  List<ChantLocalResourcesEntity> _chantResources;
@override@JsonKey() List<ChantLocalResourcesEntity> get chantResources {
  if (_chantResources is EqualUnmodifiableListView) return _chantResources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chantResources);
}

@override final  PlaybackState playbackState;
@override@JsonKey() final  Duration elapsedTime;
@override@JsonKey() final  ProcessingState loadingState;
@override final  MediaItem? mediaItem;
@override@JsonKey() final  Duration outputLatency;
@override@JsonKey() final  int activeLineIndex;
@override@JsonKey() final  ProcessingState lyricsLoadingState;
@override final  LyricsDocumentEntity? lyricsDocument;
@override final  DateTime? startTime;
@override final  DateTime? endTime;
@override@JsonKey() final  Duration elapsedSessionTime;

/// Create a copy of ChantingStateEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantingStateEntityCopyWith<_ChantingStateEntity> get copyWith => __$ChantingStateEntityCopyWithImpl<_ChantingStateEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantingStateEntity&&(identical(other.chantingSettings, chantingSettings) || other.chantingSettings == chantingSettings)&&(identical(other.cachingProgress, cachingProgress) || other.cachingProgress == cachingProgress)&&const DeepCollectionEquality().equals(other.chantResources, _chantResources)&&(identical(other.playbackState, playbackState) || other.playbackState == playbackState)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.loadingState, loadingState) || other.loadingState == loadingState)&&(identical(other.mediaItem, mediaItem) || other.mediaItem == mediaItem)&&(identical(other.outputLatency, outputLatency) || other.outputLatency == outputLatency)&&(identical(other.activeLineIndex, activeLineIndex) || other.activeLineIndex == activeLineIndex)&&(identical(other.lyricsLoadingState, lyricsLoadingState) || other.lyricsLoadingState == lyricsLoadingState)&&(identical(other.lyricsDocument, lyricsDocument) || other.lyricsDocument == lyricsDocument)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.elapsedSessionTime, elapsedSessionTime) || other.elapsedSessionTime == elapsedSessionTime));
}


@override
int get hashCode {
    return Object.hash(runtimeType,chantingSettings,cachingProgress,const DeepCollectionEquality().hash(_chantResources),playbackState,elapsedTime,loadingState,mediaItem,outputLatency,activeLineIndex,lyricsLoadingState,lyricsDocument,startTime,endTime,elapsedSessionTime);
}

@override
String toString() {
    return 'ChantingStateEntity(chantingSettings: $chantingSettings, cachingProgress: $cachingProgress, chantResources: $chantResources, playbackState: $playbackState, elapsedTime: $elapsedTime, loadingState: $loadingState, mediaItem: $mediaItem, outputLatency: $outputLatency, activeLineIndex: $activeLineIndex, lyricsLoadingState: $lyricsLoadingState, lyricsDocument: $lyricsDocument, startTime: $startTime, endTime: $endTime, elapsedSessionTime: $elapsedSessionTime)';
}


}

/// @nodoc
abstract mixin class _$ChantingStateEntityCopyWith<$Res> implements $ChantingStateEntityCopyWith<$Res> {
  factory _$ChantingStateEntityCopyWith(_ChantingStateEntity value, $Res Function(_ChantingStateEntity) _then) = __$ChantingStateEntityCopyWithImpl;
@override @useResult
$Res call({
 ChantingSettings chantingSettings, CachingProgressEntity cachingProgress, List<ChantLocalResourcesEntity> chantResources, PlaybackState playbackState, Duration elapsedTime, ProcessingState loadingState, MediaItem? mediaItem, Duration outputLatency, int activeLineIndex, ProcessingState lyricsLoadingState, LyricsDocumentEntity? lyricsDocument, DateTime? startTime, DateTime? endTime, Duration elapsedSessionTime
});


@override $ChantingSettingsCopyWith<$Res> get chantingSettings;@override $CachingProgressEntityCopyWith<$Res> get cachingProgress;@override $LyricsDocumentEntityCopyWith<$Res>? get lyricsDocument;

}
/// @nodoc
class __$ChantingStateEntityCopyWithImpl<$Res>
    implements _$ChantingStateEntityCopyWith<$Res> {
  __$ChantingStateEntityCopyWithImpl(this._self, this._then);

  final _ChantingStateEntity _self;
  final $Res Function(_ChantingStateEntity) _then;

/// Create a copy of ChantingStateEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chantingSettings = null,Object? cachingProgress = null,Object? chantResources = null,Object? playbackState = null,Object? elapsedTime = null,Object? loadingState = null,Object? mediaItem = freezed,Object? outputLatency = null,Object? activeLineIndex = null,Object? lyricsLoadingState = null,Object? lyricsDocument = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? elapsedSessionTime = null,}) {
  return _then(_ChantingStateEntity(
chantingSettings: null == chantingSettings ? _self.chantingSettings : chantingSettings // ignore: cast_nullable_to_non_nullable
as ChantingSettings,cachingProgress: null == cachingProgress ? _self.cachingProgress : cachingProgress // ignore: cast_nullable_to_non_nullable
as CachingProgressEntity,chantResources: null == chantResources ? _self._chantResources : chantResources // ignore: cast_nullable_to_non_nullable
as List<ChantLocalResourcesEntity>,playbackState: null == playbackState ? _self.playbackState : playbackState // ignore: cast_nullable_to_non_nullable
as PlaybackState,elapsedTime: null == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as Duration,loadingState: null == loadingState ? _self.loadingState : loadingState // ignore: cast_nullable_to_non_nullable
as ProcessingState,mediaItem: freezed == mediaItem ? _self.mediaItem : mediaItem // ignore: cast_nullable_to_non_nullable
as MediaItem?,outputLatency: null == outputLatency ? _self.outputLatency : outputLatency // ignore: cast_nullable_to_non_nullable
as Duration,activeLineIndex: null == activeLineIndex ? _self.activeLineIndex : activeLineIndex // ignore: cast_nullable_to_non_nullable
as int,lyricsLoadingState: null == lyricsLoadingState ? _self.lyricsLoadingState : lyricsLoadingState // ignore: cast_nullable_to_non_nullable
as ProcessingState,lyricsDocument: freezed == lyricsDocument ? _self.lyricsDocument : lyricsDocument // ignore: cast_nullable_to_non_nullable
as LyricsDocumentEntity?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,elapsedSessionTime: null == elapsedSessionTime ? _self.elapsedSessionTime : elapsedSessionTime // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

/// Create a copy of ChantingStateEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantingSettingsCopyWith<$Res> get chantingSettings {
  
  return $ChantingSettingsCopyWith<$Res>(_self.chantingSettings, (value) {
    return _then(_self.copyWith(chantingSettings: value));
  });
}/// Create a copy of ChantingStateEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CachingProgressEntityCopyWith<$Res> get cachingProgress {
  
  return $CachingProgressEntityCopyWith<$Res>(_self.cachingProgress, (value) {
    return _then(_self.copyWith(cachingProgress: value));
  });
}/// Create a copy of ChantingStateEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LyricsDocumentEntityCopyWith<$Res>? get lyricsDocument {
    if (_self.lyricsDocument == null) {
    return null;
  }

  return $LyricsDocumentEntityCopyWith<$Res>(_self.lyricsDocument!, (value) {
    return _then(_self.copyWith(lyricsDocument: value));
  });
}
}

// dart format on
