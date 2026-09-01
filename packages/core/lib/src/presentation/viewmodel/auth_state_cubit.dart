import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'auth_state_cubit.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.signedOut() = AuthStateSignedOut;
  const factory AuthState.signingIn() = AuthStateSigningIn;
  const factory AuthState.signedIn({required String userId}) =
      AuthStateSignedIn;
  const factory AuthState.error() = AuthStateErrorOccured;
}

abstract class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit(super.initialState);
  Future<void> signinWithGoogle({
    void Function(String userId, bool isAuthenticated)? onComplete,
  });
  Future<void> signinWithApple({
    void Function(String userId, bool isAuthenticated)? onComplete,
  });
  Future<void> signOut();
  void dismissSigninError();
}

