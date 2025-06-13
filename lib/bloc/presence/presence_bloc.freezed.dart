// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresenceEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PresenceEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PresenceEvent()';
  }
}

/// @nodoc
class $PresenceEventCopyWith<$Res> {
  $PresenceEventCopyWith(PresenceEvent _, $Res Function(PresenceEvent) __);
}

/// @nodoc

class LoadPresenceData extends PresenceEvent {
  const LoadPresenceData(
      {this.ownProfileId, this.intervalInMinutes = 60, this.batchSize = 18})
      : super._();

  final String? ownProfileId;
  @JsonKey()
  final int intervalInMinutes;
  @JsonKey()
  final int batchSize;

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadPresenceDataCopyWith<LoadPresenceData> get copyWith =>
      _$LoadPresenceDataCopyWithImpl<LoadPresenceData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadPresenceData &&
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

  @override
  String toString() {
    return 'PresenceEvent.load(ownProfileId: $ownProfileId, intervalInMinutes: $intervalInMinutes, batchSize: $batchSize)';
  }
}

/// @nodoc
abstract mixin class $LoadPresenceDataCopyWith<$Res>
    implements $PresenceEventCopyWith<$Res> {
  factory $LoadPresenceDataCopyWith(
          LoadPresenceData value, $Res Function(LoadPresenceData) _then) =
      _$LoadPresenceDataCopyWithImpl;
  @useResult
  $Res call({String? ownProfileId, int intervalInMinutes, int batchSize});
}

/// @nodoc
class _$LoadPresenceDataCopyWithImpl<$Res>
    implements $LoadPresenceDataCopyWith<$Res> {
  _$LoadPresenceDataCopyWithImpl(this._self, this._then);

  final LoadPresenceData _self;
  final $Res Function(LoadPresenceData) _then;

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ownProfileId = freezed,
    Object? intervalInMinutes = null,
    Object? batchSize = null,
  }) {
    return _then(LoadPresenceData(
      ownProfileId: freezed == ownProfileId
          ? _self.ownProfileId
          : ownProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      intervalInMinutes: null == intervalInMinutes
          ? _self.intervalInMinutes
          : intervalInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      batchSize: null == batchSize
          ? _self.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class LoadMorePresenceData extends PresenceEvent {
  const LoadMorePresenceData(
      {required this.lastDocumentId,
      this.intervalInMinutes = 60,
      this.batchSize = 18})
      : super._();

  final String lastDocumentId;
  @JsonKey()
  final int intervalInMinutes;
  @JsonKey()
  final int batchSize;

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadMorePresenceDataCopyWith<LoadMorePresenceData> get copyWith =>
      _$LoadMorePresenceDataCopyWithImpl<LoadMorePresenceData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadMorePresenceData &&
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

  @override
  String toString() {
    return 'PresenceEvent.loadMore(lastDocumentId: $lastDocumentId, intervalInMinutes: $intervalInMinutes, batchSize: $batchSize)';
  }
}

/// @nodoc
abstract mixin class $LoadMorePresenceDataCopyWith<$Res>
    implements $PresenceEventCopyWith<$Res> {
  factory $LoadMorePresenceDataCopyWith(LoadMorePresenceData value,
          $Res Function(LoadMorePresenceData) _then) =
      _$LoadMorePresenceDataCopyWithImpl;
  @useResult
  $Res call({String lastDocumentId, int intervalInMinutes, int batchSize});
}

/// @nodoc
class _$LoadMorePresenceDataCopyWithImpl<$Res>
    implements $LoadMorePresenceDataCopyWith<$Res> {
  _$LoadMorePresenceDataCopyWithImpl(this._self, this._then);

  final LoadMorePresenceData _self;
  final $Res Function(LoadMorePresenceData) _then;

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lastDocumentId = null,
    Object? intervalInMinutes = null,
    Object? batchSize = null,
  }) {
    return _then(LoadMorePresenceData(
      lastDocumentId: null == lastDocumentId
          ? _self.lastDocumentId
          : lastDocumentId // ignore: cast_nullable_to_non_nullable
              as String,
      intervalInMinutes: null == intervalInMinutes
          ? _self.intervalInMinutes
          : intervalInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      batchSize: null == batchSize
          ? _self.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ShowPresence extends PresenceEvent {
  const ShowPresence({required this.profileId}) : super._();

  final String profileId;

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShowPresenceCopyWith<ShowPresence> get copyWith =>
      _$ShowPresenceCopyWithImpl<ShowPresence>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowPresence &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId);

  @override
  String toString() {
    return 'PresenceEvent.showPresence(profileId: $profileId)';
  }
}

/// @nodoc
abstract mixin class $ShowPresenceCopyWith<$Res>
    implements $PresenceEventCopyWith<$Res> {
  factory $ShowPresenceCopyWith(
          ShowPresence value, $Res Function(ShowPresence) _then) =
      _$ShowPresenceCopyWithImpl;
  @useResult
  $Res call({String profileId});
}

/// @nodoc
class _$ShowPresenceCopyWithImpl<$Res> implements $ShowPresenceCopyWith<$Res> {
  _$ShowPresenceCopyWithImpl(this._self, this._then);

  final ShowPresence _self;
  final $Res Function(ShowPresence) _then;

  /// Create a copy of PresenceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
  }) {
    return _then(ShowPresence(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PresenceState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PresenceState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PresenceState()';
  }
}

/// @nodoc
class $PresenceStateCopyWith<$Res> {
  $PresenceStateCopyWith(PresenceState _, $Res Function(PresenceState) __);
}

/// @nodoc

class _Initial extends PresenceState {
  const _Initial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PresenceState.initial()';
  }
}

/// @nodoc

class PresenceLoadingState extends PresenceState {
  const PresenceLoadingState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PresenceLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PresenceState.loading()';
  }
}

/// @nodoc

class PresenceLoadingMoreState extends PresenceState {
  const PresenceLoadingMoreState({required final List<Presence> presenceList})
      : _presenceList = presenceList,
        super._();

  final List<Presence> _presenceList;
  List<Presence> get presenceList {
    if (_presenceList is EqualUnmodifiableListView) return _presenceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_presenceList);
  }

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PresenceLoadingMoreStateCopyWith<PresenceLoadingMoreState> get copyWith =>
      _$PresenceLoadingMoreStateCopyWithImpl<PresenceLoadingMoreState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PresenceLoadingMoreState &&
            const DeepCollectionEquality()
                .equals(other._presenceList, _presenceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_presenceList));

  @override
  String toString() {
    return 'PresenceState.loadingMore(presenceList: $presenceList)';
  }
}

/// @nodoc
abstract mixin class $PresenceLoadingMoreStateCopyWith<$Res>
    implements $PresenceStateCopyWith<$Res> {
  factory $PresenceLoadingMoreStateCopyWith(PresenceLoadingMoreState value,
          $Res Function(PresenceLoadingMoreState) _then) =
      _$PresenceLoadingMoreStateCopyWithImpl;
  @useResult
  $Res call({List<Presence> presenceList});
}

/// @nodoc
class _$PresenceLoadingMoreStateCopyWithImpl<$Res>
    implements $PresenceLoadingMoreStateCopyWith<$Res> {
  _$PresenceLoadingMoreStateCopyWithImpl(this._self, this._then);

  final PresenceLoadingMoreState _self;
  final $Res Function(PresenceLoadingMoreState) _then;

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? presenceList = null,
  }) {
    return _then(PresenceLoadingMoreState(
      presenceList: null == presenceList
          ? _self._presenceList
          : presenceList // ignore: cast_nullable_to_non_nullable
              as List<Presence>,
    ));
  }
}

/// @nodoc

class PresenceLoadedState extends PresenceState {
  const PresenceLoadedState({required final List<Presence> presenceList})
      : _presenceList = presenceList,
        super._();

  final List<Presence> _presenceList;
  List<Presence> get presenceList {
    if (_presenceList is EqualUnmodifiableListView) return _presenceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_presenceList);
  }

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PresenceLoadedStateCopyWith<PresenceLoadedState> get copyWith =>
      _$PresenceLoadedStateCopyWithImpl<PresenceLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PresenceLoadedState &&
            const DeepCollectionEquality()
                .equals(other._presenceList, _presenceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_presenceList));

  @override
  String toString() {
    return 'PresenceState.loaded(presenceList: $presenceList)';
  }
}

/// @nodoc
abstract mixin class $PresenceLoadedStateCopyWith<$Res>
    implements $PresenceStateCopyWith<$Res> {
  factory $PresenceLoadedStateCopyWith(
          PresenceLoadedState value, $Res Function(PresenceLoadedState) _then) =
      _$PresenceLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<Presence> presenceList});
}

/// @nodoc
class _$PresenceLoadedStateCopyWithImpl<$Res>
    implements $PresenceLoadedStateCopyWith<$Res> {
  _$PresenceLoadedStateCopyWithImpl(this._self, this._then);

  final PresenceLoadedState _self;
  final $Res Function(PresenceLoadedState) _then;

  /// Create a copy of PresenceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? presenceList = null,
  }) {
    return _then(PresenceLoadedState(
      presenceList: null == presenceList
          ? _self._presenceList
          : presenceList // ignore: cast_nullable_to_non_nullable
              as List<Presence>,
    ));
  }
}

/// @nodoc

class PresenceErrorState extends PresenceState {
  const PresenceErrorState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PresenceErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PresenceState.error()';
  }
}

// dart format on
