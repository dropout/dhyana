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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$InitializeAuthImplCopyWith<$Res> {
  factory _$$InitializeAuthImplCopyWith(_$InitializeAuthImpl value,
          $Res Function(_$InitializeAuthImpl) then) =
      __$$InitializeAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeAuthImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$InitializeAuthImpl>
    implements _$$InitializeAuthImplCopyWith<$Res> {
  __$$InitializeAuthImplCopyWithImpl(
      _$InitializeAuthImpl _value, $Res Function(_$InitializeAuthImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeAuthImpl extends InitializeAuth with DiagnosticableTreeMixin {
  const _$InitializeAuthImpl() : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeAuthImpl);
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
  const factory InitializeAuth() = _$InitializeAuthImpl;
  const InitializeAuth._() : super._();
}

/// @nodoc
abstract class _$$SigninWithGoogleImplCopyWith<$Res> {
  factory _$$SigninWithGoogleImplCopyWith(_$SigninWithGoogleImpl value,
          $Res Function(_$SigninWithGoogleImpl) then) =
      __$$SigninWithGoogleImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {void Function(User)? onComplete,
      void Function(Object?, StackTrace)? onError});
}

/// @nodoc
class __$$SigninWithGoogleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SigninWithGoogleImpl>
    implements _$$SigninWithGoogleImplCopyWith<$Res> {
  __$$SigninWithGoogleImplCopyWithImpl(_$SigninWithGoogleImpl _value,
      $Res Function(_$SigninWithGoogleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$SigninWithGoogleImpl(
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

class _$SigninWithGoogleImpl extends SigninWithGoogle
    with DiagnosticableTreeMixin {
  const _$SigninWithGoogleImpl({this.onComplete, this.onError}) : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninWithGoogleImpl &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onComplete, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninWithGoogleImplCopyWith<_$SigninWithGoogleImpl> get copyWith =>
      __$$SigninWithGoogleImplCopyWithImpl<_$SigninWithGoogleImpl>(
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
          final void Function(Object?, StackTrace)? onError}) =
      _$SigninWithGoogleImpl;
  const SigninWithGoogle._() : super._();

  void Function(User)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  @JsonKey(ignore: true)
  _$$SigninWithGoogleImplCopyWith<_$SigninWithGoogleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SigninWithAppleImplCopyWith<$Res> {
  factory _$$SigninWithAppleImplCopyWith(_$SigninWithAppleImpl value,
          $Res Function(_$SigninWithAppleImpl) then) =
      __$$SigninWithAppleImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {void Function(User)? onComplete,
      void Function(Object?, StackTrace)? onError});
}

/// @nodoc
class __$$SigninWithAppleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SigninWithAppleImpl>
    implements _$$SigninWithAppleImplCopyWith<$Res> {
  __$$SigninWithAppleImplCopyWithImpl(
      _$SigninWithAppleImpl _value, $Res Function(_$SigninWithAppleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$SigninWithAppleImpl(
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

class _$SigninWithAppleImpl extends SigninWithApple
    with DiagnosticableTreeMixin {
  const _$SigninWithAppleImpl({this.onComplete, this.onError}) : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninWithAppleImpl &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onComplete, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninWithAppleImplCopyWith<_$SigninWithAppleImpl> get copyWith =>
      __$$SigninWithAppleImplCopyWithImpl<_$SigninWithAppleImpl>(
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
          final void Function(Object?, StackTrace)? onError}) =
      _$SigninWithAppleImpl;
  const SigninWithApple._() : super._();

  void Function(User)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  @JsonKey(ignore: true)
  _$$SigninWithAppleImplCopyWith<_$SigninWithAppleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SigninWithEmailAndPasswordImplCopyWith<$Res> {
  factory _$$SigninWithEmailAndPasswordImplCopyWith(
          _$SigninWithEmailAndPasswordImpl value,
          $Res Function(_$SigninWithEmailAndPasswordImpl) then) =
      __$$SigninWithEmailAndPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String email,
      String password,
      void Function(User)? onComplete,
      void Function(Object?, StackTrace)? onError});
}

/// @nodoc
class __$$SigninWithEmailAndPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SigninWithEmailAndPasswordImpl>
    implements _$$SigninWithEmailAndPasswordImplCopyWith<$Res> {
  __$$SigninWithEmailAndPasswordImplCopyWithImpl(
      _$SigninWithEmailAndPasswordImpl _value,
      $Res Function(_$SigninWithEmailAndPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$SigninWithEmailAndPasswordImpl(
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

class _$SigninWithEmailAndPasswordImpl extends SigninWithEmailAndPassword
    with DiagnosticableTreeMixin {
  const _$SigninWithEmailAndPasswordImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninWithEmailAndPasswordImpl &&
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
  _$$SigninWithEmailAndPasswordImplCopyWith<_$SigninWithEmailAndPasswordImpl>
      get copyWith => __$$SigninWithEmailAndPasswordImplCopyWithImpl<
          _$SigninWithEmailAndPasswordImpl>(this, _$identity);

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
      _$SigninWithEmailAndPasswordImpl;
  const SigninWithEmailAndPassword._() : super._();

  String get email;
  String get password;
  void Function(User)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  @JsonKey(ignore: true)
  _$$SigninWithEmailAndPasswordImplCopyWith<_$SigninWithEmailAndPasswordImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutImplCopyWith<$Res> {
  factory _$$SignOutImplCopyWith(
          _$SignOutImpl value, $Res Function(_$SignOutImpl) then) =
      __$$SignOutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic Function()? onSignedOut});
}

/// @nodoc
class __$$SignOutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOutImpl>
    implements _$$SignOutImplCopyWith<$Res> {
  __$$SignOutImplCopyWithImpl(
      _$SignOutImpl _value, $Res Function(_$SignOutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onSignedOut = freezed,
  }) {
    return _then(_$SignOutImpl(
      onSignedOut: freezed == onSignedOut
          ? _value.onSignedOut
          : onSignedOut // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ));
  }
}

/// @nodoc

class _$SignOutImpl extends SignOut with DiagnosticableTreeMixin {
  const _$SignOutImpl({this.onSignedOut}) : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignOutImpl &&
            (identical(other.onSignedOut, onSignedOut) ||
                other.onSignedOut == onSignedOut));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onSignedOut);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignOutImplCopyWith<_$SignOutImpl> get copyWith =>
      __$$SignOutImplCopyWithImpl<_$SignOutImpl>(this, _$identity);

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
  const factory SignOut({final dynamic Function()? onSignedOut}) =
      _$SignOutImpl;
  const SignOut._() : super._();

  dynamic Function()? get onSignedOut;
  @JsonKey(ignore: true)
  _$$SignOutImplCopyWith<_$SignOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DismissSigninErrorImplCopyWith<$Res> {
  factory _$$DismissSigninErrorImplCopyWith(_$DismissSigninErrorImpl value,
          $Res Function(_$DismissSigninErrorImpl) then) =
      __$$DismissSigninErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DismissSigninErrorImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$DismissSigninErrorImpl>
    implements _$$DismissSigninErrorImplCopyWith<$Res> {
  __$$DismissSigninErrorImplCopyWithImpl(_$DismissSigninErrorImpl _value,
      $Res Function(_$DismissSigninErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DismissSigninErrorImpl extends DismissSigninError
    with DiagnosticableTreeMixin {
  const _$DismissSigninErrorImpl() : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DismissSigninErrorImpl);
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
  const factory DismissSigninError() = _$DismissSigninErrorImpl;
  const DismissSigninError._() : super._();
}

/// @nodoc
abstract class _$$ReceiveAuthStateChangeImplCopyWith<$Res> {
  factory _$$ReceiveAuthStateChangeImplCopyWith(
          _$ReceiveAuthStateChangeImpl value,
          $Res Function(_$ReceiveAuthStateChangeImpl) then) =
      __$$ReceiveAuthStateChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class __$$ReceiveAuthStateChangeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ReceiveAuthStateChangeImpl>
    implements _$$ReceiveAuthStateChangeImplCopyWith<$Res> {
  __$$ReceiveAuthStateChangeImplCopyWithImpl(
      _$ReceiveAuthStateChangeImpl _value,
      $Res Function(_$ReceiveAuthStateChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$ReceiveAuthStateChangeImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$ReceiveAuthStateChangeImpl extends ReceiveAuthStateChange
    with DiagnosticableTreeMixin {
  const _$ReceiveAuthStateChangeImpl({this.user}) : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveAuthStateChangeImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveAuthStateChangeImplCopyWith<_$ReceiveAuthStateChangeImpl>
      get copyWith => __$$ReceiveAuthStateChangeImplCopyWithImpl<
          _$ReceiveAuthStateChangeImpl>(this, _$identity);

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
      _$ReceiveAuthStateChangeImpl;
  const ReceiveAuthStateChange._() : super._();

  User? get user;
  @JsonKey(ignore: true)
  _$$ReceiveAuthStateChangeImplCopyWith<_$ReceiveAuthStateChangeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveUserChangeImplCopyWith<$Res> {
  factory _$$ReceiveUserChangeImplCopyWith(_$ReceiveUserChangeImpl value,
          $Res Function(_$ReceiveUserChangeImpl) then) =
      __$$ReceiveUserChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class __$$ReceiveUserChangeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ReceiveUserChangeImpl>
    implements _$$ReceiveUserChangeImplCopyWith<$Res> {
  __$$ReceiveUserChangeImplCopyWithImpl(_$ReceiveUserChangeImpl _value,
      $Res Function(_$ReceiveUserChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$ReceiveUserChangeImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$ReceiveUserChangeImpl extends ReceiveUserChange
    with DiagnosticableTreeMixin {
  const _$ReceiveUserChangeImpl({this.user}) : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveUserChangeImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveUserChangeImplCopyWith<_$ReceiveUserChangeImpl> get copyWith =>
      __$$ReceiveUserChangeImplCopyWithImpl<_$ReceiveUserChangeImpl>(
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
  const factory ReceiveUserChange({final User? user}) = _$ReceiveUserChangeImpl;
  const ReceiveUserChange._() : super._();

  User? get user;
  @JsonKey(ignore: true)
  _$$ReceiveUserChangeImplCopyWith<_$ReceiveUserChangeImpl> get copyWith =>
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
abstract class _$$AuthStateInitialImplCopyWith<$Res> {
  factory _$$AuthStateInitialImplCopyWith(_$AuthStateInitialImpl value,
          $Res Function(_$AuthStateInitialImpl) then) =
      __$$AuthStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateInitialImpl>
    implements _$$AuthStateInitialImplCopyWith<$Res> {
  __$$AuthStateInitialImplCopyWithImpl(_$AuthStateInitialImpl _value,
      $Res Function(_$AuthStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateInitialImpl extends AuthStateInitial
    with DiagnosticableTreeMixin {
  const _$AuthStateInitialImpl() : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateInitialImpl);
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
  const factory AuthStateInitial() = _$AuthStateInitialImpl;
  const AuthStateInitial._() : super._();
}

/// @nodoc
abstract class _$$AuthStateSignedOutImplCopyWith<$Res> {
  factory _$$AuthStateSignedOutImplCopyWith(_$AuthStateSignedOutImpl value,
          $Res Function(_$AuthStateSignedOutImpl) then) =
      __$$AuthStateSignedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateSignedOutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateSignedOutImpl>
    implements _$$AuthStateSignedOutImplCopyWith<$Res> {
  __$$AuthStateSignedOutImplCopyWithImpl(_$AuthStateSignedOutImpl _value,
      $Res Function(_$AuthStateSignedOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateSignedOutImpl extends AuthStateSignedOut
    with DiagnosticableTreeMixin {
  const _$AuthStateSignedOutImpl() : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateSignedOutImpl);
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
  const factory AuthStateSignedOut() = _$AuthStateSignedOutImpl;
  const AuthStateSignedOut._() : super._();
}

/// @nodoc
abstract class _$$AuthStateSigningInImplCopyWith<$Res> {
  factory _$$AuthStateSigningInImplCopyWith(_$AuthStateSigningInImpl value,
          $Res Function(_$AuthStateSigningInImpl) then) =
      __$$AuthStateSigningInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateSigningInImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateSigningInImpl>
    implements _$$AuthStateSigningInImplCopyWith<$Res> {
  __$$AuthStateSigningInImplCopyWithImpl(_$AuthStateSigningInImpl _value,
      $Res Function(_$AuthStateSigningInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateSigningInImpl extends AuthStateSigningIn
    with DiagnosticableTreeMixin {
  const _$AuthStateSigningInImpl() : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateSigningInImpl);
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
  const factory AuthStateSigningIn() = _$AuthStateSigningInImpl;
  const AuthStateSigningIn._() : super._();
}

/// @nodoc
abstract class _$$AuthStateSignedInImplCopyWith<$Res> {
  factory _$$AuthStateSignedInImplCopyWith(_$AuthStateSignedInImpl value,
          $Res Function(_$AuthStateSignedInImpl) then) =
      __$$AuthStateSignedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$AuthStateSignedInImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateSignedInImpl>
    implements _$$AuthStateSignedInImplCopyWith<$Res> {
  __$$AuthStateSignedInImplCopyWithImpl(_$AuthStateSignedInImpl _value,
      $Res Function(_$AuthStateSignedInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthStateSignedInImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$AuthStateSignedInImpl extends AuthStateSignedIn
    with DiagnosticableTreeMixin {
  const _$AuthStateSignedInImpl({required this.user}) : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateSignedInImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateSignedInImplCopyWith<_$AuthStateSignedInImpl> get copyWith =>
      __$$AuthStateSignedInImplCopyWithImpl<_$AuthStateSignedInImpl>(
          this, _$identity);

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
      _$AuthStateSignedInImpl;
  const AuthStateSignedIn._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$AuthStateSignedInImplCopyWith<_$AuthStateSignedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateErrorOccuredImplCopyWith<$Res> {
  factory _$$AuthStateErrorOccuredImplCopyWith(
          _$AuthStateErrorOccuredImpl value,
          $Res Function(_$AuthStateErrorOccuredImpl) then) =
      __$$AuthStateErrorOccuredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateErrorOccuredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateErrorOccuredImpl>
    implements _$$AuthStateErrorOccuredImplCopyWith<$Res> {
  __$$AuthStateErrorOccuredImplCopyWithImpl(_$AuthStateErrorOccuredImpl _value,
      $Res Function(_$AuthStateErrorOccuredImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateErrorOccuredImpl extends AuthStateErrorOccured
    with DiagnosticableTreeMixin {
  const _$AuthStateErrorOccuredImpl() : super._();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateErrorOccuredImpl);
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
  const factory AuthStateErrorOccured() = _$AuthStateErrorOccuredImpl;
  const AuthStateErrorOccured._() : super._();
}
