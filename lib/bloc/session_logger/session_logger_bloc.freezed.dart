// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_logger_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionLoggerEvent {
  String get profileId => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  TimerSettings get timerSettings => throw _privateConstructorUsedError;
  void Function(Profile)? get onComplete => throw _privateConstructorUsedError;
  void Function(Object?, StackTrace)? get onError =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            DateTime startTime,
            DateTime endTime,
            Duration duration,
            TimerSettings timerSettings,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        logSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String profileId,
            DateTime startTime,
            DateTime endTime,
            Duration duration,
            TimerSettings timerSettings,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        logSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String profileId,
            DateTime startTime,
            DateTime endTime,
            Duration duration,
            TimerSettings timerSettings,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        logSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogSessionEvent value) logSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogSessionEvent value)? logSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogSessionEvent value)? logSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SessionLoggerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionLoggerEventCopyWith<SessionLoggerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionLoggerEventCopyWith<$Res> {
  factory $SessionLoggerEventCopyWith(
          SessionLoggerEvent value, $Res Function(SessionLoggerEvent) then) =
      _$SessionLoggerEventCopyWithImpl<$Res, SessionLoggerEvent>;
  @useResult
  $Res call(
      {String profileId,
      DateTime startTime,
      DateTime endTime,
      Duration duration,
      TimerSettings timerSettings,
      void Function(Profile)? onComplete,
      void Function(Object?, StackTrace)? onError});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class _$SessionLoggerEventCopyWithImpl<$Res, $Val extends SessionLoggerEvent>
    implements $SessionLoggerEventCopyWith<$Res> {
  _$SessionLoggerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      onComplete: freezed == onComplete
          ? _value.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(Profile)?,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object?, StackTrace)?,
    ) as $Val);
  }

  /// Create a copy of SessionLoggerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_value.timerSettings, (value) {
      return _then(_value.copyWith(timerSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LogSessionEventImplCopyWith<$Res>
    implements $SessionLoggerEventCopyWith<$Res> {
  factory _$$LogSessionEventImplCopyWith(_$LogSessionEventImpl value,
          $Res Function(_$LogSessionEventImpl) then) =
      __$$LogSessionEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String profileId,
      DateTime startTime,
      DateTime endTime,
      Duration duration,
      TimerSettings timerSettings,
      void Function(Profile)? onComplete,
      void Function(Object?, StackTrace)? onError});

  @override
  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$LogSessionEventImplCopyWithImpl<$Res>
    extends _$SessionLoggerEventCopyWithImpl<$Res, _$LogSessionEventImpl>
    implements _$$LogSessionEventImplCopyWith<$Res> {
  __$$LogSessionEventImplCopyWithImpl(
      _$LogSessionEventImpl _value, $Res Function(_$LogSessionEventImpl) _then)
      : super(_value, _then);

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
    return _then(_$LogSessionEventImpl(
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      onComplete: freezed == onComplete
          ? _value.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(Profile)?,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object?, StackTrace)?,
    ));
  }
}

/// @nodoc

class _$LogSessionEventImpl implements LogSessionEvent {
  const _$LogSessionEventImpl(
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
  final void Function(Profile)? onComplete;
  @override
  final void Function(Object?, StackTrace)? onError;

  @override
  String toString() {
    return 'SessionLoggerEvent.logSession(profileId: $profileId, startTime: $startTime, endTime: $endTime, duration: $duration, timerSettings: $timerSettings, onComplete: $onComplete, onError: $onError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogSessionEventImpl &&
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

  /// Create a copy of SessionLoggerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogSessionEventImplCopyWith<_$LogSessionEventImpl> get copyWith =>
      __$$LogSessionEventImplCopyWithImpl<_$LogSessionEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            DateTime startTime,
            DateTime endTime,
            Duration duration,
            TimerSettings timerSettings,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        logSession,
  }) {
    return logSession(profileId, startTime, endTime, duration, timerSettings,
        onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String profileId,
            DateTime startTime,
            DateTime endTime,
            Duration duration,
            TimerSettings timerSettings,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        logSession,
  }) {
    return logSession?.call(profileId, startTime, endTime, duration,
        timerSettings, onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String profileId,
            DateTime startTime,
            DateTime endTime,
            Duration duration,
            TimerSettings timerSettings,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        logSession,
    required TResult orElse(),
  }) {
    if (logSession != null) {
      return logSession(profileId, startTime, endTime, duration, timerSettings,
          onComplete, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogSessionEvent value) logSession,
  }) {
    return logSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogSessionEvent value)? logSession,
  }) {
    return logSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogSessionEvent value)? logSession,
    required TResult orElse(),
  }) {
    if (logSession != null) {
      return logSession(this);
    }
    return orElse();
  }
}

abstract class LogSessionEvent implements SessionLoggerEvent {
  const factory LogSessionEvent(
          {required final String profileId,
          required final DateTime startTime,
          required final DateTime endTime,
          required final Duration duration,
          required final TimerSettings timerSettings,
          final void Function(Profile)? onComplete,
          final void Function(Object?, StackTrace)? onError}) =
      _$LogSessionEventImpl;

  @override
  String get profileId;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  Duration get duration;
  @override
  TimerSettings get timerSettings;
  @override
  void Function(Profile)? get onComplete;
  @override
  void Function(Object?, StackTrace)? get onError;

  /// Create a copy of SessionLoggerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogSessionEventImplCopyWith<_$LogSessionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionLoggerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saving,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionLoggerInitialState value) initial,
    required TResult Function(SessionLoggerLoadingState value) loading,
    required TResult Function(SessionLoggerErrorState value) error,
    required TResult Function(SessionLoggerSavingState value) saving,
    required TResult Function(SessionLoggerSavedState value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionLoggerInitialState value)? initial,
    TResult? Function(SessionLoggerLoadingState value)? loading,
    TResult? Function(SessionLoggerErrorState value)? error,
    TResult? Function(SessionLoggerSavingState value)? saving,
    TResult? Function(SessionLoggerSavedState value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionLoggerInitialState value)? initial,
    TResult Function(SessionLoggerLoadingState value)? loading,
    TResult Function(SessionLoggerErrorState value)? error,
    TResult Function(SessionLoggerSavingState value)? saving,
    TResult Function(SessionLoggerSavedState value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionLoggerStateCopyWith<$Res> {
  factory $SessionLoggerStateCopyWith(
          SessionLoggerState value, $Res Function(SessionLoggerState) then) =
      _$SessionLoggerStateCopyWithImpl<$Res, SessionLoggerState>;
}

/// @nodoc
class _$SessionLoggerStateCopyWithImpl<$Res, $Val extends SessionLoggerState>
    implements $SessionLoggerStateCopyWith<$Res> {
  _$SessionLoggerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SessionLoggerInitialStateImplCopyWith<$Res> {
  factory _$$SessionLoggerInitialStateImplCopyWith(
          _$SessionLoggerInitialStateImpl value,
          $Res Function(_$SessionLoggerInitialStateImpl) then) =
      __$$SessionLoggerInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionLoggerInitialStateImplCopyWithImpl<$Res>
    extends _$SessionLoggerStateCopyWithImpl<$Res,
        _$SessionLoggerInitialStateImpl>
    implements _$$SessionLoggerInitialStateImplCopyWith<$Res> {
  __$$SessionLoggerInitialStateImplCopyWithImpl(
      _$SessionLoggerInitialStateImpl _value,
      $Res Function(_$SessionLoggerInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionLoggerInitialStateImpl extends SessionLoggerInitialState {
  const _$SessionLoggerInitialStateImpl() : super._();

  @override
  String toString() {
    return 'SessionLoggerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionLoggerInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saving,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saved,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
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
    required TResult Function(SessionLoggerInitialState value) initial,
    required TResult Function(SessionLoggerLoadingState value) loading,
    required TResult Function(SessionLoggerErrorState value) error,
    required TResult Function(SessionLoggerSavingState value) saving,
    required TResult Function(SessionLoggerSavedState value) saved,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionLoggerInitialState value)? initial,
    TResult? Function(SessionLoggerLoadingState value)? loading,
    TResult? Function(SessionLoggerErrorState value)? error,
    TResult? Function(SessionLoggerSavingState value)? saving,
    TResult? Function(SessionLoggerSavedState value)? saved,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionLoggerInitialState value)? initial,
    TResult Function(SessionLoggerLoadingState value)? loading,
    TResult Function(SessionLoggerErrorState value)? error,
    TResult Function(SessionLoggerSavingState value)? saving,
    TResult Function(SessionLoggerSavedState value)? saved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SessionLoggerInitialState extends SessionLoggerState {
  const factory SessionLoggerInitialState() = _$SessionLoggerInitialStateImpl;
  const SessionLoggerInitialState._() : super._();
}

/// @nodoc
abstract class _$$SessionLoggerLoadingStateImplCopyWith<$Res> {
  factory _$$SessionLoggerLoadingStateImplCopyWith(
          _$SessionLoggerLoadingStateImpl value,
          $Res Function(_$SessionLoggerLoadingStateImpl) then) =
      __$$SessionLoggerLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionLoggerLoadingStateImplCopyWithImpl<$Res>
    extends _$SessionLoggerStateCopyWithImpl<$Res,
        _$SessionLoggerLoadingStateImpl>
    implements _$$SessionLoggerLoadingStateImplCopyWith<$Res> {
  __$$SessionLoggerLoadingStateImplCopyWithImpl(
      _$SessionLoggerLoadingStateImpl _value,
      $Res Function(_$SessionLoggerLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionLoggerLoadingStateImpl extends SessionLoggerLoadingState {
  const _$SessionLoggerLoadingStateImpl() : super._();

  @override
  String toString() {
    return 'SessionLoggerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionLoggerLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saving,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saved,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
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
    required TResult Function(SessionLoggerInitialState value) initial,
    required TResult Function(SessionLoggerLoadingState value) loading,
    required TResult Function(SessionLoggerErrorState value) error,
    required TResult Function(SessionLoggerSavingState value) saving,
    required TResult Function(SessionLoggerSavedState value) saved,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionLoggerInitialState value)? initial,
    TResult? Function(SessionLoggerLoadingState value)? loading,
    TResult? Function(SessionLoggerErrorState value)? error,
    TResult? Function(SessionLoggerSavingState value)? saving,
    TResult? Function(SessionLoggerSavedState value)? saved,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionLoggerInitialState value)? initial,
    TResult Function(SessionLoggerLoadingState value)? loading,
    TResult Function(SessionLoggerErrorState value)? error,
    TResult Function(SessionLoggerSavingState value)? saving,
    TResult Function(SessionLoggerSavedState value)? saved,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SessionLoggerLoadingState extends SessionLoggerState {
  const factory SessionLoggerLoadingState() = _$SessionLoggerLoadingStateImpl;
  const SessionLoggerLoadingState._() : super._();
}

/// @nodoc
abstract class _$$SessionLoggerErrorStateImplCopyWith<$Res> {
  factory _$$SessionLoggerErrorStateImplCopyWith(
          _$SessionLoggerErrorStateImpl value,
          $Res Function(_$SessionLoggerErrorStateImpl) then) =
      __$$SessionLoggerErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionLoggerErrorStateImplCopyWithImpl<$Res>
    extends _$SessionLoggerStateCopyWithImpl<$Res,
        _$SessionLoggerErrorStateImpl>
    implements _$$SessionLoggerErrorStateImplCopyWith<$Res> {
  __$$SessionLoggerErrorStateImplCopyWithImpl(
      _$SessionLoggerErrorStateImpl _value,
      $Res Function(_$SessionLoggerErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionLoggerErrorStateImpl extends SessionLoggerErrorState {
  const _$SessionLoggerErrorStateImpl() : super._();

  @override
  String toString() {
    return 'SessionLoggerState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionLoggerErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saving,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saved,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
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
    required TResult Function(SessionLoggerInitialState value) initial,
    required TResult Function(SessionLoggerLoadingState value) loading,
    required TResult Function(SessionLoggerErrorState value) error,
    required TResult Function(SessionLoggerSavingState value) saving,
    required TResult Function(SessionLoggerSavedState value) saved,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionLoggerInitialState value)? initial,
    TResult? Function(SessionLoggerLoadingState value)? loading,
    TResult? Function(SessionLoggerErrorState value)? error,
    TResult? Function(SessionLoggerSavingState value)? saving,
    TResult? Function(SessionLoggerSavedState value)? saved,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionLoggerInitialState value)? initial,
    TResult Function(SessionLoggerLoadingState value)? loading,
    TResult Function(SessionLoggerErrorState value)? error,
    TResult Function(SessionLoggerSavingState value)? saving,
    TResult Function(SessionLoggerSavedState value)? saved,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SessionLoggerErrorState extends SessionLoggerState {
  const factory SessionLoggerErrorState() = _$SessionLoggerErrorStateImpl;
  const SessionLoggerErrorState._() : super._();
}

/// @nodoc
abstract class _$$SessionLoggerSavingStateImplCopyWith<$Res> {
  factory _$$SessionLoggerSavingStateImplCopyWith(
          _$SessionLoggerSavingStateImpl value,
          $Res Function(_$SessionLoggerSavingStateImpl) then) =
      __$$SessionLoggerSavingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile oldProfile, Session session, Profile updatedProfile});

  $ProfileCopyWith<$Res> get oldProfile;
  $SessionCopyWith<$Res> get session;
  $ProfileCopyWith<$Res> get updatedProfile;
}

/// @nodoc
class __$$SessionLoggerSavingStateImplCopyWithImpl<$Res>
    extends _$SessionLoggerStateCopyWithImpl<$Res,
        _$SessionLoggerSavingStateImpl>
    implements _$$SessionLoggerSavingStateImplCopyWith<$Res> {
  __$$SessionLoggerSavingStateImplCopyWithImpl(
      _$SessionLoggerSavingStateImpl _value,
      $Res Function(_$SessionLoggerSavingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldProfile = null,
    Object? session = null,
    Object? updatedProfile = null,
  }) {
    return _then(_$SessionLoggerSavingStateImpl(
      oldProfile: null == oldProfile
          ? _value.oldProfile
          : oldProfile // ignore: cast_nullable_to_non_nullable
              as Profile,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
      updatedProfile: null == updatedProfile
          ? _value.updatedProfile
          : updatedProfile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get oldProfile {
    return $ProfileCopyWith<$Res>(_value.oldProfile, (value) {
      return _then(_value.copyWith(oldProfile: value));
    });
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value));
    });
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get updatedProfile {
    return $ProfileCopyWith<$Res>(_value.updatedProfile, (value) {
      return _then(_value.copyWith(updatedProfile: value));
    });
  }
}

/// @nodoc

class _$SessionLoggerSavingStateImpl extends SessionLoggerSavingState {
  const _$SessionLoggerSavingStateImpl(
      {required this.oldProfile,
      required this.session,
      required this.updatedProfile})
      : super._();

  @override
  final Profile oldProfile;
  @override
  final Session session;
  @override
  final Profile updatedProfile;

  @override
  String toString() {
    return 'SessionLoggerState.saving(oldProfile: $oldProfile, session: $session, updatedProfile: $updatedProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionLoggerSavingStateImpl &&
            (identical(other.oldProfile, oldProfile) ||
                other.oldProfile == oldProfile) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.updatedProfile, updatedProfile) ||
                other.updatedProfile == updatedProfile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, oldProfile, session, updatedProfile);

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionLoggerSavingStateImplCopyWith<_$SessionLoggerSavingStateImpl>
      get copyWith => __$$SessionLoggerSavingStateImplCopyWithImpl<
          _$SessionLoggerSavingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saving,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saved,
  }) {
    return saving(oldProfile, session, updatedProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
  }) {
    return saving?.call(oldProfile, session, updatedProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(oldProfile, session, updatedProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionLoggerInitialState value) initial,
    required TResult Function(SessionLoggerLoadingState value) loading,
    required TResult Function(SessionLoggerErrorState value) error,
    required TResult Function(SessionLoggerSavingState value) saving,
    required TResult Function(SessionLoggerSavedState value) saved,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionLoggerInitialState value)? initial,
    TResult? Function(SessionLoggerLoadingState value)? loading,
    TResult? Function(SessionLoggerErrorState value)? error,
    TResult? Function(SessionLoggerSavingState value)? saving,
    TResult? Function(SessionLoggerSavedState value)? saved,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionLoggerInitialState value)? initial,
    TResult Function(SessionLoggerLoadingState value)? loading,
    TResult Function(SessionLoggerErrorState value)? error,
    TResult Function(SessionLoggerSavingState value)? saving,
    TResult Function(SessionLoggerSavedState value)? saved,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class SessionLoggerSavingState extends SessionLoggerState {
  const factory SessionLoggerSavingState(
      {required final Profile oldProfile,
      required final Session session,
      required final Profile updatedProfile}) = _$SessionLoggerSavingStateImpl;
  const SessionLoggerSavingState._() : super._();

  Profile get oldProfile;
  Session get session;
  Profile get updatedProfile;

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionLoggerSavingStateImplCopyWith<_$SessionLoggerSavingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionLoggerSavedStateImplCopyWith<$Res> {
  factory _$$SessionLoggerSavedStateImplCopyWith(
          _$SessionLoggerSavedStateImpl value,
          $Res Function(_$SessionLoggerSavedStateImpl) then) =
      __$$SessionLoggerSavedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile oldProfile, Session session, Profile updatedProfile});

  $ProfileCopyWith<$Res> get oldProfile;
  $SessionCopyWith<$Res> get session;
  $ProfileCopyWith<$Res> get updatedProfile;
}

/// @nodoc
class __$$SessionLoggerSavedStateImplCopyWithImpl<$Res>
    extends _$SessionLoggerStateCopyWithImpl<$Res,
        _$SessionLoggerSavedStateImpl>
    implements _$$SessionLoggerSavedStateImplCopyWith<$Res> {
  __$$SessionLoggerSavedStateImplCopyWithImpl(
      _$SessionLoggerSavedStateImpl _value,
      $Res Function(_$SessionLoggerSavedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldProfile = null,
    Object? session = null,
    Object? updatedProfile = null,
  }) {
    return _then(_$SessionLoggerSavedStateImpl(
      oldProfile: null == oldProfile
          ? _value.oldProfile
          : oldProfile // ignore: cast_nullable_to_non_nullable
              as Profile,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
      updatedProfile: null == updatedProfile
          ? _value.updatedProfile
          : updatedProfile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get oldProfile {
    return $ProfileCopyWith<$Res>(_value.oldProfile, (value) {
      return _then(_value.copyWith(oldProfile: value));
    });
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value));
    });
  }

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get updatedProfile {
    return $ProfileCopyWith<$Res>(_value.updatedProfile, (value) {
      return _then(_value.copyWith(updatedProfile: value));
    });
  }
}

/// @nodoc

class _$SessionLoggerSavedStateImpl extends SessionLoggerSavedState {
  const _$SessionLoggerSavedStateImpl(
      {required this.oldProfile,
      required this.session,
      required this.updatedProfile})
      : super._();

  @override
  final Profile oldProfile;
  @override
  final Session session;
  @override
  final Profile updatedProfile;

  @override
  String toString() {
    return 'SessionLoggerState.saved(oldProfile: $oldProfile, session: $session, updatedProfile: $updatedProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionLoggerSavedStateImpl &&
            (identical(other.oldProfile, oldProfile) ||
                other.oldProfile == oldProfile) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.updatedProfile, updatedProfile) ||
                other.updatedProfile == updatedProfile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, oldProfile, session, updatedProfile);

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionLoggerSavedStateImplCopyWith<_$SessionLoggerSavedStateImpl>
      get copyWith => __$$SessionLoggerSavedStateImplCopyWithImpl<
          _$SessionLoggerSavedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saving,
    required TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)
        saved,
  }) {
    return saved(oldProfile, session, updatedProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult? Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
  }) {
    return saved?.call(oldProfile, session, updatedProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saving,
    TResult Function(
            Profile oldProfile, Session session, Profile updatedProfile)?
        saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(oldProfile, session, updatedProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionLoggerInitialState value) initial,
    required TResult Function(SessionLoggerLoadingState value) loading,
    required TResult Function(SessionLoggerErrorState value) error,
    required TResult Function(SessionLoggerSavingState value) saving,
    required TResult Function(SessionLoggerSavedState value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionLoggerInitialState value)? initial,
    TResult? Function(SessionLoggerLoadingState value)? loading,
    TResult? Function(SessionLoggerErrorState value)? error,
    TResult? Function(SessionLoggerSavingState value)? saving,
    TResult? Function(SessionLoggerSavedState value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionLoggerInitialState value)? initial,
    TResult Function(SessionLoggerLoadingState value)? loading,
    TResult Function(SessionLoggerErrorState value)? error,
    TResult Function(SessionLoggerSavingState value)? saving,
    TResult Function(SessionLoggerSavedState value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class SessionLoggerSavedState extends SessionLoggerState {
  const factory SessionLoggerSavedState(
      {required final Profile oldProfile,
      required final Session session,
      required final Profile updatedProfile}) = _$SessionLoggerSavedStateImpl;
  const SessionLoggerSavedState._() : super._();

  Profile get oldProfile;
  Session get session;
  Profile get updatedProfile;

  /// Create a copy of SessionLoggerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionLoggerSavedStateImplCopyWith<_$SessionLoggerSavedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
