part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _AuthState;
  const factory AuthState.signedOut() = _AuthStateSignedOut;
  const factory AuthState.signingIn() = _AuthStateSigningIn;
  const factory AuthState.signedIn({required User user}) = _AuthStateSignedIn;
  const factory AuthState.error() = _AuthStateErrorOccured;
}
