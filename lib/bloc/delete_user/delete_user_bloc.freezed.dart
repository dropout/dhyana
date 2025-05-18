// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeleteUserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteUserActionEvent value) deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteUserActionEvent value)? deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteUserActionEvent value)? deleteUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteUserEventCopyWith<$Res> {
  factory $DeleteUserEventCopyWith(
          DeleteUserEvent value, $Res Function(DeleteUserEvent) then) =
      _$DeleteUserEventCopyWithImpl<$Res, DeleteUserEvent>;
}

/// @nodoc
class _$DeleteUserEventCopyWithImpl<$Res, $Val extends DeleteUserEvent>
    implements $DeleteUserEventCopyWith<$Res> {
  _$DeleteUserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteUserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeleteUserActionEventImplCopyWith<$Res> {
  factory _$$DeleteUserActionEventImplCopyWith(
          _$DeleteUserActionEventImpl value,
          $Res Function(_$DeleteUserActionEventImpl) then) =
      __$$DeleteUserActionEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteUserActionEventImplCopyWithImpl<$Res>
    extends _$DeleteUserEventCopyWithImpl<$Res, _$DeleteUserActionEventImpl>
    implements _$$DeleteUserActionEventImplCopyWith<$Res> {
  __$$DeleteUserActionEventImplCopyWithImpl(_$DeleteUserActionEventImpl _value,
      $Res Function(_$DeleteUserActionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteUserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteUserActionEventImpl implements DeleteUserActionEvent {
  const _$DeleteUserActionEventImpl();

  @override
  String toString() {
    return 'DeleteUserEvent.deleteUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserActionEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deleteUser,
  }) {
    return deleteUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deleteUser,
  }) {
    return deleteUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteUserActionEvent value) deleteUser,
  }) {
    return deleteUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteUserActionEvent value)? deleteUser,
  }) {
    return deleteUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteUserActionEvent value)? deleteUser,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(this);
    }
    return orElse();
  }
}

abstract class DeleteUserActionEvent implements DeleteUserEvent {
  const factory DeleteUserActionEvent() = _$DeleteUserActionEventImpl;
}

/// @nodoc
mixin _$DeleteUserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() completed,
    required TResult Function() authRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? completed,
    TResult? Function()? authRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? completed,
    TResult Function()? authRequired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteUserInitialState value) initial,
    required TResult Function(DeleteUserLoadingState value) loading,
    required TResult Function(DeleteUserErrorState value) error,
    required TResult Function(DeleteUserCompletedState value) completed,
    required TResult Function(DeleteUserAuthRequiredState value) authRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteUserInitialState value)? initial,
    TResult? Function(DeleteUserLoadingState value)? loading,
    TResult? Function(DeleteUserErrorState value)? error,
    TResult? Function(DeleteUserCompletedState value)? completed,
    TResult? Function(DeleteUserAuthRequiredState value)? authRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteUserInitialState value)? initial,
    TResult Function(DeleteUserLoadingState value)? loading,
    TResult Function(DeleteUserErrorState value)? error,
    TResult Function(DeleteUserCompletedState value)? completed,
    TResult Function(DeleteUserAuthRequiredState value)? authRequired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteUserStateCopyWith<$Res> {
  factory $DeleteUserStateCopyWith(
          DeleteUserState value, $Res Function(DeleteUserState) then) =
      _$DeleteUserStateCopyWithImpl<$Res, DeleteUserState>;
}

/// @nodoc
class _$DeleteUserStateCopyWithImpl<$Res, $Val extends DeleteUserState>
    implements $DeleteUserStateCopyWith<$Res> {
  _$DeleteUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteUserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeleteUserInitialStateImplCopyWith<$Res> {
  factory _$$DeleteUserInitialStateImplCopyWith(
          _$DeleteUserInitialStateImpl value,
          $Res Function(_$DeleteUserInitialStateImpl) then) =
      __$$DeleteUserInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteUserInitialStateImplCopyWithImpl<$Res>
    extends _$DeleteUserStateCopyWithImpl<$Res, _$DeleteUserInitialStateImpl>
    implements _$$DeleteUserInitialStateImplCopyWith<$Res> {
  __$$DeleteUserInitialStateImplCopyWithImpl(
      _$DeleteUserInitialStateImpl _value,
      $Res Function(_$DeleteUserInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteUserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteUserInitialStateImpl extends DeleteUserInitialState {
  const _$DeleteUserInitialStateImpl() : super._();

  @override
  String toString() {
    return 'DeleteUserState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() completed,
    required TResult Function() authRequired,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? completed,
    TResult? Function()? authRequired,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? completed,
    TResult Function()? authRequired,
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
    required TResult Function(DeleteUserInitialState value) initial,
    required TResult Function(DeleteUserLoadingState value) loading,
    required TResult Function(DeleteUserErrorState value) error,
    required TResult Function(DeleteUserCompletedState value) completed,
    required TResult Function(DeleteUserAuthRequiredState value) authRequired,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteUserInitialState value)? initial,
    TResult? Function(DeleteUserLoadingState value)? loading,
    TResult? Function(DeleteUserErrorState value)? error,
    TResult? Function(DeleteUserCompletedState value)? completed,
    TResult? Function(DeleteUserAuthRequiredState value)? authRequired,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteUserInitialState value)? initial,
    TResult Function(DeleteUserLoadingState value)? loading,
    TResult Function(DeleteUserErrorState value)? error,
    TResult Function(DeleteUserCompletedState value)? completed,
    TResult Function(DeleteUserAuthRequiredState value)? authRequired,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DeleteUserInitialState extends DeleteUserState {
  const factory DeleteUserInitialState() = _$DeleteUserInitialStateImpl;
  const DeleteUserInitialState._() : super._();
}

/// @nodoc
abstract class _$$DeleteUserLoadingStateImplCopyWith<$Res> {
  factory _$$DeleteUserLoadingStateImplCopyWith(
          _$DeleteUserLoadingStateImpl value,
          $Res Function(_$DeleteUserLoadingStateImpl) then) =
      __$$DeleteUserLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteUserLoadingStateImplCopyWithImpl<$Res>
    extends _$DeleteUserStateCopyWithImpl<$Res, _$DeleteUserLoadingStateImpl>
    implements _$$DeleteUserLoadingStateImplCopyWith<$Res> {
  __$$DeleteUserLoadingStateImplCopyWithImpl(
      _$DeleteUserLoadingStateImpl _value,
      $Res Function(_$DeleteUserLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteUserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteUserLoadingStateImpl extends DeleteUserLoadingState {
  const _$DeleteUserLoadingStateImpl() : super._();

  @override
  String toString() {
    return 'DeleteUserState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() completed,
    required TResult Function() authRequired,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? completed,
    TResult? Function()? authRequired,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? completed,
    TResult Function()? authRequired,
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
    required TResult Function(DeleteUserInitialState value) initial,
    required TResult Function(DeleteUserLoadingState value) loading,
    required TResult Function(DeleteUserErrorState value) error,
    required TResult Function(DeleteUserCompletedState value) completed,
    required TResult Function(DeleteUserAuthRequiredState value) authRequired,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteUserInitialState value)? initial,
    TResult? Function(DeleteUserLoadingState value)? loading,
    TResult? Function(DeleteUserErrorState value)? error,
    TResult? Function(DeleteUserCompletedState value)? completed,
    TResult? Function(DeleteUserAuthRequiredState value)? authRequired,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteUserInitialState value)? initial,
    TResult Function(DeleteUserLoadingState value)? loading,
    TResult Function(DeleteUserErrorState value)? error,
    TResult Function(DeleteUserCompletedState value)? completed,
    TResult Function(DeleteUserAuthRequiredState value)? authRequired,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DeleteUserLoadingState extends DeleteUserState {
  const factory DeleteUserLoadingState() = _$DeleteUserLoadingStateImpl;
  const DeleteUserLoadingState._() : super._();
}

/// @nodoc
abstract class _$$DeleteUserErrorStateImplCopyWith<$Res> {
  factory _$$DeleteUserErrorStateImplCopyWith(_$DeleteUserErrorStateImpl value,
          $Res Function(_$DeleteUserErrorStateImpl) then) =
      __$$DeleteUserErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteUserErrorStateImplCopyWithImpl<$Res>
    extends _$DeleteUserStateCopyWithImpl<$Res, _$DeleteUserErrorStateImpl>
    implements _$$DeleteUserErrorStateImplCopyWith<$Res> {
  __$$DeleteUserErrorStateImplCopyWithImpl(_$DeleteUserErrorStateImpl _value,
      $Res Function(_$DeleteUserErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteUserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteUserErrorStateImpl extends DeleteUserErrorState {
  const _$DeleteUserErrorStateImpl() : super._();

  @override
  String toString() {
    return 'DeleteUserState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() completed,
    required TResult Function() authRequired,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? completed,
    TResult? Function()? authRequired,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? completed,
    TResult Function()? authRequired,
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
    required TResult Function(DeleteUserInitialState value) initial,
    required TResult Function(DeleteUserLoadingState value) loading,
    required TResult Function(DeleteUserErrorState value) error,
    required TResult Function(DeleteUserCompletedState value) completed,
    required TResult Function(DeleteUserAuthRequiredState value) authRequired,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteUserInitialState value)? initial,
    TResult? Function(DeleteUserLoadingState value)? loading,
    TResult? Function(DeleteUserErrorState value)? error,
    TResult? Function(DeleteUserCompletedState value)? completed,
    TResult? Function(DeleteUserAuthRequiredState value)? authRequired,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteUserInitialState value)? initial,
    TResult Function(DeleteUserLoadingState value)? loading,
    TResult Function(DeleteUserErrorState value)? error,
    TResult Function(DeleteUserCompletedState value)? completed,
    TResult Function(DeleteUserAuthRequiredState value)? authRequired,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DeleteUserErrorState extends DeleteUserState {
  const factory DeleteUserErrorState() = _$DeleteUserErrorStateImpl;
  const DeleteUserErrorState._() : super._();
}

/// @nodoc
abstract class _$$DeleteUserCompletedStateImplCopyWith<$Res> {
  factory _$$DeleteUserCompletedStateImplCopyWith(
          _$DeleteUserCompletedStateImpl value,
          $Res Function(_$DeleteUserCompletedStateImpl) then) =
      __$$DeleteUserCompletedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteUserCompletedStateImplCopyWithImpl<$Res>
    extends _$DeleteUserStateCopyWithImpl<$Res, _$DeleteUserCompletedStateImpl>
    implements _$$DeleteUserCompletedStateImplCopyWith<$Res> {
  __$$DeleteUserCompletedStateImplCopyWithImpl(
      _$DeleteUserCompletedStateImpl _value,
      $Res Function(_$DeleteUserCompletedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteUserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteUserCompletedStateImpl extends DeleteUserCompletedState {
  const _$DeleteUserCompletedStateImpl() : super._();

  @override
  String toString() {
    return 'DeleteUserState.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserCompletedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() completed,
    required TResult Function() authRequired,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? completed,
    TResult? Function()? authRequired,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? completed,
    TResult Function()? authRequired,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteUserInitialState value) initial,
    required TResult Function(DeleteUserLoadingState value) loading,
    required TResult Function(DeleteUserErrorState value) error,
    required TResult Function(DeleteUserCompletedState value) completed,
    required TResult Function(DeleteUserAuthRequiredState value) authRequired,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteUserInitialState value)? initial,
    TResult? Function(DeleteUserLoadingState value)? loading,
    TResult? Function(DeleteUserErrorState value)? error,
    TResult? Function(DeleteUserCompletedState value)? completed,
    TResult? Function(DeleteUserAuthRequiredState value)? authRequired,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteUserInitialState value)? initial,
    TResult Function(DeleteUserLoadingState value)? loading,
    TResult Function(DeleteUserErrorState value)? error,
    TResult Function(DeleteUserCompletedState value)? completed,
    TResult Function(DeleteUserAuthRequiredState value)? authRequired,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class DeleteUserCompletedState extends DeleteUserState {
  const factory DeleteUserCompletedState() = _$DeleteUserCompletedStateImpl;
  const DeleteUserCompletedState._() : super._();
}

/// @nodoc
abstract class _$$DeleteUserAuthRequiredStateImplCopyWith<$Res> {
  factory _$$DeleteUserAuthRequiredStateImplCopyWith(
          _$DeleteUserAuthRequiredStateImpl value,
          $Res Function(_$DeleteUserAuthRequiredStateImpl) then) =
      __$$DeleteUserAuthRequiredStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteUserAuthRequiredStateImplCopyWithImpl<$Res>
    extends _$DeleteUserStateCopyWithImpl<$Res,
        _$DeleteUserAuthRequiredStateImpl>
    implements _$$DeleteUserAuthRequiredStateImplCopyWith<$Res> {
  __$$DeleteUserAuthRequiredStateImplCopyWithImpl(
      _$DeleteUserAuthRequiredStateImpl _value,
      $Res Function(_$DeleteUserAuthRequiredStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteUserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteUserAuthRequiredStateImpl extends DeleteUserAuthRequiredState {
  const _$DeleteUserAuthRequiredStateImpl() : super._();

  @override
  String toString() {
    return 'DeleteUserState.authRequired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserAuthRequiredStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() completed,
    required TResult Function() authRequired,
  }) {
    return authRequired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? completed,
    TResult? Function()? authRequired,
  }) {
    return authRequired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? completed,
    TResult Function()? authRequired,
    required TResult orElse(),
  }) {
    if (authRequired != null) {
      return authRequired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteUserInitialState value) initial,
    required TResult Function(DeleteUserLoadingState value) loading,
    required TResult Function(DeleteUserErrorState value) error,
    required TResult Function(DeleteUserCompletedState value) completed,
    required TResult Function(DeleteUserAuthRequiredState value) authRequired,
  }) {
    return authRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteUserInitialState value)? initial,
    TResult? Function(DeleteUserLoadingState value)? loading,
    TResult? Function(DeleteUserErrorState value)? error,
    TResult? Function(DeleteUserCompletedState value)? completed,
    TResult? Function(DeleteUserAuthRequiredState value)? authRequired,
  }) {
    return authRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteUserInitialState value)? initial,
    TResult Function(DeleteUserLoadingState value)? loading,
    TResult Function(DeleteUserErrorState value)? error,
    TResult Function(DeleteUserCompletedState value)? completed,
    TResult Function(DeleteUserAuthRequiredState value)? authRequired,
    required TResult orElse(),
  }) {
    if (authRequired != null) {
      return authRequired(this);
    }
    return orElse();
  }
}

abstract class DeleteUserAuthRequiredState extends DeleteUserState {
  const factory DeleteUserAuthRequiredState() =
      _$DeleteUserAuthRequiredStateImpl;
  const DeleteUserAuthRequiredState._() : super._();
}
