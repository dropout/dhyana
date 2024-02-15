// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sessions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, TimerSettings timerSettings)
        addSession,
    required TResult Function(String profileId) loadSessions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult? Function(String profileId)? loadSessions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult Function(String profileId)? loadSessions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(AddSessionEvent value) addSession,
    required TResult Function(LoadSessionsEvent value) loadSessions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddSessionEvent value)? addSession,
    TResult? Function(LoadSessionsEvent value)? loadSessions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddSessionEvent value)? addSession,
    TResult Function(LoadSessionsEvent value)? loadSessions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionsEventCopyWith<$Res> {
  factory $SessionsEventCopyWith(
          SessionsEvent value, $Res Function(SessionsEvent) then) =
      _$SessionsEventCopyWithImpl<$Res, SessionsEvent>;
}

/// @nodoc
class _$SessionsEventCopyWithImpl<$Res, $Val extends SessionsEvent>
    implements $SessionsEventCopyWith<$Res> {
  _$SessionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SessionsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SessionsEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, TimerSettings timerSettings)
        addSession,
    required TResult Function(String profileId) loadSessions,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult? Function(String profileId)? loadSessions,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult Function(String profileId)? loadSessions,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(AddSessionEvent value) addSession,
    required TResult Function(LoadSessionsEvent value) loadSessions,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddSessionEvent value)? addSession,
    TResult? Function(LoadSessionsEvent value)? loadSessions,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddSessionEvent value)? addSession,
    TResult Function(LoadSessionsEvent value)? loadSessions,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SessionsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$AddSessionEventImplCopyWith<$Res> {
  factory _$$AddSessionEventImplCopyWith(_$AddSessionEventImpl value,
          $Res Function(_$AddSessionEventImpl) then) =
      __$$AddSessionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String profileId,
      DateTime startTime,
      DateTime endTime,
      TimerSettings timerSettings});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$AddSessionEventImplCopyWithImpl<$Res>
    extends _$SessionsEventCopyWithImpl<$Res, _$AddSessionEventImpl>
    implements _$$AddSessionEventImplCopyWith<$Res> {
  __$$AddSessionEventImplCopyWithImpl(
      _$AddSessionEventImpl _value, $Res Function(_$AddSessionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? timerSettings = null,
  }) {
    return _then(_$AddSessionEventImpl(
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
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_value.timerSettings, (value) {
      return _then(_value.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc

class _$AddSessionEventImpl implements AddSessionEvent {
  const _$AddSessionEventImpl(
      {required this.profileId,
      required this.startTime,
      required this.endTime,
      required this.timerSettings});

  @override
  final String profileId;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final TimerSettings timerSettings;

  @override
  String toString() {
    return 'SessionsEvent.addSession(profileId: $profileId, startTime: $startTime, endTime: $endTime, timerSettings: $timerSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSessionEventImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profileId, startTime, endTime, timerSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSessionEventImplCopyWith<_$AddSessionEventImpl> get copyWith =>
      __$$AddSessionEventImplCopyWithImpl<_$AddSessionEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, TimerSettings timerSettings)
        addSession,
    required TResult Function(String profileId) loadSessions,
  }) {
    return addSession(profileId, startTime, endTime, timerSettings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult? Function(String profileId)? loadSessions,
  }) {
    return addSession?.call(profileId, startTime, endTime, timerSettings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult Function(String profileId)? loadSessions,
    required TResult orElse(),
  }) {
    if (addSession != null) {
      return addSession(profileId, startTime, endTime, timerSettings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(AddSessionEvent value) addSession,
    required TResult Function(LoadSessionsEvent value) loadSessions,
  }) {
    return addSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddSessionEvent value)? addSession,
    TResult? Function(LoadSessionsEvent value)? loadSessions,
  }) {
    return addSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddSessionEvent value)? addSession,
    TResult Function(LoadSessionsEvent value)? loadSessions,
    required TResult orElse(),
  }) {
    if (addSession != null) {
      return addSession(this);
    }
    return orElse();
  }
}

abstract class AddSessionEvent implements SessionsEvent {
  const factory AddSessionEvent(
      {required final String profileId,
      required final DateTime startTime,
      required final DateTime endTime,
      required final TimerSettings timerSettings}) = _$AddSessionEventImpl;

  String get profileId;
  DateTime get startTime;
  DateTime get endTime;
  TimerSettings get timerSettings;
  @JsonKey(ignore: true)
  _$$AddSessionEventImplCopyWith<_$AddSessionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSessionsEventImplCopyWith<$Res> {
  factory _$$LoadSessionsEventImplCopyWith(_$LoadSessionsEventImpl value,
          $Res Function(_$LoadSessionsEventImpl) then) =
      __$$LoadSessionsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String profileId});
}

/// @nodoc
class __$$LoadSessionsEventImplCopyWithImpl<$Res>
    extends _$SessionsEventCopyWithImpl<$Res, _$LoadSessionsEventImpl>
    implements _$$LoadSessionsEventImplCopyWith<$Res> {
  __$$LoadSessionsEventImplCopyWithImpl(_$LoadSessionsEventImpl _value,
      $Res Function(_$LoadSessionsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
  }) {
    return _then(_$LoadSessionsEventImpl(
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadSessionsEventImpl implements LoadSessionsEvent {
  const _$LoadSessionsEventImpl({required this.profileId});

  @override
  final String profileId;

  @override
  String toString() {
    return 'SessionsEvent.loadSessions(profileId: $profileId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSessionsEventImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSessionsEventImplCopyWith<_$LoadSessionsEventImpl> get copyWith =>
      __$$LoadSessionsEventImplCopyWithImpl<_$LoadSessionsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, TimerSettings timerSettings)
        addSession,
    required TResult Function(String profileId) loadSessions,
  }) {
    return loadSessions(profileId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult? Function(String profileId)? loadSessions,
  }) {
    return loadSessions?.call(profileId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult Function(String profileId)? loadSessions,
    required TResult orElse(),
  }) {
    if (loadSessions != null) {
      return loadSessions(profileId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(AddSessionEvent value) addSession,
    required TResult Function(LoadSessionsEvent value) loadSessions,
  }) {
    return loadSessions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddSessionEvent value)? addSession,
    TResult? Function(LoadSessionsEvent value)? loadSessions,
  }) {
    return loadSessions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddSessionEvent value)? addSession,
    TResult Function(LoadSessionsEvent value)? loadSessions,
    required TResult orElse(),
  }) {
    if (loadSessions != null) {
      return loadSessions(this);
    }
    return orElse();
  }
}

abstract class LoadSessionsEvent implements SessionsEvent {
  const factory LoadSessionsEvent({required final String profileId}) =
      _$LoadSessionsEventImpl;

  String get profileId;
  @JsonKey(ignore: true)
  _$$LoadSessionsEventImplCopyWith<_$LoadSessionsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Session> sessions) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Session> sessions)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Session> sessions)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SessionsLoading value) loading,
    required TResult Function(SessionsLoaded value) loaded,
    required TResult Function(SessionsLoadingError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SessionsLoading value)? loading,
    TResult? Function(SessionsLoaded value)? loaded,
    TResult? Function(SessionsLoadingError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SessionsLoading value)? loading,
    TResult Function(SessionsLoaded value)? loaded,
    TResult Function(SessionsLoadingError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionsStateCopyWith<$Res> {
  factory $SessionsStateCopyWith(
          SessionsState value, $Res Function(SessionsState) then) =
      _$SessionsStateCopyWithImpl<$Res, SessionsState>;
}

/// @nodoc
class _$SessionsStateCopyWithImpl<$Res, $Val extends SessionsState>
    implements $SessionsStateCopyWith<$Res> {
  _$SessionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SessionsState.initial()';
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
    required TResult Function(List<Session> sessions) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Session> sessions)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Session> sessions)? loaded,
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
    required TResult Function(SessionsLoading value) loading,
    required TResult Function(SessionsLoaded value) loaded,
    required TResult Function(SessionsLoadingError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SessionsLoading value)? loading,
    TResult? Function(SessionsLoaded value)? loaded,
    TResult? Function(SessionsLoadingError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SessionsLoading value)? loading,
    TResult Function(SessionsLoaded value)? loaded,
    TResult Function(SessionsLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SessionsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SessionsLoadingImplCopyWith<$Res> {
  factory _$$SessionsLoadingImplCopyWith(_$SessionsLoadingImpl value,
          $Res Function(_$SessionsLoadingImpl) then) =
      __$$SessionsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionsLoadingImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsLoadingImpl>
    implements _$$SessionsLoadingImplCopyWith<$Res> {
  __$$SessionsLoadingImplCopyWithImpl(
      _$SessionsLoadingImpl _value, $Res Function(_$SessionsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SessionsLoadingImpl implements SessionsLoading {
  const _$SessionsLoadingImpl();

  @override
  String toString() {
    return 'SessionsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Session> sessions) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Session> sessions)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Session> sessions)? loaded,
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
    required TResult Function(SessionsLoading value) loading,
    required TResult Function(SessionsLoaded value) loaded,
    required TResult Function(SessionsLoadingError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SessionsLoading value)? loading,
    TResult? Function(SessionsLoaded value)? loaded,
    TResult? Function(SessionsLoadingError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SessionsLoading value)? loading,
    TResult Function(SessionsLoaded value)? loaded,
    TResult Function(SessionsLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SessionsLoading implements SessionsState {
  const factory SessionsLoading() = _$SessionsLoadingImpl;
}

/// @nodoc
abstract class _$$SessionsLoadedImplCopyWith<$Res> {
  factory _$$SessionsLoadedImplCopyWith(_$SessionsLoadedImpl value,
          $Res Function(_$SessionsLoadedImpl) then) =
      __$$SessionsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Session> sessions});
}

/// @nodoc
class __$$SessionsLoadedImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsLoadedImpl>
    implements _$$SessionsLoadedImplCopyWith<$Res> {
  __$$SessionsLoadedImplCopyWithImpl(
      _$SessionsLoadedImpl _value, $Res Function(_$SessionsLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
  }) {
    return _then(_$SessionsLoadedImpl(
      sessions: null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc

class _$SessionsLoadedImpl implements SessionsLoaded {
  const _$SessionsLoadedImpl({required final List<Session> sessions})
      : _sessions = sessions;

  final List<Session> _sessions;
  @override
  List<Session> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  String toString() {
    return 'SessionsState.loaded(sessions: $sessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionsLoadedImpl &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sessions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionsLoadedImplCopyWith<_$SessionsLoadedImpl> get copyWith =>
      __$$SessionsLoadedImplCopyWithImpl<_$SessionsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Session> sessions) loaded,
    required TResult Function() error,
  }) {
    return loaded(sessions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Session> sessions)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(sessions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Session> sessions)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(sessions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SessionsLoading value) loading,
    required TResult Function(SessionsLoaded value) loaded,
    required TResult Function(SessionsLoadingError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SessionsLoading value)? loading,
    TResult? Function(SessionsLoaded value)? loaded,
    TResult? Function(SessionsLoadingError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SessionsLoading value)? loading,
    TResult Function(SessionsLoaded value)? loaded,
    TResult Function(SessionsLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SessionsLoaded implements SessionsState {
  const factory SessionsLoaded({required final List<Session> sessions}) =
      _$SessionsLoadedImpl;

  List<Session> get sessions;
  @JsonKey(ignore: true)
  _$$SessionsLoadedImplCopyWith<_$SessionsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionsLoadingErrorImplCopyWith<$Res> {
  factory _$$SessionsLoadingErrorImplCopyWith(_$SessionsLoadingErrorImpl value,
          $Res Function(_$SessionsLoadingErrorImpl) then) =
      __$$SessionsLoadingErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionsLoadingErrorImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsLoadingErrorImpl>
    implements _$$SessionsLoadingErrorImplCopyWith<$Res> {
  __$$SessionsLoadingErrorImplCopyWithImpl(_$SessionsLoadingErrorImpl _value,
      $Res Function(_$SessionsLoadingErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SessionsLoadingErrorImpl implements SessionsLoadingError {
  const _$SessionsLoadingErrorImpl();

  @override
  String toString() {
    return 'SessionsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionsLoadingErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Session> sessions) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Session> sessions)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Session> sessions)? loaded,
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
    required TResult Function(SessionsLoading value) loading,
    required TResult Function(SessionsLoaded value) loaded,
    required TResult Function(SessionsLoadingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SessionsLoading value)? loading,
    TResult? Function(SessionsLoaded value)? loaded,
    TResult? Function(SessionsLoadingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SessionsLoading value)? loading,
    TResult Function(SessionsLoaded value)? loaded,
    TResult Function(SessionsLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SessionsLoadingError implements SessionsState {
  const factory SessionsLoadingError() = _$SessionsLoadingErrorImpl;
}
