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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SessionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, TimerSettings timerSettings)
        addSession,
    required TResult Function(Profile profile) loadSessions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult? Function(Profile profile)? loadSessions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult Function(Profile profile)? loadSessions,
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
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$SessionsEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'SessionsEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
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
    required TResult Function(Profile profile) loadSessions,
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
    TResult? Function(Profile profile)? loadSessions,
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
    TResult Function(Profile profile)? loadSessions,
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
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$AddSessionEventCopyWith<$Res> {
  factory _$$AddSessionEventCopyWith(
          _$AddSessionEvent value, $Res Function(_$AddSessionEvent) then) =
      __$$AddSessionEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String profileId,
      DateTime startTime,
      DateTime endTime,
      TimerSettings timerSettings});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$AddSessionEventCopyWithImpl<$Res>
    extends _$SessionsEventCopyWithImpl<$Res, _$AddSessionEvent>
    implements _$$AddSessionEventCopyWith<$Res> {
  __$$AddSessionEventCopyWithImpl(
      _$AddSessionEvent _value, $Res Function(_$AddSessionEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? timerSettings = null,
  }) {
    return _then(_$AddSessionEvent(
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

class _$AddSessionEvent implements AddSessionEvent {
  const _$AddSessionEvent(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSessionEvent &&
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
  _$$AddSessionEventCopyWith<_$AddSessionEvent> get copyWith =>
      __$$AddSessionEventCopyWithImpl<_$AddSessionEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, TimerSettings timerSettings)
        addSession,
    required TResult Function(Profile profile) loadSessions,
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
    TResult? Function(Profile profile)? loadSessions,
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
    TResult Function(Profile profile)? loadSessions,
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
      required final TimerSettings timerSettings}) = _$AddSessionEvent;

  String get profileId;
  DateTime get startTime;
  DateTime get endTime;
  TimerSettings get timerSettings;
  @JsonKey(ignore: true)
  _$$AddSessionEventCopyWith<_$AddSessionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSessionsEventCopyWith<$Res> {
  factory _$$LoadSessionsEventCopyWith(
          _$LoadSessionsEvent value, $Res Function(_$LoadSessionsEvent) then) =
      __$$LoadSessionsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$LoadSessionsEventCopyWithImpl<$Res>
    extends _$SessionsEventCopyWithImpl<$Res, _$LoadSessionsEvent>
    implements _$$LoadSessionsEventCopyWith<$Res> {
  __$$LoadSessionsEventCopyWithImpl(
      _$LoadSessionsEvent _value, $Res Function(_$LoadSessionsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$LoadSessionsEvent(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$LoadSessionsEvent implements LoadSessionsEvent {
  const _$LoadSessionsEvent({required this.profile});

  @override
  final Profile profile;

  @override
  String toString() {
    return 'SessionsEvent.loadSessions(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSessionsEvent &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSessionsEventCopyWith<_$LoadSessionsEvent> get copyWith =>
      __$$LoadSessionsEventCopyWithImpl<_$LoadSessionsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, TimerSettings timerSettings)
        addSession,
    required TResult Function(Profile profile) loadSessions,
  }) {
    return loadSessions(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult? Function(Profile profile)? loadSessions,
  }) {
    return loadSessions?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            TimerSettings timerSettings)?
        addSession,
    TResult Function(Profile profile)? loadSessions,
    required TResult orElse(),
  }) {
    if (loadSessions != null) {
      return loadSessions(profile);
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
  const factory LoadSessionsEvent({required final Profile profile}) =
      _$LoadSessionsEvent;

  Profile get profile;
  @JsonKey(ignore: true)
  _$$LoadSessionsEventCopyWith<_$LoadSessionsEvent> get copyWith =>
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
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SessionsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
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
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$SessionsLoadingCopyWith<$Res> {
  factory _$$SessionsLoadingCopyWith(
          _$SessionsLoading value, $Res Function(_$SessionsLoading) then) =
      __$$SessionsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionsLoadingCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsLoading>
    implements _$$SessionsLoadingCopyWith<$Res> {
  __$$SessionsLoadingCopyWithImpl(
      _$SessionsLoading _value, $Res Function(_$SessionsLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SessionsLoading implements SessionsLoading {
  const _$SessionsLoading();

  @override
  String toString() {
    return 'SessionsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionsLoading);
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
  const factory SessionsLoading() = _$SessionsLoading;
}

/// @nodoc
abstract class _$$SessionsLoadedCopyWith<$Res> {
  factory _$$SessionsLoadedCopyWith(
          _$SessionsLoaded value, $Res Function(_$SessionsLoaded) then) =
      __$$SessionsLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Session> sessions});
}

/// @nodoc
class __$$SessionsLoadedCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsLoaded>
    implements _$$SessionsLoadedCopyWith<$Res> {
  __$$SessionsLoadedCopyWithImpl(
      _$SessionsLoaded _value, $Res Function(_$SessionsLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
  }) {
    return _then(_$SessionsLoaded(
      sessions: null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc

class _$SessionsLoaded implements SessionsLoaded {
  const _$SessionsLoaded({required final List<Session> sessions})
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionsLoaded &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sessions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionsLoadedCopyWith<_$SessionsLoaded> get copyWith =>
      __$$SessionsLoadedCopyWithImpl<_$SessionsLoaded>(this, _$identity);

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
      _$SessionsLoaded;

  List<Session> get sessions;
  @JsonKey(ignore: true)
  _$$SessionsLoadedCopyWith<_$SessionsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionsLoadingErrorCopyWith<$Res> {
  factory _$$SessionsLoadingErrorCopyWith(_$SessionsLoadingError value,
          $Res Function(_$SessionsLoadingError) then) =
      __$$SessionsLoadingErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionsLoadingErrorCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsLoadingError>
    implements _$$SessionsLoadingErrorCopyWith<$Res> {
  __$$SessionsLoadingErrorCopyWithImpl(_$SessionsLoadingError _value,
      $Res Function(_$SessionsLoadingError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SessionsLoadingError implements SessionsLoadingError {
  const _$SessionsLoadingError();

  @override
  String toString() {
    return 'SessionsState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionsLoadingError);
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
  const factory SessionsLoadingError() = _$SessionsLoadingError;
}
