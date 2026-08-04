import 'dart:async';
import 'package:dhyana/modules/auth/data/datasource/auth/exception.dart';
import 'package:dhyana/modules/auth/public/api/auth_public_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/core/service/analytics_service.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';

part 'auth_cubit.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.signedOut() = AuthStateSignedOut;
  const factory AuthState.signingIn() = AuthStateSigningIn;
  const factory AuthState.signedIn({required String userId}) = AuthStateSignedIn;
  const factory AuthState.error() = AuthStateErrorOccured;
}


class AuthCubit extends Cubit<AuthState> with LoggerMixin {
  final AuthPublicApi authApi;
  final AnalyticsService analyticsService;
  final CrashlyticsService crashlyticsService;

  late StreamSubscription<String?> _userIdStreamSub;

  AuthCubit({
    required this.authApi,
    required this.analyticsService,
    required this.crashlyticsService,    
    AuthState initialAuthState = const AuthState.initial(),
  }) : super(initialAuthState) {


    _userIdStreamSub = authApi.authSessionStream.map((s) => s.userId).listen(_handleUserIdChange, onError: (error, stackTrace) {
      crashlyticsService.recordError(
        exception: error,
        stackTrace: stackTrace,
        reason: 'Error occured when receiving event from _userId_ stream',
      );
    });
  }

  Future<void> initializeAuth() async {
    if (isClosed) {
      return;
    }

    String? userId = (await authApi.authSessionStream.first).userId;
    if (userId != null) {
      emit(AuthState.signedIn(userId: userId));
    } else {
      emit(const AuthState.signedOut());
    }
  }

  Future<void> signInWithGoogle({
    void Function(String userId, bool isFirstSignin)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) async {
    try {
      logger.t('Signing in with Google');
      emit(const AuthState.signingIn());
      final (:userId, :isFirstSignin) = await authApi.signInWithGoogle();
      emit(AuthState.signedIn(userId: userId));
      onComplete?.call(userId, isFirstSignin);
      _logAnalyticsSuccessfulSignin();
      logger.t('Successfully signed in with Google');
    } on SignInCancelled {
      logger.t('Sign in cancelled');
      emit(const AuthState.signedOut());
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to sign in with Google',
      );
      emit(const AuthState.error());
      onError?.call(e, stack);
    }
  }

  Future<void> signInWithApple({
    void Function(String userId, bool isFirstSignin)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) async {
    try {
      logger.t('Signing in with Apple');
      emit(const AuthState.signingIn());
      final (:userId, :isFirstSignin) = await authApi.signInWithApple();
      emit(AuthState.signedIn(userId: userId));
      onComplete?.call(userId, isFirstSignin);
      _logAnalyticsSuccessfulSignin();
      logger.t('Successfully signed in with Apple');
    } on SignInCancelled {
      logger.t('Sign in cancelled');
      emit(const AuthState.signedOut());
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to sign in with Apple',
      );
      emit(const AuthState.error());
      onError?.call(e, stack);
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    void Function(String userId, bool isFirstSignin)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) async {
    try {
      logger.t('Signing in with Email and Password...');
      emit(const AuthState.signingIn());
      final (:userId, :isFirstSignin) = await authApi.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthState.signedIn(userId: userId));
      onComplete?.call(userId, isFirstSignin);
      _logAnalyticsSuccessfulSignin();
      logger.t('Successfully signed in with Email and Password');
    } on SignInCancelled {
      logger.t('Sign in cancelled');
      emit(const AuthState.signedOut());
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to sign in with Email and Password',
      );
      emit(const AuthState.error());
      onError?.call(e, stack);
    }
  }

  Future<void> signOut({Function()? onSignedOut}) async {
    try {
      logger.t('Signing out...');
      await authApi.signOut();
      onSignedOut?.call();
      emit(const AuthState.signedOut());
      logger.t('Successfully signed out');
      _logAnalyticsSuccessfulSignout();
    } catch (error, stackTrace) {
      crashlyticsService.recordError(
        exception: error,
        stackTrace: stackTrace,
        reason: 'Unable to sign out!',
      );
    }
  }

  void dismissSigninError() {
    emit(const AuthState.signedOut());
  }

  void _handleUserIdChange(String? userId) {
    if (isClosed) {
      return;
    }
    if (userId != null) {
      logger.t('User ID change received, user signed in...');
      emit(AuthState.signedIn(userId: userId));
    } else {
      logger.t('User ID change received, user signed out...');
      emit(const AuthState.signedOut());
    }
  }

  @override
  Future<void> close() async {
    await _userIdStreamSub.cancel();
    return super.close();
  }

  void _logAnalyticsSuccessfulSignin() {
    analyticsService.logEvent(name: 'sign_in');
  }

  void _logAnalyticsSuccessfulSignout() {
    analyticsService.logEvent(name: 'sign_out');
  }
}
