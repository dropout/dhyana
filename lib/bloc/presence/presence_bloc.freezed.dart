// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PresenceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)
        load,
    required TResult Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)
        loadMore,
    required TResult Function(String profileId) showPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)?
        load,
    TResult? Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)?
        loadMore,
    TResult? Function(String profileId)? showPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)?
        load,
    TResult Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)?
        loadMore,
    TResult Function(String profileId)? showPresence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPresenceData value) load,
    required TResult Function(LoadMorePresenceData value) loadMore,
    required TResult Function(ShowPresence value) showPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPresenceData value)? load,
    TResult? Function(LoadMorePresenceData value)? loadMore,
    TResult? Function(ShowPresence value)? showPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPresenceData value)? load,
    TResult Function(LoadMorePresenceData value)? loadMore,
    TResult Function(ShowPresence value)? showPresence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceEventCopyWith<$Res> {
  factory $PresenceEventCopyWith(
          PresenceEvent value, $Res Function(PresenceEvent) then) =
      _$PresenceEventCopyWithImpl<$Res, PresenceEvent>;
}

/// @nodoc
class _$PresenceEventCopyWithImpl<$Res, $Val extends PresenceEvent>
    implements $PresenceEventCopyWith<$Res> {
  _$PresenceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadPresenceDataImplCopyWith<$Res> {
  factory _$$LoadPresenceDataImplCopyWith(_$LoadPresenceDataImpl value,
          $Res Function(_$LoadPresenceDataImpl) then) =
      __$$LoadPresenceDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? ownProfileId, int intervalInMinutes, int batchSize});
}

/// @nodoc
class __$$LoadPresenceDataImplCopyWithImpl<$Res>
    extends _$PresenceEventCopyWithImpl<$Res, _$LoadPresenceDataImpl>
    implements _$$LoadPresenceDataImplCopyWith<$Res> {
  __$$LoadPresenceDataImplCopyWithImpl(_$LoadPresenceDataImpl _value,
      $Res Function(_$LoadPresenceDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownProfileId = freezed,
    Object? intervalInMinutes = null,
    Object? batchSize = null,
  }) {
    return _then(_$LoadPresenceDataImpl(
      ownProfileId: freezed == ownProfileId
          ? _value.ownProfileId
          : ownProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      intervalInMinutes: null == intervalInMinutes
          ? _value.intervalInMinutes
          : intervalInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadPresenceDataImpl extends LoadPresenceData {
  const _$LoadPresenceDataImpl(
      {this.ownProfileId, this.intervalInMinutes = 60, this.batchSize = 18})
      : super._();

  @override
  final String? ownProfileId;
  @override
  @JsonKey()
  final int intervalInMinutes;
  @override
  @JsonKey()
  final int batchSize;

  @override
  String toString() {
    return 'PresenceEvent.load(ownProfileId: $ownProfileId, intervalInMinutes: $intervalInMinutes, batchSize: $batchSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPresenceDataImpl &&
            (identical(other.ownProfileId, ownProfileId) ||
                other.ownProfileId == ownProfileId) &&
            (identical(other.intervalInMinutes, intervalInMinutes) ||
                other.intervalInMinutes == intervalInMinutes) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ownProfileId, intervalInMinutes, batchSize);

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPresenceDataImplCopyWith<_$LoadPresenceDataImpl> get copyWith =>
      __$$LoadPresenceDataImplCopyWithImpl<_$LoadPresenceDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)
        load,
    required TResult Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)
        loadMore,
    required TResult Function(String profileId) showPresence,
  }) {
    return load(ownProfileId, intervalInMinutes, batchSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)?
        load,
    TResult? Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)?
        loadMore,
    TResult? Function(String profileId)? showPresence,
  }) {
    return load?.call(ownProfileId, intervalInMinutes, batchSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)?
        load,
    TResult Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)?
        loadMore,
    TResult Function(String profileId)? showPresence,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(ownProfileId, intervalInMinutes, batchSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPresenceData value) load,
    required TResult Function(LoadMorePresenceData value) loadMore,
    required TResult Function(ShowPresence value) showPresence,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPresenceData value)? load,
    TResult? Function(LoadMorePresenceData value)? loadMore,
    TResult? Function(ShowPresence value)? showPresence,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPresenceData value)? load,
    TResult Function(LoadMorePresenceData value)? loadMore,
    TResult Function(ShowPresence value)? showPresence,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadPresenceData extends PresenceEvent {
  const factory LoadPresenceData(
      {final String? ownProfileId,
      final int intervalInMinutes,
      final int batchSize}) = _$LoadPresenceDataImpl;
  const LoadPresenceData._() : super._();

  String? get ownProfileId;
  int get intervalInMinutes;
  int get batchSize;

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadPresenceDataImplCopyWith<_$LoadPresenceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMorePresenceDataImplCopyWith<$Res> {
  factory _$$LoadMorePresenceDataImplCopyWith(_$LoadMorePresenceDataImpl value,
          $Res Function(_$LoadMorePresenceDataImpl) then) =
      __$$LoadMorePresenceDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String lastDocumentId, int intervalInMinutes, int batchSize});
}

/// @nodoc
class __$$LoadMorePresenceDataImplCopyWithImpl<$Res>
    extends _$PresenceEventCopyWithImpl<$Res, _$LoadMorePresenceDataImpl>
    implements _$$LoadMorePresenceDataImplCopyWith<$Res> {
  __$$LoadMorePresenceDataImplCopyWithImpl(_$LoadMorePresenceDataImpl _value,
      $Res Function(_$LoadMorePresenceDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastDocumentId = null,
    Object? intervalInMinutes = null,
    Object? batchSize = null,
  }) {
    return _then(_$LoadMorePresenceDataImpl(
      lastDocumentId: null == lastDocumentId
          ? _value.lastDocumentId
          : lastDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      intervalInMinutes: null == intervalInMinutes
          ? _value.intervalInMinutes
          : intervalInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadMorePresenceDataImpl extends LoadMorePresenceData {
  const _$LoadMorePresenceDataImpl(
      {required this.lastDocumentId,
      this.intervalInMinutes = 60,
      this.batchSize = 18})
      : super._();

  @override
  final String lastDocumentId;
  @override
  @JsonKey()
  final int intervalInMinutes;
  @override
  @JsonKey()
  final int batchSize;

  @override
  String toString() {
    return 'PresenceEvent.loadMore(lastDocumentId: $lastDocumentId, intervalInMinutes: $intervalInMinutes, batchSize: $batchSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMorePresenceDataImpl &&
            (identical(other.lastDocumentId, lastDocumentId) ||
                other.lastDocumentId == lastDocumentId) &&
            (identical(other.intervalInMinutes, intervalInMinutes) ||
                other.intervalInMinutes == intervalInMinutes) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, lastDocumentId, intervalInMinutes, batchSize);

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMorePresenceDataImplCopyWith<_$LoadMorePresenceDataImpl>
      get copyWith =>
          __$$LoadMorePresenceDataImplCopyWithImpl<_$LoadMorePresenceDataImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)
        load,
    required TResult Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)
        loadMore,
    required TResult Function(String profileId) showPresence,
  }) {
    return loadMore(lastDocumentId, intervalInMinutes, batchSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)?
        load,
    TResult? Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)?
        loadMore,
    TResult? Function(String profileId)? showPresence,
  }) {
    return loadMore?.call(lastDocumentId, intervalInMinutes, batchSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)?
        load,
    TResult Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)?
        loadMore,
    TResult Function(String profileId)? showPresence,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(lastDocumentId, intervalInMinutes, batchSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPresenceData value) load,
    required TResult Function(LoadMorePresenceData value) loadMore,
    required TResult Function(ShowPresence value) showPresence,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPresenceData value)? load,
    TResult? Function(LoadMorePresenceData value)? loadMore,
    TResult? Function(ShowPresence value)? showPresence,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPresenceData value)? load,
    TResult Function(LoadMorePresenceData value)? loadMore,
    TResult Function(ShowPresence value)? showPresence,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class LoadMorePresenceData extends PresenceEvent {
  const factory LoadMorePresenceData(
      {required final String lastDocumentId,
      final int intervalInMinutes,
      final int batchSize}) = _$LoadMorePresenceDataImpl;
  const LoadMorePresenceData._() : super._();

  String get lastDocumentId;
  int get intervalInMinutes;
  int get batchSize;

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMorePresenceDataImplCopyWith<_$LoadMorePresenceDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowPresenceImplCopyWith<$Res> {
  factory _$$ShowPresenceImplCopyWith(
          _$ShowPresenceImpl value, $Res Function(_$ShowPresenceImpl) then) =
      __$$ShowPresenceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String profileId});
}

/// @nodoc
class __$$ShowPresenceImplCopyWithImpl<$Res>
    extends _$PresenceEventCopyWithImpl<$Res, _$ShowPresenceImpl>
    implements _$$ShowPresenceImplCopyWith<$Res> {
  __$$ShowPresenceImplCopyWithImpl(
      _$ShowPresenceImpl _value, $Res Function(_$ShowPresenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
  }) {
    return _then(_$ShowPresenceImpl(
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowPresenceImpl extends ShowPresence {
  const _$ShowPresenceImpl({required this.profileId}) : super._();

  @override
  final String profileId;

  @override
  String toString() {
    return 'PresenceEvent.showPresence(profileId: $profileId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowPresenceImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId);

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowPresenceImplCopyWith<_$ShowPresenceImpl> get copyWith =>
      __$$ShowPresenceImplCopyWithImpl<_$ShowPresenceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)
        load,
    required TResult Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)
        loadMore,
    required TResult Function(String profileId) showPresence,
  }) {
    return showPresence(profileId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)?
        load,
    TResult? Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)?
        loadMore,
    TResult? Function(String profileId)? showPresence,
  }) {
    return showPresence?.call(profileId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? ownProfileId, int intervalInMinutes, int batchSize)?
        load,
    TResult Function(
            String lastDocumentId, int intervalInMinutes, int batchSize)?
        loadMore,
    TResult Function(String profileId)? showPresence,
    required TResult orElse(),
  }) {
    if (showPresence != null) {
      return showPresence(profileId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPresenceData value) load,
    required TResult Function(LoadMorePresenceData value) loadMore,
    required TResult Function(ShowPresence value) showPresence,
  }) {
    return showPresence(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPresenceData value)? load,
    TResult? Function(LoadMorePresenceData value)? loadMore,
    TResult? Function(ShowPresence value)? showPresence,
  }) {
    return showPresence?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPresenceData value)? load,
    TResult Function(LoadMorePresenceData value)? loadMore,
    TResult Function(ShowPresence value)? showPresence,
    required TResult orElse(),
  }) {
    if (showPresence != null) {
      return showPresence(this);
    }
    return orElse();
  }
}

abstract class ShowPresence extends PresenceEvent {
  const factory ShowPresence({required final String profileId}) =
      _$ShowPresenceImpl;
  const ShowPresence._() : super._();

  String get profileId;

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowPresenceImplCopyWith<_$ShowPresenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PresenceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loadingMore,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loadingMore,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loadingMore,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadingMoreState value) loadingMore,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadingMoreState value)? loadingMore,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadingMoreState value)? loadingMore,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceStateCopyWith<$Res> {
  factory $PresenceStateCopyWith(
          PresenceState value, $Res Function(PresenceState) then) =
      _$PresenceStateCopyWithImpl<$Res, PresenceState>;
}

/// @nodoc
class _$PresenceStateCopyWithImpl<$Res, $Val extends PresenceState>
    implements $PresenceStateCopyWith<$Res> {
  _$PresenceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PresenceStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'PresenceState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loadingMore,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loadingMore,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loadingMore,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadingMoreState value) loadingMore,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadingMoreState value)? loadingMore,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadingMoreState value)? loadingMore,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends PresenceState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$PresenceLoadingStateImplCopyWith<$Res> {
  factory _$$PresenceLoadingStateImplCopyWith(_$PresenceLoadingStateImpl value,
          $Res Function(_$PresenceLoadingStateImpl) then) =
      __$$PresenceLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PresenceLoadingStateImplCopyWithImpl<$Res>
    extends _$PresenceStateCopyWithImpl<$Res, _$PresenceLoadingStateImpl>
    implements _$$PresenceLoadingStateImplCopyWith<$Res> {
  __$$PresenceLoadingStateImplCopyWithImpl(_$PresenceLoadingStateImpl _value,
      $Res Function(_$PresenceLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PresenceLoadingStateImpl extends PresenceLoadingState {
  const _$PresenceLoadingStateImpl() : super._();

  @override
  String toString() {
    return 'PresenceState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loadingMore,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loadingMore,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loadingMore,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadingMoreState value) loadingMore,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadingMoreState value)? loadingMore,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadingMoreState value)? loadingMore,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PresenceLoadingState extends PresenceState {
  const factory PresenceLoadingState() = _$PresenceLoadingStateImpl;
  const PresenceLoadingState._() : super._();
}

/// @nodoc
abstract class _$$PresenceLoadingMoreStateImplCopyWith<$Res> {
  factory _$$PresenceLoadingMoreStateImplCopyWith(
          _$PresenceLoadingMoreStateImpl value,
          $Res Function(_$PresenceLoadingMoreStateImpl) then) =
      __$$PresenceLoadingMoreStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Presence> presenceList});
}

/// @nodoc
class __$$PresenceLoadingMoreStateImplCopyWithImpl<$Res>
    extends _$PresenceStateCopyWithImpl<$Res, _$PresenceLoadingMoreStateImpl>
    implements _$$PresenceLoadingMoreStateImplCopyWith<$Res> {
  __$$PresenceLoadingMoreStateImplCopyWithImpl(
      _$PresenceLoadingMoreStateImpl _value,
      $Res Function(_$PresenceLoadingMoreStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presenceList = null,
  }) {
    return _then(_$PresenceLoadingMoreStateImpl(
      presenceList: null == presenceList
          ? _value._presenceList
          : presenceList // ignore: cast_nullable_to_non_nullable
              as List<Presence>,
    ));
  }
}

/// @nodoc

class _$PresenceLoadingMoreStateImpl extends PresenceLoadingMoreState {
  const _$PresenceLoadingMoreStateImpl(
      {required final List<Presence> presenceList})
      : _presenceList = presenceList,
        super._();

  final List<Presence> _presenceList;
  @override
  List<Presence> get presenceList {
    if (_presenceList is EqualUnmodifiableListView) return _presenceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_presenceList);
  }

  @override
  String toString() {
    return 'PresenceState.loadingMore(presenceList: $presenceList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceLoadingMoreStateImpl &&
            const DeepCollectionEquality()
                .equals(other._presenceList, _presenceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_presenceList));

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceLoadingMoreStateImplCopyWith<_$PresenceLoadingMoreStateImpl>
      get copyWith => __$$PresenceLoadingMoreStateImplCopyWithImpl<
          _$PresenceLoadingMoreStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loadingMore,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) {
    return loadingMore(presenceList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loadingMore,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) {
    return loadingMore?.call(presenceList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loadingMore,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(presenceList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadingMoreState value) loadingMore,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadingMoreState value)? loadingMore,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadingMoreState value)? loadingMore,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class PresenceLoadingMoreState extends PresenceState {
  const factory PresenceLoadingMoreState(
          {required final List<Presence> presenceList}) =
      _$PresenceLoadingMoreStateImpl;
  const PresenceLoadingMoreState._() : super._();

  List<Presence> get presenceList;

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PresenceLoadingMoreStateImplCopyWith<_$PresenceLoadingMoreStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PresenceLoadedStateImplCopyWith<$Res> {
  factory _$$PresenceLoadedStateImplCopyWith(_$PresenceLoadedStateImpl value,
          $Res Function(_$PresenceLoadedStateImpl) then) =
      __$$PresenceLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Presence> presenceList});
}

/// @nodoc
class __$$PresenceLoadedStateImplCopyWithImpl<$Res>
    extends _$PresenceStateCopyWithImpl<$Res, _$PresenceLoadedStateImpl>
    implements _$$PresenceLoadedStateImplCopyWith<$Res> {
  __$$PresenceLoadedStateImplCopyWithImpl(_$PresenceLoadedStateImpl _value,
      $Res Function(_$PresenceLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presenceList = null,
  }) {
    return _then(_$PresenceLoadedStateImpl(
      presenceList: null == presenceList
          ? _value._presenceList
          : presenceList // ignore: cast_nullable_to_non_nullable
              as List<Presence>,
    ));
  }
}

/// @nodoc

class _$PresenceLoadedStateImpl extends PresenceLoadedState {
  const _$PresenceLoadedStateImpl({required final List<Presence> presenceList})
      : _presenceList = presenceList,
        super._();

  final List<Presence> _presenceList;
  @override
  List<Presence> get presenceList {
    if (_presenceList is EqualUnmodifiableListView) return _presenceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_presenceList);
  }

  @override
  String toString() {
    return 'PresenceState.loaded(presenceList: $presenceList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceLoadedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._presenceList, _presenceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_presenceList));

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceLoadedStateImplCopyWith<_$PresenceLoadedStateImpl> get copyWith =>
      __$$PresenceLoadedStateImplCopyWithImpl<_$PresenceLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loadingMore,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) {
    return loaded(presenceList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loadingMore,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(presenceList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loadingMore,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(presenceList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadingMoreState value) loadingMore,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadingMoreState value)? loadingMore,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadingMoreState value)? loadingMore,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PresenceLoadedState extends PresenceState {
  const factory PresenceLoadedState(
      {required final List<Presence> presenceList}) = _$PresenceLoadedStateImpl;
  const PresenceLoadedState._() : super._();

  List<Presence> get presenceList;

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PresenceLoadedStateImplCopyWith<_$PresenceLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PresenceErrorStateImplCopyWith<$Res> {
  factory _$$PresenceErrorStateImplCopyWith(_$PresenceErrorStateImpl value,
          $Res Function(_$PresenceErrorStateImpl) then) =
      __$$PresenceErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PresenceErrorStateImplCopyWithImpl<$Res>
    extends _$PresenceStateCopyWithImpl<$Res, _$PresenceErrorStateImpl>
    implements _$$PresenceErrorStateImplCopyWith<$Res> {
  __$$PresenceErrorStateImplCopyWithImpl(_$PresenceErrorStateImpl _value,
      $Res Function(_$PresenceErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PresenceErrorStateImpl extends PresenceErrorState {
  const _$PresenceErrorStateImpl() : super._();

  @override
  String toString() {
    return 'PresenceState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PresenceErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loadingMore,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loadingMore,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loadingMore,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadingMoreState value) loadingMore,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadingMoreState value)? loadingMore,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadingMoreState value)? loadingMore,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PresenceErrorState extends PresenceState {
  const factory PresenceErrorState() = _$PresenceErrorStateImpl;
  const PresenceErrorState._() : super._();
}
