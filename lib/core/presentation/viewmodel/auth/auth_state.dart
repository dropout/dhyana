part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.signedOut() = AuthStateSignedOut;
  const factory AuthState.signingIn() = AuthStateSigningIn;
  const factory AuthState.signedIn({required User user}) = AuthStateSignedIn;
  const factory AuthState.error() = AuthStateErrorOccured;
}
