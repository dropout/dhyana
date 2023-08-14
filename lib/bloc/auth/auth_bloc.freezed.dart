// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeAuth,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithGoogle,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithApple,
    required TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithEmailAndPassword,
    required TResult Function(dynamic Function()? onSignedOut) signOut,
    required TResult Function() dismissSigninError,
    required TResult Function(User? user) receiveAuthStateChange,
    required TResult Function(User? user) receiveUserChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeAuth,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult? Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult? Function(dynamic Function()? onSignedOut)? signOut,
    TResult? Function()? dismissSigninError,
    TResult? Function(User? user)? receiveAuthStateChange,
    TResult? Function(User? user)? receiveUserChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeAuth,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult Function(dynamic Function()? onSignedOut)? signOut,
    TResult Function()? dismissSigninError,
    TResult Function(User? user)? receiveAuthStateChange,
    TResult Function(User? user)? receiveUserChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAuth value) initializeAuth,
    required TResult Function(SigninWithGoogle value) signinWithGoogle,
    required TResult Function(SigninWithApple value) signinWithApple,
    required TResult Function(SigninWithEmailAndPassword value)
        signinWithEmailAndPassword,
    required TResult Function(SignOut value) signOut,
    required TResult Function(DismissSigninError value) dismissSigninError,
    required TResult Function(ReceiveAuthStateChange value)
        receiveAuthStateChange,
    required TResult Function(ReceiveUserChange value) receiveUserChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAuth value)? initializeAuth,
    TResult? Function(SigninWithGoogle value)? signinWithGoogle,
    TResult? Function(SigninWithApple value)? signinWithApple,
    TResult? Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(DismissSigninError value)? dismissSigninError,
    TResult? Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult? Function(ReceiveUserChange value)? receiveUserChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAuth value)? initializeAuth,
    TResult Function(SigninWithGoogle value)? signinWithGoogle,
    TResult Function(SigninWithApple value)? signinWithApple,
    TResult Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult Function(SignOut value)? signOut,
    TResult Function(DismissSigninError value)? dismissSigninError,
    TResult Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult Function(ReceiveUserChange value)? receiveUserChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeAuthCopyWith<$Res> {
  factory _$$InitializeAuthCopyWith(
          _$InitializeAuth value, $Res Function(_$InitializeAuth) then) =
      __$$InitializeAuthCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeAuthCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$InitializeAuth>
    implements _$$InitializeAuthCopyWith<$Res> {
  __$$InitializeAuthCopyWithImpl(
      _$InitializeAuth _value, $Res Function(_$InitializeAuth) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeAuth extends InitializeAuth with DiagnosticableTreeMixin {
  const _$InitializeAuth() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.initializeAuth()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.initializeAuth'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeAuth);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeAuth,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithGoogle,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithApple,
    required TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithEmailAndPassword,
    required TResult Function(dynamic Function()? onSignedOut) signOut,
    required TResult Function() dismissSigninError,
    required TResult Function(User? user) receiveAuthStateChange,
    required TResult Function(User? user) receiveUserChange,
  }) {
    return initializeAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeAuth,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult? Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult? Function(dynamic Function()? onSignedOut)? signOut,
    TResult? Function()? dismissSigninError,
    TResult? Function(User? user)? receiveAuthStateChange,
    TResult? Function(User? user)? receiveUserChange,
  }) {
    return initializeAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeAuth,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult Function(dynamic Function()? onSignedOut)? signOut,
    TResult Function()? dismissSigninError,
    TResult Function(User? user)? receiveAuthStateChange,
    TResult Function(User? user)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (initializeAuth != null) {
      return initializeAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAuth value) initializeAuth,
    required TResult Function(SigninWithGoogle value) signinWithGoogle,
    required TResult Function(SigninWithApple value) signinWithApple,
    required TResult Function(SigninWithEmailAndPassword value)
        signinWithEmailAndPassword,
    required TResult Function(SignOut value) signOut,
    required TResult Function(DismissSigninError value) dismissSigninError,
    required TResult Function(ReceiveAuthStateChange value)
        receiveAuthStateChange,
    required TResult Function(ReceiveUserChange value) receiveUserChange,
  }) {
    return initializeAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAuth value)? initializeAuth,
    TResult? Function(SigninWithGoogle value)? signinWithGoogle,
    TResult? Function(SigninWithApple value)? signinWithApple,
    TResult? Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(DismissSigninError value)? dismissSigninError,
    TResult? Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult? Function(ReceiveUserChange value)? receiveUserChange,
  }) {
    return initializeAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAuth value)? initializeAuth,
    TResult Function(SigninWithGoogle value)? signinWithGoogle,
    TResult Function(SigninWithApple value)? signinWithApple,
    TResult Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult Function(SignOut value)? signOut,
    TResult Function(DismissSigninError value)? dismissSigninError,
    TResult Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult Function(ReceiveUserChange value)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (initializeAuth != null) {
      return initializeAuth(this);
    }
    return orElse();
  }
}

abstract class InitializeAuth extends AuthEvent {
  const factory InitializeAuth() = _$InitializeAuth;
  const InitializeAuth._() : super._();
}

/// @nodoc
abstract class _$$SigninWithGoogleCopyWith<$Res> {
  factory _$$SigninWithGoogleCopyWith(
          _$SigninWithGoogle value, $Res Function(_$SigninWithGoogle) then) =
      __$$SigninWithGoogleCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {void Function(User)? onComplete,
      void Function(Object?, StackTrace)? onError});
}

/// @nodoc
class __$$SigninWithGoogleCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SigninWithGoogle>
    implements _$$SigninWithGoogleCopyWith<$Res> {
  __$$SigninWithGoogleCopyWithImpl(
      _$SigninWithGoogle _value, $Res Function(_$SigninWithGoogle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$SigninWithGoogle(
      onComplete: freezed == onComplete
          ? _value.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(User)?,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object?, StackTrace)?,
    ));
  }
}

/// @nodoc

class _$SigninWithGoogle extends SigninWithGoogle with DiagnosticableTreeMixin {
  const _$SigninWithGoogle({this.onComplete, this.onError}) : super._();

  @override
  final void Function(User)? onComplete;
  @override
  final void Function(Object?, StackTrace)? onError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.signinWithGoogle(onComplete: $onComplete, onError: $onError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.signinWithGoogle'))
      ..add(DiagnosticsProperty('onComplete', onComplete))
      ..add(DiagnosticsProperty('onError', onError));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninWithGoogle &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onComplete, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninWithGoogleCopyWith<_$SigninWithGoogle> get copyWith =>
      __$$SigninWithGoogleCopyWithImpl<_$SigninWithGoogle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeAuth,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithGoogle,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithApple,
    required TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithEmailAndPassword,
    required TResult Function(dynamic Function()? onSignedOut) signOut,
    required TResult Function() dismissSigninError,
    required TResult Function(User? user) receiveAuthStateChange,
    required TResult Function(User? user) receiveUserChange,
  }) {
    return signinWithGoogle(onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeAuth,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult? Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult? Function(dynamic Function()? onSignedOut)? signOut,
    TResult? Function()? dismissSigninError,
    TResult? Function(User? user)? receiveAuthStateChange,
    TResult? Function(User? user)? receiveUserChange,
  }) {
    return signinWithGoogle?.call(onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeAuth,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult Function(dynamic Function()? onSignedOut)? signOut,
    TResult Function()? dismissSigninError,
    TResult Function(User? user)? receiveAuthStateChange,
    TResult Function(User? user)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (signinWithGoogle != null) {
      return signinWithGoogle(onComplete, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAuth value) initializeAuth,
    required TResult Function(SigninWithGoogle value) signinWithGoogle,
    required TResult Function(SigninWithApple value) signinWithApple,
    required TResult Function(SigninWithEmailAndPassword value)
        signinWithEmailAndPassword,
    required TResult Function(SignOut value) signOut,
    required TResult Function(DismissSigninError value) dismissSigninError,
    required TResult Function(ReceiveAuthStateChange value)
        receiveAuthStateChange,
    required TResult Function(ReceiveUserChange value) receiveUserChange,
  }) {
    return signinWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAuth value)? initializeAuth,
    TResult? Function(SigninWithGoogle value)? signinWithGoogle,
    TResult? Function(SigninWithApple value)? signinWithApple,
    TResult? Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(DismissSigninError value)? dismissSigninError,
    TResult? Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult? Function(ReceiveUserChange value)? receiveUserChange,
  }) {
    return signinWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAuth value)? initializeAuth,
    TResult Function(SigninWithGoogle value)? signinWithGoogle,
    TResult Function(SigninWithApple value)? signinWithApple,
    TResult Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult Function(SignOut value)? signOut,
    TResult Function(DismissSigninError value)? dismissSigninError,
    TResult Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult Function(ReceiveUserChange value)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (signinWithGoogle != null) {
      return signinWithGoogle(this);
    }
    return orElse();
  }
}

abstract class SigninWithGoogle extends AuthEvent {
  const factory SigninWithGoogle(
      {final void Function(User)? onComplete,
      final void Function(Object?, StackTrace)? onError}) = _$SigninWithGoogle;
  const SigninWithGoogle._() : super._();

  void Function(User)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  @JsonKey(ignore: true)
  _$$SigninWithGoogleCopyWith<_$SigninWithGoogle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SigninWithAppleCopyWith<$Res> {
  factory _$$SigninWithAppleCopyWith(
          _$SigninWithApple value, $Res Function(_$SigninWithApple) then) =
      __$$SigninWithAppleCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {void Function(User)? onComplete,
      void Function(Object?, StackTrace)? onError});
}

/// @nodoc
class __$$SigninWithAppleCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SigninWithApple>
    implements _$$SigninWithAppleCopyWith<$Res> {
  __$$SigninWithAppleCopyWithImpl(
      _$SigninWithApple _value, $Res Function(_$SigninWithApple) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$SigninWithApple(
      onComplete: freezed == onComplete
          ? _value.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(User)?,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object?, StackTrace)?,
    ));
  }
}

/// @nodoc

class _$SigninWithApple extends SigninWithApple with DiagnosticableTreeMixin {
  const _$SigninWithApple({this.onComplete, this.onError}) : super._();

  @override
  final void Function(User)? onComplete;
  @override
  final void Function(Object?, StackTrace)? onError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.signinWithApple(onComplete: $onComplete, onError: $onError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.signinWithApple'))
      ..add(DiagnosticsProperty('onComplete', onComplete))
      ..add(DiagnosticsProperty('onError', onError));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninWithApple &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onComplete, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninWithAppleCopyWith<_$SigninWithApple> get copyWith =>
      __$$SigninWithAppleCopyWithImpl<_$SigninWithApple>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeAuth,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithGoogle,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithApple,
    required TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithEmailAndPassword,
    required TResult Function(dynamic Function()? onSignedOut) signOut,
    required TResult Function() dismissSigninError,
    required TResult Function(User? user) receiveAuthStateChange,
    required TResult Function(User? user) receiveUserChange,
  }) {
    return signinWithApple(onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeAuth,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult? Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult? Function(dynamic Function()? onSignedOut)? signOut,
    TResult? Function()? dismissSigninError,
    TResult? Function(User? user)? receiveAuthStateChange,
    TResult? Function(User? user)? receiveUserChange,
  }) {
    return signinWithApple?.call(onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeAuth,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult Function(dynamic Function()? onSignedOut)? signOut,
    TResult Function()? dismissSigninError,
    TResult Function(User? user)? receiveAuthStateChange,
    TResult Function(User? user)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (signinWithApple != null) {
      return signinWithApple(onComplete, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAuth value) initializeAuth,
    required TResult Function(SigninWithGoogle value) signinWithGoogle,
    required TResult Function(SigninWithApple value) signinWithApple,
    required TResult Function(SigninWithEmailAndPassword value)
        signinWithEmailAndPassword,
    required TResult Function(SignOut value) signOut,
    required TResult Function(DismissSigninError value) dismissSigninError,
    required TResult Function(ReceiveAuthStateChange value)
        receiveAuthStateChange,
    required TResult Function(ReceiveUserChange value) receiveUserChange,
  }) {
    return signinWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAuth value)? initializeAuth,
    TResult? Function(SigninWithGoogle value)? signinWithGoogle,
    TResult? Function(SigninWithApple value)? signinWithApple,
    TResult? Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(DismissSigninError value)? dismissSigninError,
    TResult? Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult? Function(ReceiveUserChange value)? receiveUserChange,
  }) {
    return signinWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAuth value)? initializeAuth,
    TResult Function(SigninWithGoogle value)? signinWithGoogle,
    TResult Function(SigninWithApple value)? signinWithApple,
    TResult Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult Function(SignOut value)? signOut,
    TResult Function(DismissSigninError value)? dismissSigninError,
    TResult Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult Function(ReceiveUserChange value)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (signinWithApple != null) {
      return signinWithApple(this);
    }
    return orElse();
  }
}

abstract class SigninWithApple extends AuthEvent {
  const factory SigninWithApple(
      {final void Function(User)? onComplete,
      final void Function(Object?, StackTrace)? onError}) = _$SigninWithApple;
  const SigninWithApple._() : super._();

  void Function(User)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  @JsonKey(ignore: true)
  _$$SigninWithAppleCopyWith<_$SigninWithApple> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SigninWithEmailAndPasswordCopyWith<$Res> {
  factory _$$SigninWithEmailAndPasswordCopyWith(
          _$SigninWithEmailAndPassword value,
          $Res Function(_$SigninWithEmailAndPassword) then) =
      __$$SigninWithEmailAndPasswordCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String email,
      String password,
      void Function(User)? onComplete,
      void Function(Object?, StackTrace)? onError});
}

/// @nodoc
class __$$SigninWithEmailAndPasswordCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SigninWithEmailAndPassword>
    implements _$$SigninWithEmailAndPasswordCopyWith<$Res> {
  __$$SigninWithEmailAndPasswordCopyWithImpl(
      _$SigninWithEmailAndPassword _value,
      $Res Function(_$SigninWithEmailAndPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$SigninWithEmailAndPassword(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      onComplete: freezed == onComplete
          ? _value.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(User)?,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object?, StackTrace)?,
    ));
  }
}

/// @nodoc

class _$SigninWithEmailAndPassword extends SigninWithEmailAndPassword
    with DiagnosticableTreeMixin {
  const _$SigninWithEmailAndPassword(
      {required this.email,
      required this.password,
      this.onComplete,
      this.onError})
      : super._();

  @override
  final String email;
  @override
  final String password;
  @override
  final void Function(User)? onComplete;
  @override
  final void Function(Object?, StackTrace)? onError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.signinWithEmailAndPassword(email: $email, password: $password, onComplete: $onComplete, onError: $onError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.signinWithEmailAndPassword'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('onComplete', onComplete))
      ..add(DiagnosticsProperty('onError', onError));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninWithEmailAndPassword &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, onComplete, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninWithEmailAndPasswordCopyWith<_$SigninWithEmailAndPassword>
      get copyWith => __$$SigninWithEmailAndPasswordCopyWithImpl<
          _$SigninWithEmailAndPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeAuth,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithGoogle,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithApple,
    required TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithEmailAndPassword,
    required TResult Function(dynamic Function()? onSignedOut) signOut,
    required TResult Function() dismissSigninError,
    required TResult Function(User? user) receiveAuthStateChange,
    required TResult Function(User? user) receiveUserChange,
  }) {
    return signinWithEmailAndPassword(email, password, onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeAuth,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult? Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult? Function(dynamic Function()? onSignedOut)? signOut,
    TResult? Function()? dismissSigninError,
    TResult? Function(User? user)? receiveAuthStateChange,
    TResult? Function(User? user)? receiveUserChange,
  }) {
    return signinWithEmailAndPassword?.call(
        email, password, onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeAuth,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult Function(dynamic Function()? onSignedOut)? signOut,
    TResult Function()? dismissSigninError,
    TResult Function(User? user)? receiveAuthStateChange,
    TResult Function(User? user)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (signinWithEmailAndPassword != null) {
      return signinWithEmailAndPassword(email, password, onComplete, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAuth value) initializeAuth,
    required TResult Function(SigninWithGoogle value) signinWithGoogle,
    required TResult Function(SigninWithApple value) signinWithApple,
    required TResult Function(SigninWithEmailAndPassword value)
        signinWithEmailAndPassword,
    required TResult Function(SignOut value) signOut,
    required TResult Function(DismissSigninError value) dismissSigninError,
    required TResult Function(ReceiveAuthStateChange value)
        receiveAuthStateChange,
    required TResult Function(ReceiveUserChange value) receiveUserChange,
  }) {
    return signinWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAuth value)? initializeAuth,
    TResult? Function(SigninWithGoogle value)? signinWithGoogle,
    TResult? Function(SigninWithApple value)? signinWithApple,
    TResult? Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(DismissSigninError value)? dismissSigninError,
    TResult? Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult? Function(ReceiveUserChange value)? receiveUserChange,
  }) {
    return signinWithEmailAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAuth value)? initializeAuth,
    TResult Function(SigninWithGoogle value)? signinWithGoogle,
    TResult Function(SigninWithApple value)? signinWithApple,
    TResult Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult Function(SignOut value)? signOut,
    TResult Function(DismissSigninError value)? dismissSigninError,
    TResult Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult Function(ReceiveUserChange value)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (signinWithEmailAndPassword != null) {
      return signinWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class SigninWithEmailAndPassword extends AuthEvent {
  const factory SigninWithEmailAndPassword(
          {required final String email,
          required final String password,
          final void Function(User)? onComplete,
          final void Function(Object?, StackTrace)? onError}) =
      _$SigninWithEmailAndPassword;
  const SigninWithEmailAndPassword._() : super._();

  String get email;
  String get password;
  void Function(User)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  @JsonKey(ignore: true)
  _$$SigninWithEmailAndPasswordCopyWith<_$SigninWithEmailAndPassword>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutCopyWith<$Res> {
  factory _$$SignOutCopyWith(_$SignOut value, $Res Function(_$SignOut) then) =
      __$$SignOutCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic Function()? onSignedOut});
}

/// @nodoc
class __$$SignOutCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOut>
    implements _$$SignOutCopyWith<$Res> {
  __$$SignOutCopyWithImpl(_$SignOut _value, $Res Function(_$SignOut) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onSignedOut = freezed,
  }) {
    return _then(_$SignOut(
      onSignedOut: freezed == onSignedOut
          ? _value.onSignedOut
          : onSignedOut // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ));
  }
}

/// @nodoc

class _$SignOut extends SignOut with DiagnosticableTreeMixin {
  const _$SignOut({this.onSignedOut}) : super._();

  @override
  final dynamic Function()? onSignedOut;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.signOut(onSignedOut: $onSignedOut)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.signOut'))
      ..add(DiagnosticsProperty('onSignedOut', onSignedOut));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignOut &&
            (identical(other.onSignedOut, onSignedOut) ||
                other.onSignedOut == onSignedOut));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onSignedOut);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignOutCopyWith<_$SignOut> get copyWith =>
      __$$SignOutCopyWithImpl<_$SignOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeAuth,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithGoogle,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithApple,
    required TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithEmailAndPassword,
    required TResult Function(dynamic Function()? onSignedOut) signOut,
    required TResult Function() dismissSigninError,
    required TResult Function(User? user) receiveAuthStateChange,
    required TResult Function(User? user) receiveUserChange,
  }) {
    return signOut(onSignedOut);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeAuth,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult? Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult? Function(dynamic Function()? onSignedOut)? signOut,
    TResult? Function()? dismissSigninError,
    TResult? Function(User? user)? receiveAuthStateChange,
    TResult? Function(User? user)? receiveUserChange,
  }) {
    return signOut?.call(onSignedOut);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeAuth,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult Function(dynamic Function()? onSignedOut)? signOut,
    TResult Function()? dismissSigninError,
    TResult Function(User? user)? receiveAuthStateChange,
    TResult Function(User? user)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(onSignedOut);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAuth value) initializeAuth,
    required TResult Function(SigninWithGoogle value) signinWithGoogle,
    required TResult Function(SigninWithApple value) signinWithApple,
    required TResult Function(SigninWithEmailAndPassword value)
        signinWithEmailAndPassword,
    required TResult Function(SignOut value) signOut,
    required TResult Function(DismissSigninError value) dismissSigninError,
    required TResult Function(ReceiveAuthStateChange value)
        receiveAuthStateChange,
    required TResult Function(ReceiveUserChange value) receiveUserChange,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAuth value)? initializeAuth,
    TResult? Function(SigninWithGoogle value)? signinWithGoogle,
    TResult? Function(SigninWithApple value)? signinWithApple,
    TResult? Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(DismissSigninError value)? dismissSigninError,
    TResult? Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult? Function(ReceiveUserChange value)? receiveUserChange,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAuth value)? initializeAuth,
    TResult Function(SigninWithGoogle value)? signinWithGoogle,
    TResult Function(SigninWithApple value)? signinWithApple,
    TResult Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult Function(SignOut value)? signOut,
    TResult Function(DismissSigninError value)? dismissSigninError,
    TResult Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult Function(ReceiveUserChange value)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class SignOut extends AuthEvent {
  const factory SignOut({final dynamic Function()? onSignedOut}) = _$SignOut;
  const SignOut._() : super._();

  dynamic Function()? get onSignedOut;
  @JsonKey(ignore: true)
  _$$SignOutCopyWith<_$SignOut> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DismissSigninErrorCopyWith<$Res> {
  factory _$$DismissSigninErrorCopyWith(_$DismissSigninError value,
          $Res Function(_$DismissSigninError) then) =
      __$$DismissSigninErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DismissSigninErrorCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$DismissSigninError>
    implements _$$DismissSigninErrorCopyWith<$Res> {
  __$$DismissSigninErrorCopyWithImpl(
      _$DismissSigninError _value, $Res Function(_$DismissSigninError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DismissSigninError extends DismissSigninError
    with DiagnosticableTreeMixin {
  const _$DismissSigninError() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.dismissSigninError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.dismissSigninError'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DismissSigninError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeAuth,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithGoogle,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithApple,
    required TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithEmailAndPassword,
    required TResult Function(dynamic Function()? onSignedOut) signOut,
    required TResult Function() dismissSigninError,
    required TResult Function(User? user) receiveAuthStateChange,
    required TResult Function(User? user) receiveUserChange,
  }) {
    return dismissSigninError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeAuth,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult? Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult? Function(dynamic Function()? onSignedOut)? signOut,
    TResult? Function()? dismissSigninError,
    TResult? Function(User? user)? receiveAuthStateChange,
    TResult? Function(User? user)? receiveUserChange,
  }) {
    return dismissSigninError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeAuth,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult Function(dynamic Function()? onSignedOut)? signOut,
    TResult Function()? dismissSigninError,
    TResult Function(User? user)? receiveAuthStateChange,
    TResult Function(User? user)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (dismissSigninError != null) {
      return dismissSigninError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAuth value) initializeAuth,
    required TResult Function(SigninWithGoogle value) signinWithGoogle,
    required TResult Function(SigninWithApple value) signinWithApple,
    required TResult Function(SigninWithEmailAndPassword value)
        signinWithEmailAndPassword,
    required TResult Function(SignOut value) signOut,
    required TResult Function(DismissSigninError value) dismissSigninError,
    required TResult Function(ReceiveAuthStateChange value)
        receiveAuthStateChange,
    required TResult Function(ReceiveUserChange value) receiveUserChange,
  }) {
    return dismissSigninError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAuth value)? initializeAuth,
    TResult? Function(SigninWithGoogle value)? signinWithGoogle,
    TResult? Function(SigninWithApple value)? signinWithApple,
    TResult? Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(DismissSigninError value)? dismissSigninError,
    TResult? Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult? Function(ReceiveUserChange value)? receiveUserChange,
  }) {
    return dismissSigninError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAuth value)? initializeAuth,
    TResult Function(SigninWithGoogle value)? signinWithGoogle,
    TResult Function(SigninWithApple value)? signinWithApple,
    TResult Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult Function(SignOut value)? signOut,
    TResult Function(DismissSigninError value)? dismissSigninError,
    TResult Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult Function(ReceiveUserChange value)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (dismissSigninError != null) {
      return dismissSigninError(this);
    }
    return orElse();
  }
}

abstract class DismissSigninError extends AuthEvent {
  const factory DismissSigninError() = _$DismissSigninError;
  const DismissSigninError._() : super._();
}

/// @nodoc
abstract class _$$ReceiveAuthStateChangeCopyWith<$Res> {
  factory _$$ReceiveAuthStateChangeCopyWith(_$ReceiveAuthStateChange value,
          $Res Function(_$ReceiveAuthStateChange) then) =
      __$$ReceiveAuthStateChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class __$$ReceiveAuthStateChangeCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ReceiveAuthStateChange>
    implements _$$ReceiveAuthStateChangeCopyWith<$Res> {
  __$$ReceiveAuthStateChangeCopyWithImpl(_$ReceiveAuthStateChange _value,
      $Res Function(_$ReceiveAuthStateChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$ReceiveAuthStateChange(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$ReceiveAuthStateChange extends ReceiveAuthStateChange
    with DiagnosticableTreeMixin {
  const _$ReceiveAuthStateChange({this.user}) : super._();

  @override
  final User? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.receiveAuthStateChange(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.receiveAuthStateChange'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveAuthStateChange &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveAuthStateChangeCopyWith<_$ReceiveAuthStateChange> get copyWith =>
      __$$ReceiveAuthStateChangeCopyWithImpl<_$ReceiveAuthStateChange>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeAuth,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithGoogle,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithApple,
    required TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithEmailAndPassword,
    required TResult Function(dynamic Function()? onSignedOut) signOut,
    required TResult Function() dismissSigninError,
    required TResult Function(User? user) receiveAuthStateChange,
    required TResult Function(User? user) receiveUserChange,
  }) {
    return receiveAuthStateChange(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeAuth,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult? Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult? Function(dynamic Function()? onSignedOut)? signOut,
    TResult? Function()? dismissSigninError,
    TResult? Function(User? user)? receiveAuthStateChange,
    TResult? Function(User? user)? receiveUserChange,
  }) {
    return receiveAuthStateChange?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeAuth,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult Function(dynamic Function()? onSignedOut)? signOut,
    TResult Function()? dismissSigninError,
    TResult Function(User? user)? receiveAuthStateChange,
    TResult Function(User? user)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (receiveAuthStateChange != null) {
      return receiveAuthStateChange(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAuth value) initializeAuth,
    required TResult Function(SigninWithGoogle value) signinWithGoogle,
    required TResult Function(SigninWithApple value) signinWithApple,
    required TResult Function(SigninWithEmailAndPassword value)
        signinWithEmailAndPassword,
    required TResult Function(SignOut value) signOut,
    required TResult Function(DismissSigninError value) dismissSigninError,
    required TResult Function(ReceiveAuthStateChange value)
        receiveAuthStateChange,
    required TResult Function(ReceiveUserChange value) receiveUserChange,
  }) {
    return receiveAuthStateChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAuth value)? initializeAuth,
    TResult? Function(SigninWithGoogle value)? signinWithGoogle,
    TResult? Function(SigninWithApple value)? signinWithApple,
    TResult? Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(DismissSigninError value)? dismissSigninError,
    TResult? Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult? Function(ReceiveUserChange value)? receiveUserChange,
  }) {
    return receiveAuthStateChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAuth value)? initializeAuth,
    TResult Function(SigninWithGoogle value)? signinWithGoogle,
    TResult Function(SigninWithApple value)? signinWithApple,
    TResult Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult Function(SignOut value)? signOut,
    TResult Function(DismissSigninError value)? dismissSigninError,
    TResult Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult Function(ReceiveUserChange value)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (receiveAuthStateChange != null) {
      return receiveAuthStateChange(this);
    }
    return orElse();
  }
}

abstract class ReceiveAuthStateChange extends AuthEvent {
  const factory ReceiveAuthStateChange({final User? user}) =
      _$ReceiveAuthStateChange;
  const ReceiveAuthStateChange._() : super._();

  User? get user;
  @JsonKey(ignore: true)
  _$$ReceiveAuthStateChangeCopyWith<_$ReceiveAuthStateChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveUserChangeCopyWith<$Res> {
  factory _$$ReceiveUserChangeCopyWith(
          _$ReceiveUserChange value, $Res Function(_$ReceiveUserChange) then) =
      __$$ReceiveUserChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class __$$ReceiveUserChangeCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ReceiveUserChange>
    implements _$$ReceiveUserChangeCopyWith<$Res> {
  __$$ReceiveUserChangeCopyWithImpl(
      _$ReceiveUserChange _value, $Res Function(_$ReceiveUserChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$ReceiveUserChange(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$ReceiveUserChange extends ReceiveUserChange
    with DiagnosticableTreeMixin {
  const _$ReceiveUserChange({this.user}) : super._();

  @override
  final User? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.receiveUserChange(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.receiveUserChange'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveUserChange &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveUserChangeCopyWith<_$ReceiveUserChange> get copyWith =>
      __$$ReceiveUserChangeCopyWithImpl<_$ReceiveUserChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeAuth,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithGoogle,
    required TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithApple,
    required TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)
        signinWithEmailAndPassword,
    required TResult Function(dynamic Function()? onSignedOut) signOut,
    required TResult Function() dismissSigninError,
    required TResult Function(User? user) receiveAuthStateChange,
    required TResult Function(User? user) receiveUserChange,
  }) {
    return receiveUserChange(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeAuth,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult? Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult? Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult? Function(dynamic Function()? onSignedOut)? signOut,
    TResult? Function()? dismissSigninError,
    TResult? Function(User? user)? receiveAuthStateChange,
    TResult? Function(User? user)? receiveUserChange,
  }) {
    return receiveUserChange?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeAuth,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithGoogle,
    TResult Function(void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithApple,
    TResult Function(
            String email,
            String password,
            void Function(User)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        signinWithEmailAndPassword,
    TResult Function(dynamic Function()? onSignedOut)? signOut,
    TResult Function()? dismissSigninError,
    TResult Function(User? user)? receiveAuthStateChange,
    TResult Function(User? user)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (receiveUserChange != null) {
      return receiveUserChange(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeAuth value) initializeAuth,
    required TResult Function(SigninWithGoogle value) signinWithGoogle,
    required TResult Function(SigninWithApple value) signinWithApple,
    required TResult Function(SigninWithEmailAndPassword value)
        signinWithEmailAndPassword,
    required TResult Function(SignOut value) signOut,
    required TResult Function(DismissSigninError value) dismissSigninError,
    required TResult Function(ReceiveAuthStateChange value)
        receiveAuthStateChange,
    required TResult Function(ReceiveUserChange value) receiveUserChange,
  }) {
    return receiveUserChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeAuth value)? initializeAuth,
    TResult? Function(SigninWithGoogle value)? signinWithGoogle,
    TResult? Function(SigninWithApple value)? signinWithApple,
    TResult? Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(DismissSigninError value)? dismissSigninError,
    TResult? Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult? Function(ReceiveUserChange value)? receiveUserChange,
  }) {
    return receiveUserChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeAuth value)? initializeAuth,
    TResult Function(SigninWithGoogle value)? signinWithGoogle,
    TResult Function(SigninWithApple value)? signinWithApple,
    TResult Function(SigninWithEmailAndPassword value)?
        signinWithEmailAndPassword,
    TResult Function(SignOut value)? signOut,
    TResult Function(DismissSigninError value)? dismissSigninError,
    TResult Function(ReceiveAuthStateChange value)? receiveAuthStateChange,
    TResult Function(ReceiveUserChange value)? receiveUserChange,
    required TResult orElse(),
  }) {
    if (receiveUserChange != null) {
      return receiveUserChange(this);
    }
    return orElse();
  }
}

abstract class ReceiveUserChange extends AuthEvent {
  const factory ReceiveUserChange({final User? user}) = _$ReceiveUserChange;
  const ReceiveUserChange._() : super._();

  User? get user;
  @JsonKey(ignore: true)
  _$$ReceiveUserChangeCopyWith<_$ReceiveUserChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signedOut,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signedOut,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signedOut,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateErrorOccured value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateSignedOut value)? signedOut,
    TResult? Function(AuthStateSigningIn value)? signingIn,
    TResult? Function(AuthStateSignedIn value)? signedIn,
    TResult? Function(AuthStateErrorOccured value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateErrorOccured value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateInitialCopyWith<$Res> {
  factory _$$AuthStateInitialCopyWith(
          _$AuthStateInitial value, $Res Function(_$AuthStateInitial) then) =
      __$$AuthStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateInitialCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateInitial>
    implements _$$AuthStateInitialCopyWith<$Res> {
  __$$AuthStateInitialCopyWithImpl(
      _$AuthStateInitial _value, $Res Function(_$AuthStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateInitial extends AuthStateInitial with DiagnosticableTreeMixin {
  const _$AuthStateInitial() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signedOut,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signedOut,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signedOut,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
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
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateErrorOccured value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateSignedOut value)? signedOut,
    TResult? Function(AuthStateSigningIn value)? signingIn,
    TResult? Function(AuthStateSignedIn value)? signedIn,
    TResult? Function(AuthStateErrorOccured value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateErrorOccured value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthStateInitial extends AuthState {
  const factory AuthStateInitial() = _$AuthStateInitial;
  const AuthStateInitial._() : super._();
}

/// @nodoc
abstract class _$$AuthStateSignedOutCopyWith<$Res> {
  factory _$$AuthStateSignedOutCopyWith(_$AuthStateSignedOut value,
          $Res Function(_$AuthStateSignedOut) then) =
      __$$AuthStateSignedOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateSignedOutCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateSignedOut>
    implements _$$AuthStateSignedOutCopyWith<$Res> {
  __$$AuthStateSignedOutCopyWithImpl(
      _$AuthStateSignedOut _value, $Res Function(_$AuthStateSignedOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateSignedOut extends AuthStateSignedOut
    with DiagnosticableTreeMixin {
  const _$AuthStateSignedOut() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.signedOut()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.signedOut'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateSignedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signedOut,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function() error,
  }) {
    return signedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signedOut,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function()? error,
  }) {
    return signedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signedOut,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateErrorOccured value) error,
  }) {
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateSignedOut value)? signedOut,
    TResult? Function(AuthStateSigningIn value)? signingIn,
    TResult? Function(AuthStateSignedIn value)? signedIn,
    TResult? Function(AuthStateErrorOccured value)? error,
  }) {
    return signedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateErrorOccured value)? error,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }
}

abstract class AuthStateSignedOut extends AuthState {
  const factory AuthStateSignedOut() = _$AuthStateSignedOut;
  const AuthStateSignedOut._() : super._();
}

/// @nodoc
abstract class _$$AuthStateSigningInCopyWith<$Res> {
  factory _$$AuthStateSigningInCopyWith(_$AuthStateSigningIn value,
          $Res Function(_$AuthStateSigningIn) then) =
      __$$AuthStateSigningInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateSigningInCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateSigningIn>
    implements _$$AuthStateSigningInCopyWith<$Res> {
  __$$AuthStateSigningInCopyWithImpl(
      _$AuthStateSigningIn _value, $Res Function(_$AuthStateSigningIn) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateSigningIn extends AuthStateSigningIn
    with DiagnosticableTreeMixin {
  const _$AuthStateSigningIn() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.signingIn()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.signingIn'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateSigningIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signedOut,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function() error,
  }) {
    return signingIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signedOut,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function()? error,
  }) {
    return signingIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signedOut,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (signingIn != null) {
      return signingIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateErrorOccured value) error,
  }) {
    return signingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateSignedOut value)? signedOut,
    TResult? Function(AuthStateSigningIn value)? signingIn,
    TResult? Function(AuthStateSignedIn value)? signedIn,
    TResult? Function(AuthStateErrorOccured value)? error,
  }) {
    return signingIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateErrorOccured value)? error,
    required TResult orElse(),
  }) {
    if (signingIn != null) {
      return signingIn(this);
    }
    return orElse();
  }
}

abstract class AuthStateSigningIn extends AuthState {
  const factory AuthStateSigningIn() = _$AuthStateSigningIn;
  const AuthStateSigningIn._() : super._();
}

/// @nodoc
abstract class _$$AuthStateSignedInCopyWith<$Res> {
  factory _$$AuthStateSignedInCopyWith(
          _$AuthStateSignedIn value, $Res Function(_$AuthStateSignedIn) then) =
      __$$AuthStateSignedInCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$AuthStateSignedInCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateSignedIn>
    implements _$$AuthStateSignedInCopyWith<$Res> {
  __$$AuthStateSignedInCopyWithImpl(
      _$AuthStateSignedIn _value, $Res Function(_$AuthStateSignedIn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthStateSignedIn(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$AuthStateSignedIn extends AuthStateSignedIn
    with DiagnosticableTreeMixin {
  const _$AuthStateSignedIn({required this.user}) : super._();

  @override
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.signedIn(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.signedIn'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateSignedIn &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateSignedInCopyWith<_$AuthStateSignedIn> get copyWith =>
      __$$AuthStateSignedInCopyWithImpl<_$AuthStateSignedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signedOut,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function() error,
  }) {
    return signedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signedOut,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function()? error,
  }) {
    return signedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signedOut,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateErrorOccured value) error,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateSignedOut value)? signedOut,
    TResult? Function(AuthStateSigningIn value)? signingIn,
    TResult? Function(AuthStateSignedIn value)? signedIn,
    TResult? Function(AuthStateErrorOccured value)? error,
  }) {
    return signedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateErrorOccured value)? error,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }
}

abstract class AuthStateSignedIn extends AuthState {
  const factory AuthStateSignedIn({required final User user}) =
      _$AuthStateSignedIn;
  const AuthStateSignedIn._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$AuthStateSignedInCopyWith<_$AuthStateSignedIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateErrorOccuredCopyWith<$Res> {
  factory _$$AuthStateErrorOccuredCopyWith(_$AuthStateErrorOccured value,
          $Res Function(_$AuthStateErrorOccured) then) =
      __$$AuthStateErrorOccuredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateErrorOccuredCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateErrorOccured>
    implements _$$AuthStateErrorOccuredCopyWith<$Res> {
  __$$AuthStateErrorOccuredCopyWithImpl(_$AuthStateErrorOccured _value,
      $Res Function(_$AuthStateErrorOccured) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateErrorOccured extends AuthStateErrorOccured
    with DiagnosticableTreeMixin {
  const _$AuthStateErrorOccured() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.error'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateErrorOccured);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signedOut,
    required TResult Function() signingIn,
    required TResult Function(User user) signedIn,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signedOut,
    TResult? Function()? signingIn,
    TResult? Function(User user)? signedIn,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signedOut,
    TResult Function()? signingIn,
    TResult Function(User user)? signedIn,
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
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateErrorOccured value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateSignedOut value)? signedOut,
    TResult? Function(AuthStateSigningIn value)? signingIn,
    TResult? Function(AuthStateSignedIn value)? signedIn,
    TResult? Function(AuthStateErrorOccured value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateErrorOccured value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthStateErrorOccured extends AuthState {
  const factory AuthStateErrorOccured() = _$AuthStateErrorOccured;
  const AuthStateErrorOccured._() : super._();
}
