// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_logger_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionLoggerEvent {
  String get profileId;
  DateTime get startTime;
  DateTime get endTime;
  Duration get duration;
  TimerSettings get timerSettings;
  void Function(Profile updatedProfile)? get onComplete;
  void Function(Object? error, StackTrace stack)? get onError;

  /// Create a copy of SessionLoggerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionLoggerEventCopyWith<SessionLoggerEvent> get copyWith =>
      _$SessionLoggerEventCopyWithImpl<SessionLoggerEvent>(
          this as SessionLoggerEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionLoggerEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, startTime, endTime,
      duration, timerSettings, onComplete, onError);

  @override
  String toString() {
    return 'SessionLoggerEvent(profileId: $profileId, startTime: $startTime, endTime: $endTime, duration: $duration, timerSettings: $timerSettings, onComplete: $onComplete, onError: $onError)';
  }
}

/// @nodoc
abstract mixin class $SessionLoggerEventCopyWith<$Res> {
  factory $SessionLoggerEventCopyWith(
          SessionLoggerEvent value, $Res Function(SessionLoggerEvent) _then) =
      _$SessionLoggerEventCopyWithImpl;
  @useResult
  $Res call(
      {String profileId,
      DateTime startTime,
      DateTime endTime,
      Duration duration,
      TimerSettings timerSettings,
      void Function(Profile updatedProfile)? onComplete,
      void Function(Object? error, StackTrace stack)? onError});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class _$SessionLoggerEventCopyWithImpl<$Res>
    implements $SessionLoggerEventCopyWith<$Res> {
  _$SessionLoggerEventCopyWithImpl(this._self, this._then);

  final SessionLoggerEvent _self;
  final $Res Function(SessionLoggerEvent) _then;

  /// Create a copy of SessionLoggerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? timerSettings = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_self.copyWith(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerSettings: null == timerSettings
          ? _self.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      onComplete: freezed == onComplete
          ? _self.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(Profile updatedProfile)?,
      onError: freezed == onError
          ? _self.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object? error, StackTrace stack)?,
    ));
  }

  /// Create a copy of SessionLoggerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_self.timerSettings, (value) {
      return _then(_self.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc

class LogSessionEvent implements SessionLoggerEvent {
  const LogSessionEvent(
      {required this.profileId,
      required this.startTime,
      required this.endTime,
      required this.duration,
      required this.timerSettings,
      this.onComplete,
      this.onError});

  @override
  final String profileId;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final Duration duration;
  @override
  final TimerSettings timerSettings;
  @override
  final void Function(Profile updatedProfile)? onComplete;
  @override
  final void Function(Object? error, StackTrace stack)? onError;

  /// Create a copy of SessionLoggerEvent
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
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, startTime, endTime,
      duration, timerSettings, onComplete, onError);

  @override
  String toString() {
    return 'SessionLoggerEvent.logSession(profileId: $profileId, startTime: $startTime, endTime: $endTime, duration: $duration, timerSettings: $timerSettings, onComplete: $onComplete, onError: $onError)';
  }
}

/// @nodoc
abstract mixin class $LogSessionEventCopyWith<$Res>
    implements $SessionLoggerEventCopyWith<$Res> {
  factory $LogSessionEventCopyWith(
          LogSessionEvent value, $Res Function(LogSessionEvent) _then) =
      _$LogSessionEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String profileId,
      DateTime startTime,
      DateTime endTime,
      Duration duration,
      TimerSettings timerSettings,
      void Function(Profile updatedProfile)? onComplete,
      void Function(Object? error, StackTrace stack)? onError});

  @override
  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class _$LogSessionEventCopyWithImpl<$Res>
    implements $LogSessionEventCopyWith<$Res> {
  _$LogSessionEventCopyWithImpl(this._self, this._then);

  final LogSessionEvent _self;
  final $Res Function(LogSessionEvent) _then;

  /// Create a copy of SessionLoggerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? timerSettings = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(LogSessionEvent(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerSettings: null == timerSettings
          ? _self.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      onComplete: freezed == onComplete
          ? _self.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(Profile updatedProfile)?,
      onError: freezed == onError
          ? _self.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object? error, StackTrace stack)?,
    ));
  }

  /// Create a copy of SessionLoggerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_self.timerSettings, (value) {
      return _then(_self.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc
mixin _$SessionLoggerState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionLoggerState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionLoggerState()';
  }
}

/// @nodoc
class $SessionLoggerStateCopyWith<$Res> {
  $SessionLoggerStateCopyWith(
      SessionLoggerState _, $Res Function(SessionLoggerState) __);
}

/// @nodoc

class SessionLoggerInitialState extends SessionLoggerState {
  const SessionLoggerInitialState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionLoggerInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionLoggerState.initial()';
  }
}

/// @nodoc

class SessionLoggerLoadingState extends SessionLoggerState {
  const SessionLoggerLoadingState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionLoggerLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionLoggerState.loading()';
  }
}

/// @nodoc

class SessionLoggerErrorState extends SessionLoggerState {
  const SessionLoggerErrorState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionLoggerErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionLoggerState.error()';
  }
}

/// @nodoc

class SessionLoggerSavingState extends SessionLoggerState {
  const SessionLoggerSavingState(
      {required this.oldProfile,
      required this.session,
      required this.updatedProfile})
      : super._();

  final Profile oldProfile;
  final Session session;
  final Profile updatedProfile;

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionLoggerSavingStateCopyWith<SessionLoggerSavingState> get copyWith =>
      _$SessionLoggerSavingStateCopyWithImpl<SessionLoggerSavingState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionLoggerSavingState &&
            (identical(other.oldProfile, oldProfile) ||
                other.oldProfile == oldProfile) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.updatedProfile, updatedProfile) ||
                other.updatedProfile == updatedProfile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, oldProfile, session, updatedProfile);

  @override
  String toString() {
    return 'SessionLoggerState.saving(oldProfile: $oldProfile, session: $session, updatedProfile: $updatedProfile)';
  }
}

/// @nodoc
abstract mixin class $SessionLoggerSavingStateCopyWith<$Res>
    implements $SessionLoggerStateCopyWith<$Res> {
  factory $SessionLoggerSavingStateCopyWith(SessionLoggerSavingState value,
          $Res Function(SessionLoggerSavingState) _then) =
      _$SessionLoggerSavingStateCopyWithImpl;
  @useResult
  $Res call({Profile oldProfile, Session session, Profile updatedProfile});

  $ProfileCopyWith<$Res> get oldProfile;
  $SessionCopyWith<$Res> get session;
  $ProfileCopyWith<$Res> get updatedProfile;
}

/// @nodoc
class _$SessionLoggerSavingStateCopyWithImpl<$Res>
    implements $SessionLoggerSavingStateCopyWith<$Res> {
  _$SessionLoggerSavingStateCopyWithImpl(this._self, this._then);

  final SessionLoggerSavingState _self;
  final $Res Function(SessionLoggerSavingState) _then;

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? oldProfile = null,
    Object? session = null,
    Object? updatedProfile = null,
  }) {
    return _then(SessionLoggerSavingState(
      oldProfile: null == oldProfile
          ? _self.oldProfile
          : oldProfile // ignore: cast_nullable_to_non_nullable
              as Profile,
      session: null == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
      updatedProfile: null == updatedProfile
          ? _self.updatedProfile
          : updatedProfile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get oldProfile {
    return $ProfileCopyWith<$Res>(_self.oldProfile, (value) {
      return _then(_self.copyWith(oldProfile: value));
    });
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get updatedProfile {
    return $ProfileCopyWith<$Res>(_self.updatedProfile, (value) {
      return _then(_self.copyWith(updatedProfile: value));
    });
  }
}

/// @nodoc

class SessionLoggerSavedState extends SessionLoggerState {
  const SessionLoggerSavedState(
      {required this.oldProfile,
      required this.session,
      required this.updatedProfile})
      : super._();

  final Profile oldProfile;
  final Session session;
  final Profile updatedProfile;

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionLoggerSavedStateCopyWith<SessionLoggerSavedState> get copyWith =>
      _$SessionLoggerSavedStateCopyWithImpl<SessionLoggerSavedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionLoggerSavedState &&
            (identical(other.oldProfile, oldProfile) ||
                other.oldProfile == oldProfile) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.updatedProfile, updatedProfile) ||
                other.updatedProfile == updatedProfile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, oldProfile, session, updatedProfile);

  @override
  String toString() {
    return 'SessionLoggerState.saved(oldProfile: $oldProfile, session: $session, updatedProfile: $updatedProfile)';
  }
}

/// @nodoc
abstract mixin class $SessionLoggerSavedStateCopyWith<$Res>
    implements $SessionLoggerStateCopyWith<$Res> {
  factory $SessionLoggerSavedStateCopyWith(SessionLoggerSavedState value,
          $Res Function(SessionLoggerSavedState) _then) =
      _$SessionLoggerSavedStateCopyWithImpl;
  @useResult
  $Res call({Profile oldProfile, Session session, Profile updatedProfile});

  $ProfileCopyWith<$Res> get oldProfile;
  $SessionCopyWith<$Res> get session;
  $ProfileCopyWith<$Res> get updatedProfile;
}

/// @nodoc
class _$SessionLoggerSavedStateCopyWithImpl<$Res>
    implements $SessionLoggerSavedStateCopyWith<$Res> {
  _$SessionLoggerSavedStateCopyWithImpl(this._self, this._then);

  final SessionLoggerSavedState _self;
  final $Res Function(SessionLoggerSavedState) _then;

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? oldProfile = null,
    Object? session = null,
    Object? updatedProfile = null,
  }) {
    return _then(SessionLoggerSavedState(
      oldProfile: null == oldProfile
          ? _self.oldProfile
          : oldProfile // ignore: cast_nullable_to_non_nullable
              as Profile,
      session: null == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
      updatedProfile: null == updatedProfile
          ? _self.updatedProfile
          : updatedProfile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get oldProfile {
    return $ProfileCopyWith<$Res>(_self.oldProfile, (value) {
      return _then(_self.copyWith(oldProfile: value));
    });
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get updatedProfile {
    return $ProfileCopyWith<$Res>(_self.updatedProfile, (value) {
      return _then(_self.copyWith(updatedProfile: value));
    });
  }
}

// dart format on
