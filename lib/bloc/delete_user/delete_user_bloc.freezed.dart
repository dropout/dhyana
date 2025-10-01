// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteUserEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteUserEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserEvent()';
  }
}

/// @nodoc
class $DeleteUserEventCopyWith<$Res> {
  $DeleteUserEventCopyWith(
      DeleteUserEvent _, $Res Function(DeleteUserEvent) __);
}

/// Adds pattern-matching-related methods to [DeleteUserEvent].
extension DeleteUserEventPatterns on DeleteUserEvent {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteUserActionEvent value)? deleteUser,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserActionEvent() when deleteUser != null:
        return deleteUser(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteUserActionEvent value) deleteUser,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserActionEvent():
        return deleteUser(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteUserActionEvent value)? deleteUser,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserActionEvent() when deleteUser != null:
        return deleteUser(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserActionEvent() when deleteUser != null:
        return deleteUser();
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deleteUser,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserActionEvent():
        return deleteUser();
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deleteUser,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserActionEvent() when deleteUser != null:
        return deleteUser();
      case _:
        return null;
    }
  }
}

/// @nodoc

class DeleteUserActionEvent implements DeleteUserEvent {
  const DeleteUserActionEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteUserActionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserEvent.deleteUser()';
  }
}

/// @nodoc
mixin _$DeleteUserState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteUserState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserState()';
  }
}

/// @nodoc
class $DeleteUserStateCopyWith<$Res> {
  $DeleteUserStateCopyWith(
      DeleteUserState _, $Res Function(DeleteUserState) __);
}

/// Adds pattern-matching-related methods to [DeleteUserState].
extension DeleteUserStatePatterns on DeleteUserState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteUserInitialState value)? initial,
    TResult Function(DeleteUserLoadingState value)? loading,
    TResult Function(DeleteUserErrorState value)? error,
    TResult Function(DeleteUserCompletedState value)? completed,
    TResult Function(DeleteUserAuthRequiredState value)? authRequired,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserInitialState() when initial != null:
        return initial(_that);
      case DeleteUserLoadingState() when loading != null:
        return loading(_that);
      case DeleteUserErrorState() when error != null:
        return error(_that);
      case DeleteUserCompletedState() when completed != null:
        return completed(_that);
      case DeleteUserAuthRequiredState() when authRequired != null:
        return authRequired(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteUserInitialState value) initial,
    required TResult Function(DeleteUserLoadingState value) loading,
    required TResult Function(DeleteUserErrorState value) error,
    required TResult Function(DeleteUserCompletedState value) completed,
    required TResult Function(DeleteUserAuthRequiredState value) authRequired,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserInitialState():
        return initial(_that);
      case DeleteUserLoadingState():
        return loading(_that);
      case DeleteUserErrorState():
        return error(_that);
      case DeleteUserCompletedState():
        return completed(_that);
      case DeleteUserAuthRequiredState():
        return authRequired(_that);
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteUserInitialState value)? initial,
    TResult? Function(DeleteUserLoadingState value)? loading,
    TResult? Function(DeleteUserErrorState value)? error,
    TResult? Function(DeleteUserCompletedState value)? completed,
    TResult? Function(DeleteUserAuthRequiredState value)? authRequired,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserInitialState() when initial != null:
        return initial(_that);
      case DeleteUserLoadingState() when loading != null:
        return loading(_that);
      case DeleteUserErrorState() when error != null:
        return error(_that);
      case DeleteUserCompletedState() when completed != null:
        return completed(_that);
      case DeleteUserAuthRequiredState() when authRequired != null:
        return authRequired(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? completed,
    TResult Function()? authRequired,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserInitialState() when initial != null:
        return initial();
      case DeleteUserLoadingState() when loading != null:
        return loading();
      case DeleteUserErrorState() when error != null:
        return error();
      case DeleteUserCompletedState() when completed != null:
        return completed();
      case DeleteUserAuthRequiredState() when authRequired != null:
        return authRequired();
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() completed,
    required TResult Function() authRequired,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserInitialState():
        return initial();
      case DeleteUserLoadingState():
        return loading();
      case DeleteUserErrorState():
        return error();
      case DeleteUserCompletedState():
        return completed();
      case DeleteUserAuthRequiredState():
        return authRequired();
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? completed,
    TResult? Function()? authRequired,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteUserInitialState() when initial != null:
        return initial();
      case DeleteUserLoadingState() when loading != null:
        return loading();
      case DeleteUserErrorState() when error != null:
        return error();
      case DeleteUserCompletedState() when completed != null:
        return completed();
      case DeleteUserAuthRequiredState() when authRequired != null:
        return authRequired();
      case _:
        return null;
    }
  }
}

/// @nodoc

class DeleteUserInitialState extends DeleteUserState {
  const DeleteUserInitialState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteUserInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserState.initial()';
  }
}

/// @nodoc

class DeleteUserLoadingState extends DeleteUserState {
  const DeleteUserLoadingState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteUserLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserState.loading()';
  }
}

/// @nodoc

class DeleteUserErrorState extends DeleteUserState {
  const DeleteUserErrorState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteUserErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserState.error()';
  }
}

/// @nodoc

class DeleteUserCompletedState extends DeleteUserState {
  const DeleteUserCompletedState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteUserCompletedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserState.completed()';
  }
}

/// @nodoc

class DeleteUserAuthRequiredState extends DeleteUserState {
  const DeleteUserAuthRequiredState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteUserAuthRequiredState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteUserState.authRequired()';
  }
}

// dart format on
