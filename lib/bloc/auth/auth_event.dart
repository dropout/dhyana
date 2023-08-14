part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {

  const AuthEvent._();

  const factory AuthEvent.initializeAuth() = InitializeAuth;

  const factory AuthEvent.signinWithGoogle({
    void Function(User user)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) = SigninWithGoogle;

  const factory AuthEvent.signinWithApple({
    void Function(User user)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) = SigninWithApple;

  const factory AuthEvent.signinWithEmailAndPassword({
    required String email,
    required String password,
    void Function(User user)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) = SigninWithEmailAndPassword;

  const factory AuthEvent.signOut({
    Function()? onSignedOut,
  }) = SignOut;

  const factory AuthEvent.dismissSigninError() = DismissSigninError;

  const factory AuthEvent.receiveAuthStateChange({
    User? user
  }) = ReceiveAuthStateChange;

  const factory AuthEvent.receiveUserChange({
    User? user,
  }) = ReceiveUserChange;

}
