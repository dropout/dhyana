// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_completed_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionCompletedEvent {
  String get profileId;
  Session get session;
  void Function(UpdateProfileStatsResult updateResults)? get onComplete;
  void Function(Object? error, StackTrace stack)? get onError;

  /// Create a copy of SessionCompletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionCompletedEventCopyWith<SessionCompletedEvent> get copyWith =>
      _$SessionCompletedEventCopyWithImpl<SessionCompletedEvent>(
          this as SessionCompletedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionCompletedEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profileId, session, onComplete, onError);

  @override
  String toString() {
    return 'SessionCompletedEvent(profileId: $profileId, session: $session, onComplete: $onComplete, onError: $onError)';
  }
}

/// @nodoc
abstract mixin class $SessionCompletedEventCopyWith<$Res> {
  factory $SessionCompletedEventCopyWith(SessionCompletedEvent value,
          $Res Function(SessionCompletedEvent) _then) =
      _$SessionCompletedEventCopyWithImpl;
  @useResult
  $Res call(
      {String profileId,
      Session session,
      void Function(UpdateProfileStatsResult updateResults)? onComplete,
      void Function(Object? error, StackTrace stack)? onError});

  $SessionCopyWith<$Res> get session;
}

/// @nodoc
class _$SessionCompletedEventCopyWithImpl<$Res>
    implements $SessionCompletedEventCopyWith<$Res> {
  _$SessionCompletedEventCopyWithImpl(this._self, this._then);

  final SessionCompletedEvent _self;
  final $Res Function(SessionCompletedEvent) _then;

  /// Create a copy of SessionCompletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? session = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_self.copyWith(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      session: null == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
      onComplete: freezed == onComplete
          ? _self.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(UpdateProfileStatsResult updateResults)?,
      onError: freezed == onError
          ? _self.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object? error, StackTrace stack)?,
    ));
  }

  /// Create a copy of SessionCompletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }
}

/// @nodoc

class LogSessionEvent extends SessionCompletedEvent {
  const LogSessionEvent(
      {required this.profileId,
      required this.session,
      this.onComplete,
      this.onError})
      : super._();

  @override
  final String profileId;
  @override
  final Session session;
  @override
  final void Function(UpdateProfileStatsResult updateResults)? onComplete;
  @override
  final void Function(Object? error, StackTrace stack)? onError;

  /// Create a copy of SessionCompletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LogSessionEventCopyWith<LogSessionEvent> get copyWith =>
      _$LogSessionEventCopyWithImpl<LogSessionEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LogSessionEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profileId, session, onComplete, onError);

  @override
  String toString() {
    return 'SessionCompletedEvent.logSession(profileId: $profileId, session: $session, onComplete: $onComplete, onError: $onError)';
  }
}

/// @nodoc
abstract mixin class $LogSessionEventCopyWith<$Res>
    implements $SessionCompletedEventCopyWith<$Res> {
  factory $LogSessionEventCopyWith(
          LogSessionEvent value, $Res Function(LogSessionEvent) _then) =
      _$LogSessionEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String profileId,
      Session session,
      void Function(UpdateProfileStatsResult updateResults)? onComplete,
      void Function(Object? error, StackTrace stack)? onError});

  @override
  $SessionCopyWith<$Res> get session;
}

/// @nodoc
class _$LogSessionEventCopyWithImpl<$Res>
    implements $LogSessionEventCopyWith<$Res> {
  _$LogSessionEventCopyWithImpl(this._self, this._then);

  final LogSessionEvent _self;
  final $Res Function(LogSessionEvent) _then;

  /// Create a copy of SessionCompletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
    Object? session = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(LogSessionEvent(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      session: null == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
      onComplete: freezed == onComplete
          ? _self.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(UpdateProfileStatsResult updateResults)?,
      onError: freezed == onError
          ? _self.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object? error, StackTrace stack)?,
    ));
  }

  /// Create a copy of SessionCompletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }
}

/// @nodoc
mixin _$SessionCompletedState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionCompletedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionCompletedState()';
  }
}

/// @nodoc
class $SessionCompletedStateCopyWith<$Res> {
  $SessionCompletedStateCopyWith(
      SessionCompletedState _, $Res Function(SessionCompletedState) __);
}

/// @nodoc

class SessionCompletedInitialState extends SessionCompletedState {
  const SessionCompletedInitialState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionCompletedInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionCompletedState.initial()';
  }
}

/// @nodoc

class SessionCompletedLoadingState extends SessionCompletedState {
  const SessionCompletedLoadingState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionCompletedLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionCompletedState.loading()';
  }
}

/// @nodoc

class SessionCompletedErrorState extends SessionCompletedState {
  const SessionCompletedErrorState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionCompletedErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionCompletedState.error()';
  }
}

/// @nodoc

class SessionCompletedSavingState extends SessionCompletedState {
  const SessionCompletedSavingState({required this.updateResult}) : super._();

  final UpdateProfileStatsResult updateResult;

  /// Create a copy of SessionCompletedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionCompletedSavingStateCopyWith<SessionCompletedSavingState>
      get copyWith => _$SessionCompletedSavingStateCopyWithImpl<
          SessionCompletedSavingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionCompletedSavingState &&
            (identical(other.updateResult, updateResult) ||
                other.updateResult == updateResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updateResult);

  @override
  String toString() {
    return 'SessionCompletedState.saving(updateResult: $updateResult)';
  }
}

/// @nodoc
abstract mixin class $SessionCompletedSavingStateCopyWith<$Res>
    implements $SessionCompletedStateCopyWith<$Res> {
  factory $SessionCompletedSavingStateCopyWith(
          SessionCompletedSavingState value,
          $Res Function(SessionCompletedSavingState) _then) =
      _$SessionCompletedSavingStateCopyWithImpl;
  @useResult
  $Res call({UpdateProfileStatsResult updateResult});

  $UpdateProfileStatsResultCopyWith<$Res> get updateResult;
}

/// @nodoc
class _$SessionCompletedSavingStateCopyWithImpl<$Res>
    implements $SessionCompletedSavingStateCopyWith<$Res> {
  _$SessionCompletedSavingStateCopyWithImpl(this._self, this._then);

  final SessionCompletedSavingState _self;
  final $Res Function(SessionCompletedSavingState) _then;

  /// Create a copy of SessionCompletedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? updateResult = null,
  }) {
    return _then(SessionCompletedSavingState(
      updateResult: null == updateResult
          ? _self.updateResult
          : updateResult // ignore: cast_nullable_to_non_nullable
              as UpdateProfileStatsResult,
    ));
  }

  /// Create a copy of SessionCompletedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateProfileStatsResultCopyWith<$Res> get updateResult {
    return $UpdateProfileStatsResultCopyWith<$Res>(_self.updateResult, (value) {
      return _then(_self.copyWith(updateResult: value));
    });
  }
}

/// @nodoc

class SessionCompletedSavedState extends SessionCompletedState {
  const SessionCompletedSavedState({required this.updateResult}) : super._();

  final UpdateProfileStatsResult updateResult;

  /// Create a copy of SessionCompletedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionCompletedSavedStateCopyWith<SessionCompletedSavedState>
      get copyWith =>
          _$SessionCompletedSavedStateCopyWithImpl<SessionCompletedSavedState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionCompletedSavedState &&
            (identical(other.updateResult, updateResult) ||
                other.updateResult == updateResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updateResult);

  @override
  String toString() {
    return 'SessionCompletedState.saved(updateResult: $updateResult)';
  }
}

/// @nodoc
abstract mixin class $SessionCompletedSavedStateCopyWith<$Res>
    implements $SessionCompletedStateCopyWith<$Res> {
  factory $SessionCompletedSavedStateCopyWith(SessionCompletedSavedState value,
          $Res Function(SessionCompletedSavedState) _then) =
      _$SessionCompletedSavedStateCopyWithImpl;
  @useResult
  $Res call({UpdateProfileStatsResult updateResult});

  $UpdateProfileStatsResultCopyWith<$Res> get updateResult;
}

/// @nodoc
class _$SessionCompletedSavedStateCopyWithImpl<$Res>
    implements $SessionCompletedSavedStateCopyWith<$Res> {
  _$SessionCompletedSavedStateCopyWithImpl(this._self, this._then);

  final SessionCompletedSavedState _self;
  final $Res Function(SessionCompletedSavedState) _then;

  /// Create a copy of SessionCompletedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? updateResult = null,
  }) {
    return _then(SessionCompletedSavedState(
      updateResult: null == updateResult
          ? _self.updateResult
          : updateResult // ignore: cast_nullable_to_non_nullable
              as UpdateProfileStatsResult,
    ));
  }

  /// Create a copy of SessionCompletedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateProfileStatsResultCopyWith<$Res> get updateResult {
    return $UpdateProfileStatsResultCopyWith<$Res>(_self.updateResult, (value) {
      return _then(_self.copyWith(updateResult: value));
    });
  }
}

// dart format on
