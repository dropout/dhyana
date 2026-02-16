import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/data_provider/auth/all.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/service/analytics_service.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';

part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthCubit extends Cubit<AuthState> with LoggerMixin {

  final AuthRepository _authRepository;
  final AnalyticsService _analyticsService;
  final CrashlyticsService _crashlyticsService;

  late StreamSubscription<User?> _authStateChangeSub;
  late StreamSubscription<User?> _userChangeSub;

  AuthCubit({
    required AuthRepository authenticationRepository,
    required AnalyticsService analyticsService,
    required CrashlyticsService crashlyticsService,
    AuthState initialAuthState = const AuthState.initial(),
  }) :
    _authRepository = authenticationRepository,
    _analyticsService = analyticsService,
    _crashlyticsService = crashlyticsService,
  super(initialAuthState) {

    _authStateChangeSub = _authRepository.authStateChange.listen(
      _handleAuthStateChange,
      onError: (error, stackTrace) {
        _crashlyticsService.recordError(
          exception: error,
          stackTrace: stackTrace,
          reason: 'Error occured when receiving event from _auth_ state change stream'
        );
      },
    );

    _userChangeSub = _authRepository.userChange.listen(
      _handleUserChange,
      onError: (error, stackTrace) {
        _crashlyticsService.recordError(
          exception: error,
          stackTrace: stackTrace,
          reason: 'Error occured when receiving event from _user_ state change stream'
        );
      },
    );
  }

  Future<void> initializeAuth() async {
    if (isClosed) { return; }

    User? user = await _authRepository.authStateChange.first;
    if (user != null) {
      emit(AuthState.signedIn(user: user));
    } else {
      emit(const AuthState.signedOut());
    }
  }

  Future<void> signInWithGoogle({
    void Function(User user, bool isFirstSignin)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) async {
    try {
      logger.t('Signing in with Google');
      emit(const AuthState.signingIn());
      var (user, isFirstSignin) = await _authRepository
        .signIn(SigninMethodType.google);
      emit(AuthState.signedIn(user: user));
      onComplete?.call(user, isFirstSignin);
      _logAnalyticsSuccessfulSignin();
      logger.t('Successfully signed in with Google');
    } on SignInCancelled {
      logger.t('Sign in cancelled');
      emit(const AuthState.signedOut());
    } catch (e, stack) {
      _crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to sign in with Google'
      );
      emit(const AuthState.error());
      onError?.call(e, stack);
    }
  }

  Future<void> signInWithApple({
    void Function(User user, bool isFirstSignin)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) async {
    try {
      logger.t('Signing in with Apple');
      emit(const AuthState.signingIn());
      var (user, isFirstSignin) = await _authRepository
        .signIn(SigninMethodType.apple);
      emit(AuthState.signedIn(user: user));
      onComplete?.call(user, isFirstSignin);
      _logAnalyticsSuccessfulSignin();
      logger.t('Successfully signed in with Apple');
    } on SignInCancelled {
      logger.t('Sign in cancelled');
      emit(const AuthState.signedOut());
    } catch (e, stack) {
      _crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to sign in with Apple'
      );
      emit(const AuthState.error());
      onError?.call(e, stack);
    }

  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    void Function(User user, bool isFirstSignin)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) async {
    try {
      logger.t('Signing in with Email and Password...');
      emit(const AuthState.signingIn());
      var (user, isFirstSignin) = await _authRepository.signIn(
        SigninMethodType.emailAndPassword,
        email: email,
        password: password,
      );
      emit(AuthState.signedIn(user: user));
      onComplete?.call(user, isFirstSignin);
      _logAnalyticsSuccessfulSignin();
      logger.t('Successfully signed in with Email and Password');
    } on SignInCancelled {
      logger.t('Sign in cancelled');
      emit(const AuthState.signedOut());
    } catch (e, stack) {
      _crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to sign in with Email and Password'
      );
      emit(const AuthState.error());
      onError?.call(e, stack);
    }
  }

  Future<void> signOut({
    Function()? onSignedOut,
  }) async {
    try {
      logger.t('Signing out...');
      await _authRepository.signOut();
      await _authStateChangeSub.cancel();
      await _userChangeSub.cancel();
      onSignedOut?.call();
      emit(const AuthState.signedOut());
      logger.t('Successfully signed out');
      _logAnalyticsSuccessfulSignout();
    } catch (error, stackTrace) {
      _crashlyticsService.recordError(
        exception: error,
        stackTrace: stackTrace,
        reason: 'Unable to sign out!',
      );
    }
  }

  void dismissSigninError() {
    emit(const AuthState.signedOut());
  }

  void _handleAuthStateChange(User? user) {
    if (isClosed) {
      return;
    }
    if (user != null) {
      logger.t('AuthState change received, user signed in...');
      emit(AuthState.signedIn(user: user));
    } else {
      logger.t('AuthState change received, user signed out...');
      emit(const AuthState.signedOut());
    }
  }

  // TODO: Update relevant profile data when changed
  void _handleUserChange(User? user) {
    if (isClosed) {
      return;
    }
    if (user == null) {
      logger.t('User change received signed out...');
      emit(const AuthState.signedOut());
    } else {
      logger.t('User change received signed in...');
      emit(AuthState.signedIn(user: user));
    }
  }

  @override
  Future<void> close() async {
    await _authStateChangeSub.cancel();
    await _userChangeSub.cancel();
    return super.close();
  }

  void _logAnalyticsSuccessfulSignin() {
    _analyticsService.logEvent(name: 'sign_in',);
  }

  void _logAnalyticsSuccessfulSignout() {
    _analyticsService.logEvent(name: 'sign_out',);
  }

}
