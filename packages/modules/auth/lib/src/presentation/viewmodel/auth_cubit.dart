import 'dart:async';

import 'package:auth/src/data/datasource/auth/exception.dart';
import 'package:auth/src/public/api/auth_public_api.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> with LoggerMixin implements AuthStateCubit {

  final ProfileNavigator profileNavigator;
  final AuthPublicApi authApi;
  final AnalyticsService analyticsService;
  final CrashlyticsService crashlyticsService;

  late StreamSubscription<String?> _userIdStreamSub;

  AuthCubit({
    required this.profileNavigator,
    required this.authApi,
    required this.analyticsService,
    required this.crashlyticsService,
    AuthState initialAuthState = const AuthState.initial(),
  }) : super(initialAuthState) {
    _userIdStreamSub = authApi.authSessionStream
        .map((s) => s.userId)
        .listen(
          _handleUserIdChange,
          onError: (error, stackTrace) {
            crashlyticsService.recordError(
              exception: error,
              stackTrace: stackTrace,
              reason: 'Error occured when receiving event from _userId_ stream',
            );
          },
        );
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

  @override
  Future<void> signinWithGoogle({
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
      _handleSuccessfulSigninRedirect(userId, isFirstSignin);
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

  @override
  Future<void> signinWithApple({
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
      _handleSuccessfulSigninRedirect(userId, isFirstSignin);
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

  @override
  Future<void> signinWithEmailAndPassword({
    required String email,
    required String password,
    void Function(String userId)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) async {
    try {
      logger.t('Signing in with Email and Password...');
      emit(const AuthState.signingIn());
      final userId = await authApi.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthState.signedIn(userId: userId));
      onComplete?.call(userId);
      _logAnalyticsSuccessfulSignin();
      logger.t('Successfully signed in with Email and Password');

      // Email/password sign-in is currently only used for integration tests,
      // so we don't need to handle first-time sign-in redirects here.
      profileNavigator.navigateToProfile(userId, type: .replace);
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

  @override
  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      logger.t('Signing up with Email and Password...');
      emit(const AuthState.signingIn());
      final userId = await authApi.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthState.signedIn(userId: userId));
      logger.t('Successfully signed up with Email and Password');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to sign up with Email and Password',
      );
      emit(const AuthState.error());
    }
  }

  @override
  Future<void> signOut({Function()? onSignedOut}) async {
    try {
      logger.t('Signing out...');
      await authApi.signOut();
      _userIdStreamSub.cancel();
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

  @override
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

  void _handleSuccessfulSigninRedirect(String userId, bool isFirstSignin) {
    if (isFirstSignin) {
      profileNavigator.navigateToProfileWizard(userId, type: .replace);
    } else {
      profileNavigator.navigateToProfile(userId, type: .replace);

    }
  }

  void _logAnalyticsSuccessfulSignin() {
    analyticsService.logEvent(name: 'sign_in');
  }

  void _logAnalyticsSuccessfulSignout() {
    analyticsService.logEvent(name: 'sign_out');
  }
}
