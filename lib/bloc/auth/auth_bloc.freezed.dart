// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// @nodoc

class InitializeAuth extends AuthEvent with DiagnosticableTreeMixin {
  const InitializeAuth() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthEvent.initializeAuth'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitializeAuth);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.initializeAuth()';
  }
}

/// @nodoc

class SigninWithGoogle extends AuthEvent with DiagnosticableTreeMixin {
  const SigninWithGoogle({this.onComplete, this.onError}) : super._();

  final void Function(User user, bool isFirstSignin)? onComplete;
  final void Function(Object? error, StackTrace stackTrace)? onError;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SigninWithGoogleCopyWith<SigninWithGoogle> get copyWith =>
      _$SigninWithGoogleCopyWithImpl<SigninWithGoogle>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.signinWithGoogle'))
      ..add(DiagnosticsProperty('onComplete', onComplete))
      ..add(DiagnosticsProperty('onError', onError));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SigninWithGoogle &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onComplete, onError);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.signinWithGoogle(onComplete: $onComplete, onError: $onError)';
  }
}

/// @nodoc
abstract mixin class $SigninWithGoogleCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $SigninWithGoogleCopyWith(
          SigninWithGoogle value, $Res Function(SigninWithGoogle) _then) =
      _$SigninWithGoogleCopyWithImpl;
  @useResult
  $Res call(
      {void Function(User user, bool isFirstSignin)? onComplete,
      void Function(Object? error, StackTrace stackTrace)? onError});
}

/// @nodoc
class _$SigninWithGoogleCopyWithImpl<$Res>
    implements $SigninWithGoogleCopyWith<$Res> {
  _$SigninWithGoogleCopyWithImpl(this._self, this._then);

  final SigninWithGoogle _self;
  final $Res Function(SigninWithGoogle) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(SigninWithGoogle(
      onComplete: freezed == onComplete
          ? _self.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(User user, bool isFirstSignin)?,
      onError: freezed == onError
          ? _self.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object? error, StackTrace stackTrace)?,
    ));
  }
}

/// @nodoc

class SigninWithApple extends AuthEvent with DiagnosticableTreeMixin {
  const SigninWithApple({this.onComplete, this.onError}) : super._();

  final void Function(User user, bool isFirstSignin)? onComplete;
  final void Function(Object? error, StackTrace stackTrace)? onError;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SigninWithAppleCopyWith<SigninWithApple> get copyWith =>
      _$SigninWithAppleCopyWithImpl<SigninWithApple>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.signinWithApple'))
      ..add(DiagnosticsProperty('onComplete', onComplete))
      ..add(DiagnosticsProperty('onError', onError));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SigninWithApple &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onComplete, onError);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.signinWithApple(onComplete: $onComplete, onError: $onError)';
  }
}

/// @nodoc
abstract mixin class $SigninWithAppleCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $SigninWithAppleCopyWith(
          SigninWithApple value, $Res Function(SigninWithApple) _then) =
      _$SigninWithAppleCopyWithImpl;
  @useResult
  $Res call(
      {void Function(User user, bool isFirstSignin)? onComplete,
      void Function(Object? error, StackTrace stackTrace)? onError});
}

/// @nodoc
class _$SigninWithAppleCopyWithImpl<$Res>
    implements $SigninWithAppleCopyWith<$Res> {
  _$SigninWithAppleCopyWithImpl(this._self, this._then);

  final SigninWithApple _self;
  final $Res Function(SigninWithApple) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(SigninWithApple(
      onComplete: freezed == onComplete
          ? _self.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(User user, bool isFirstSignin)?,
      onError: freezed == onError
          ? _self.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object? error, StackTrace stackTrace)?,
    ));
  }
}

/// @nodoc

class SigninWithEmailAndPassword extends AuthEvent
    with DiagnosticableTreeMixin {
  const SigninWithEmailAndPassword(
      {required this.email,
      required this.password,
      this.onComplete,
      this.onError})
      : super._();

  final String email;
  final String password;
  final void Function(User user, bool isFirstSignin)? onComplete;
  final void Function(Object? error, StackTrace stackTrace)? onError;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SigninWithEmailAndPasswordCopyWith<SigninWithEmailAndPassword>
      get copyWith =>
          _$SigninWithEmailAndPasswordCopyWithImpl<SigninWithEmailAndPassword>(
              this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is SigninWithEmailAndPassword &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.signinWithEmailAndPassword(email: $email, password: $password, onComplete: $onComplete, onError: $onError)';
  }
}

/// @nodoc
abstract mixin class $SigninWithEmailAndPasswordCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $SigninWithEmailAndPasswordCopyWith(SigninWithEmailAndPassword value,
          $Res Function(SigninWithEmailAndPassword) _then) =
      _$SigninWithEmailAndPasswordCopyWithImpl;
  @useResult
  $Res call(
      {String email,
      String password,
      void Function(User user, bool isFirstSignin)? onComplete,
      void Function(Object? error, StackTrace stackTrace)? onError});
}

/// @nodoc
class _$SigninWithEmailAndPasswordCopyWithImpl<$Res>
    implements $SigninWithEmailAndPasswordCopyWith<$Res> {
  _$SigninWithEmailAndPasswordCopyWithImpl(this._self, this._then);

  final SigninWithEmailAndPassword _self;
  final $Res Function(SigninWithEmailAndPassword) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(SigninWithEmailAndPassword(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      onComplete: freezed == onComplete
          ? _self.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(User user, bool isFirstSignin)?,
      onError: freezed == onError
          ? _self.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object? error, StackTrace stackTrace)?,
    ));
  }
}

/// @nodoc

class SignOut extends AuthEvent with DiagnosticableTreeMixin {
  const SignOut({this.onSignedOut}) : super._();

  final Function()? onSignedOut;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignOutCopyWith<SignOut> get copyWith =>
      _$SignOutCopyWithImpl<SignOut>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.signOut'))
      ..add(DiagnosticsProperty('onSignedOut', onSignedOut));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignOut &&
            (identical(other.onSignedOut, onSignedOut) ||
                other.onSignedOut == onSignedOut));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onSignedOut);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.signOut(onSignedOut: $onSignedOut)';
  }
}

/// @nodoc
abstract mixin class $SignOutCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $SignOutCopyWith(SignOut value, $Res Function(SignOut) _then) =
      _$SignOutCopyWithImpl;
  @useResult
  $Res call({Function()? onSignedOut});
}

/// @nodoc
class _$SignOutCopyWithImpl<$Res> implements $SignOutCopyWith<$Res> {
  _$SignOutCopyWithImpl(this._self, this._then);

  final SignOut _self;
  final $Res Function(SignOut) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? onSignedOut = freezed,
  }) {
    return _then(SignOut(
      onSignedOut: freezed == onSignedOut
          ? _self.onSignedOut
          : onSignedOut // ignore: cast_nullable_to_non_nullable
              as Function()?,
    ));
  }
}

/// @nodoc

class DismissSigninError extends AuthEvent with DiagnosticableTreeMixin {
  const DismissSigninError() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.dismissSigninError'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DismissSigninError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.dismissSigninError()';
  }
}

/// @nodoc

class ReceiveAuthStateChange extends AuthEvent with DiagnosticableTreeMixin {
  const ReceiveAuthStateChange({this.user}) : super._();

  final User? user;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceiveAuthStateChangeCopyWith<ReceiveAuthStateChange> get copyWith =>
      _$ReceiveAuthStateChangeCopyWithImpl<ReceiveAuthStateChange>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.receiveAuthStateChange'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceiveAuthStateChange &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.receiveAuthStateChange(user: $user)';
  }
}

/// @nodoc
abstract mixin class $ReceiveAuthStateChangeCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $ReceiveAuthStateChangeCopyWith(ReceiveAuthStateChange value,
          $Res Function(ReceiveAuthStateChange) _then) =
      _$ReceiveAuthStateChangeCopyWithImpl;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class _$ReceiveAuthStateChangeCopyWithImpl<$Res>
    implements $ReceiveAuthStateChangeCopyWith<$Res> {
  _$ReceiveAuthStateChangeCopyWithImpl(this._self, this._then);

  final ReceiveAuthStateChange _self;
  final $Res Function(ReceiveAuthStateChange) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = freezed,
  }) {
    return _then(ReceiveAuthStateChange(
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class ReceiveUserChange extends AuthEvent with DiagnosticableTreeMixin {
  const ReceiveUserChange({this.user}) : super._();

  final User? user;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceiveUserChangeCopyWith<ReceiveUserChange> get copyWith =>
      _$ReceiveUserChangeCopyWithImpl<ReceiveUserChange>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.receiveUserChange'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceiveUserChange &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.receiveUserChange(user: $user)';
  }
}

/// @nodoc
abstract mixin class $ReceiveUserChangeCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory $ReceiveUserChangeCopyWith(
          ReceiveUserChange value, $Res Function(ReceiveUserChange) _then) =
      _$ReceiveUserChangeCopyWithImpl;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class _$ReceiveUserChangeCopyWithImpl<$Res>
    implements $ReceiveUserChangeCopyWith<$Res> {
  _$ReceiveUserChangeCopyWithImpl(this._self, this._then);

  final ReceiveUserChange _self;
  final $Res Function(ReceiveUserChange) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = freezed,
  }) {
    return _then(ReceiveUserChange(
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
mixin _$AuthState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState()';
  }
}

/// @nodoc
class $AuthStateCopyWith<$Res> {
  $AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}

/// @nodoc

class AuthStateInitial extends AuthState with DiagnosticableTreeMixin {
  const AuthStateInitial() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial()';
  }
}

/// @nodoc

class AuthStateSignedOut extends AuthState with DiagnosticableTreeMixin {
  const AuthStateSignedOut() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState.signedOut'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStateSignedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.signedOut()';
  }
}

/// @nodoc

class AuthStateSigningIn extends AuthState with DiagnosticableTreeMixin {
  const AuthStateSigningIn() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState.signingIn'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStateSigningIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.signingIn()';
  }
}

/// @nodoc

class AuthStateSignedIn extends AuthState with DiagnosticableTreeMixin {
  const AuthStateSignedIn({required this.user}) : super._();

  final User user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthStateSignedInCopyWith<AuthStateSignedIn> get copyWith =>
      _$AuthStateSignedInCopyWithImpl<AuthStateSignedIn>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.signedIn'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthStateSignedIn &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.signedIn(user: $user)';
  }
}

/// @nodoc
abstract mixin class $AuthStateSignedInCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthStateSignedInCopyWith(
          AuthStateSignedIn value, $Res Function(AuthStateSignedIn) _then) =
      _$AuthStateSignedInCopyWithImpl;
  @useResult
  $Res call({User user});
}

/// @nodoc
class _$AuthStateSignedInCopyWithImpl<$Res>
    implements $AuthStateSignedInCopyWith<$Res> {
  _$AuthStateSignedInCopyWithImpl(this._self, this._then);

  final AuthStateSignedIn _self;
  final $Res Function(AuthStateSignedIn) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(AuthStateSignedIn(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class AuthStateErrorOccured extends AuthState with DiagnosticableTreeMixin {
  const AuthStateErrorOccured() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthState.error'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStateErrorOccured);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.error()';
  }
}

// dart format on
