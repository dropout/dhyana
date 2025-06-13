// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sessions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionsEvent()';
  }
}

/// @nodoc
class $SessionsEventCopyWith<$Res> {
  $SessionsEventCopyWith(SessionsEvent _, $Res Function(SessionsEvent) __);
}

/// @nodoc

class _Started implements SessionsEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionsEvent.started()';
  }
}

/// @nodoc

class LoadSessionsEvent implements SessionsEvent {
  const LoadSessionsEvent({required this.profileId});

  final String profileId;

  /// Create a copy of SessionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadSessionsEventCopyWith<LoadSessionsEvent> get copyWith =>
      _$LoadSessionsEventCopyWithImpl<LoadSessionsEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadSessionsEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId);

  @override
  String toString() {
    return 'SessionsEvent.loadSessions(profileId: $profileId)';
  }
}

/// @nodoc
abstract mixin class $LoadSessionsEventCopyWith<$Res>
    implements $SessionsEventCopyWith<$Res> {
  factory $LoadSessionsEventCopyWith(
          LoadSessionsEvent value, $Res Function(LoadSessionsEvent) _then) =
      _$LoadSessionsEventCopyWithImpl;
  @useResult
  $Res call({String profileId});
}

/// @nodoc
class _$LoadSessionsEventCopyWithImpl<$Res>
    implements $LoadSessionsEventCopyWith<$Res> {
  _$LoadSessionsEventCopyWithImpl(this._self, this._then);

  final LoadSessionsEvent _self;
  final $Res Function(LoadSessionsEvent) _then;

  /// Create a copy of SessionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
  }) {
    return _then(LoadSessionsEvent(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SessionsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionsState()';
  }
}

/// @nodoc
class $SessionsStateCopyWith<$Res> {
  $SessionsStateCopyWith(SessionsState _, $Res Function(SessionsState) __);
}

/// @nodoc

class _Initial implements SessionsState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionsState.initial()';
  }
}

/// @nodoc

class SessionsLoading implements SessionsState {
  const SessionsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionsState.loading()';
  }
}

/// @nodoc

class SessionsLoaded implements SessionsState {
  const SessionsLoaded({required final List<Session> sessions})
      : _sessions = sessions;

  final List<Session> _sessions;
  List<Session> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionsLoadedCopyWith<SessionsLoaded> get copyWith =>
      _$SessionsLoadedCopyWithImpl<SessionsLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionsLoaded &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sessions));

  @override
  String toString() {
    return 'SessionsState.loaded(sessions: $sessions)';
  }
}

/// @nodoc
abstract mixin class $SessionsLoadedCopyWith<$Res>
    implements $SessionsStateCopyWith<$Res> {
  factory $SessionsLoadedCopyWith(
          SessionsLoaded value, $Res Function(SessionsLoaded) _then) =
      _$SessionsLoadedCopyWithImpl;
  @useResult
  $Res call({List<Session> sessions});
}

/// @nodoc
class _$SessionsLoadedCopyWithImpl<$Res>
    implements $SessionsLoadedCopyWith<$Res> {
  _$SessionsLoadedCopyWithImpl(this._self, this._then);

  final SessionsLoaded _self;
  final $Res Function(SessionsLoaded) _then;

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessions = null,
  }) {
    return _then(SessionsLoaded(
      sessions: null == sessions
          ? _self._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc

class SessionsLoadingError implements SessionsState {
  const SessionsLoadingError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionsLoadingError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionsState.error()';
  }
}

// dart format on
