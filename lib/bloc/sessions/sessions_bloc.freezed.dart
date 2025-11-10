// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionsEvent()';
}


}

/// @nodoc
class $SessionsEventCopyWith<$Res>  {
$SessionsEventCopyWith(SessionsEvent _, $Res Function(SessionsEvent) __);
}


/// Adds pattern-matching-related methods to [SessionsEvent].
extension SessionsEventPatterns on SessionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( LoadSessionsEvent value)?  loadSessions,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case LoadSessionsEvent() when loadSessions != null:
return loadSessions(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( LoadSessionsEvent value)  loadSessions,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case LoadSessionsEvent():
return loadSessions(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( LoadSessionsEvent value)?  loadSessions,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case LoadSessionsEvent() when loadSessions != null:
return loadSessions(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String profileId)?  loadSessions,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case LoadSessionsEvent() when loadSessions != null:
return loadSessions(_that.profileId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String profileId)  loadSessions,}) {final _that = this;
switch (_that) {
case _Started():
return started();case LoadSessionsEvent():
return loadSessions(_that.profileId);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String profileId)?  loadSessions,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case LoadSessionsEvent() when loadSessions != null:
return loadSessions(_that.profileId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SessionsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
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
  

 final  String profileId;

/// Create a copy of SessionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadSessionsEventCopyWith<LoadSessionsEvent> get copyWith => _$LoadSessionsEventCopyWithImpl<LoadSessionsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadSessionsEvent&&(identical(other.profileId, profileId) || other.profileId == profileId));
}


@override
int get hashCode => Object.hash(runtimeType,profileId);

@override
String toString() {
  return 'SessionsEvent.loadSessions(profileId: $profileId)';
}


}

/// @nodoc
abstract mixin class $LoadSessionsEventCopyWith<$Res> implements $SessionsEventCopyWith<$Res> {
  factory $LoadSessionsEventCopyWith(LoadSessionsEvent value, $Res Function(LoadSessionsEvent) _then) = _$LoadSessionsEventCopyWithImpl;
@useResult
$Res call({
 String profileId
});




}
/// @nodoc
class _$LoadSessionsEventCopyWithImpl<$Res>
    implements $LoadSessionsEventCopyWith<$Res> {
  _$LoadSessionsEventCopyWithImpl(this._self, this._then);

  final LoadSessionsEvent _self;
  final $Res Function(LoadSessionsEvent) _then;

/// Create a copy of SessionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileId = null,}) {
  return _then(LoadSessionsEvent(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SessionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionsState()';
}


}

/// @nodoc
class $SessionsStateCopyWith<$Res>  {
$SessionsStateCopyWith(SessionsState _, $Res Function(SessionsState) __);
}


/// Adds pattern-matching-related methods to [SessionsState].
extension SessionsStatePatterns on SessionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SessionsLoading value)?  loading,TResult Function( SessionsLoaded value)?  loaded,TResult Function( SessionsLoadingError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SessionsLoading() when loading != null:
return loading(_that);case SessionsLoaded() when loaded != null:
return loaded(_that);case SessionsLoadingError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SessionsLoading value)  loading,required TResult Function( SessionsLoaded value)  loaded,required TResult Function( SessionsLoadingError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SessionsLoading():
return loading(_that);case SessionsLoaded():
return loaded(_that);case SessionsLoadingError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SessionsLoading value)?  loading,TResult? Function( SessionsLoaded value)?  loaded,TResult? Function( SessionsLoadingError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SessionsLoading() when loading != null:
return loading(_that);case SessionsLoaded() when loaded != null:
return loaded(_that);case SessionsLoadingError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Session> sessions)?  loaded,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SessionsLoading() when loading != null:
return loading();case SessionsLoaded() when loaded != null:
return loaded(_that.sessions);case SessionsLoadingError() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Session> sessions)  loaded,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SessionsLoading():
return loading();case SessionsLoaded():
return loaded(_that.sessions);case SessionsLoadingError():
return error();case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Session> sessions)?  loaded,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SessionsLoading() when loading != null:
return loading();case SessionsLoaded() when loaded != null:
return loaded(_that.sessions);case SessionsLoadingError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SessionsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsLoading);
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
  const SessionsLoaded({required final  List<Session> sessions}): _sessions = sessions;
  

 final  List<Session> _sessions;
 List<Session> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of SessionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionsLoadedCopyWith<SessionsLoaded> get copyWith => _$SessionsLoadedCopyWithImpl<SessionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsLoaded&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'SessionsState.loaded(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $SessionsLoadedCopyWith<$Res> implements $SessionsStateCopyWith<$Res> {
  factory $SessionsLoadedCopyWith(SessionsLoaded value, $Res Function(SessionsLoaded) _then) = _$SessionsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Session> sessions
});




}
/// @nodoc
class _$SessionsLoadedCopyWithImpl<$Res>
    implements $SessionsLoadedCopyWith<$Res> {
  _$SessionsLoadedCopyWithImpl(this._self, this._then);

  final SessionsLoaded _self;
  final $Res Function(SessionsLoaded) _then;

/// Create a copy of SessionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessions = null,}) {
  return _then(SessionsLoaded(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}


}

/// @nodoc


class SessionsLoadingError implements SessionsState {
  const SessionsLoadingError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsLoadingError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionsState.error()';
}


}




// dart format on
