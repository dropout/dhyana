import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:dhyana/data_provider/auth/all.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/service/analytics_service.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_factory.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final Logger logger = getLogger('AuthBloc');

  final AuthRepository _authRepository;
  final AnalyticsService _analyticsService;
  final CrashlyticsService _crashlyticsService;

  late StreamSubscription _authStateChangeSub;
  late StreamSubscription _userChangeSub;

  AuthBloc({
    required AuthRepository authenticationRepository,
    required AnalyticsService analyticsService,
    required CrashlyticsService crashlyticsService,
    AuthState initialAuthState = const AuthState.initial(),
  }) :
    _authRepository = authenticationRepository,
    _analyticsService = analyticsService,
    _crashlyticsService = crashlyticsService,
  super(initialAuthState) {

    // Handling auth state change stream
    _authStateChangeSub = _authRepository.authStateChange
      .listen((User? user) {
        add(AuthEvent.receiveAuthStateChange(user: user));
      });
    _authStateChangeSub.onError((error, stackTrace) {
      _crashlyticsService.recordError(
        exception: error,
        stackTrace: stackTrace,
        reason: 'Error occured when receiving event from _auth_ state change stream'
      );
    });

    // Handling user change stream
    _userChangeSub = _authRepository.userChange
      .listen((User? user) {
        add(AuthEvent.receiveUserChange(user: user));
      });

    _userChangeSub.onError((error, stackTrace) {
      _crashlyticsService.recordError(
        exception: error,
        stackTrace: stackTrace,
        reason: 'Error occured when receiving event from _user_ state change stream'
      );
    });

    on<InitializeAuth>(_onInitializeAuth);
    on<SigninWithGoogle>(_onSigninWithGoogle);
    on<SigninWithApple>(_onSigninWithApple);
    on<SigninWithEmailAndPassword>(_onSigninWithEmailAndPassword);
    on<ReceiveAuthStateChange>(_onAuthStateChange);
    on<ReceiveUserChange>(_onUserChange);
    on<SignOut>(_onSignout);
    on<DismissSigninError>(_onDismissSigninError);
  }

  void _onInitializeAuth(InitializeAuth event, emit) async {
    User? user = await _authRepository.authStateChange.first;
    if (user != null) {
      emit(AuthState.signedIn(user: user));
    } else {
      emit(const AuthState.signedOut());
    }
  }

  void _onSigninWithGoogle(SigninWithGoogle event, emit) async {
    try {
      logger.v('Signing in with Google');
      emit(const AuthState.signingIn());
      User user = await _signin(SigninMethodType.google);
      emit(AuthState.signedIn(user: user));
      event.onComplete?.call(user);
      _logAnalyticsSuccessfulSignin();
      logger.v('Successfully signed in with Google');
    } on SignInCancelled {
      logger.v('Sign in cancelled');
      emit(const AuthState.signedOut());
    } catch (e, stack) {
      _crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to sign in with Google'
      );
      emit(const AuthState.error());
      event.onError?.call(e, stack);
    }
  }

  void _onSigninWithApple(SigninWithApple event, emit) async {
    try {
      logger.v('Signing in with Apple');
      emit(const AuthState.signingIn());
      User user = await _signin(SigninMethodType.apple);
      emit(AuthState.signedIn(user: user));
      event.onComplete?.call(user);
      _logAnalyticsSuccessfulSignin();
      logger.v('Successfully signed in with Apple');
    } on SignInCancelled {
      logger.v('Sign in cancelled');
      emit(const AuthState.signedOut());
    } catch (e, stack) {
      _crashlyticsService.recordError(
          exception: e,
          stackTrace: stack,
          reason: 'Unable to sign in with Apple'
      );
      emit(const AuthState.error());
      event.onError?.call(e, stack);
    }

  }

  void _onSigninWithEmailAndPassword(
    SigninWithEmailAndPassword event, emit
  ) async {
    try {
      logger.v('Signing in with Email and Password...');
      emit(const AuthState.signingIn());
      User user = await _signin(SigninMethodType.emailAndPassword,
        email: event.email,
        password: event.password,
      );
      emit(AuthState.signedIn(user: user));
      event.onComplete?.call(user);
      _logAnalyticsSuccessfulSignin();
      logger.v('Successfully signed in with Email and Password');
    } on SignInCancelled {
      logger.v('Sign in cancelled');
      emit(const AuthState.signedOut());
    } catch (e, stack) {
      _crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to sign in with Email and Password'
      );
      emit(const AuthState.error());
      event.onError?.call(e, stack);
    }
  }

  void _onAuthStateChange(ReceiveAuthStateChange event, emit) async {
    User? user = event.user;
    if (user != null) {
      logger.v('AuthState change received, user signed in...');
      emit(AuthState.signedIn(user: user));
    } else {
      logger.v('AuthState change received, user signed out...');
      emit(const AuthState.signedOut());
    }
  }

  // TODO: Update relevant profile data when changed
  void _onUserChange(ReceiveUserChange event, emit) async {
    User? user = event.user;

    if (user == null) {
      logger.v('User change received signed out...');
      emit(const AuthState.signedOut());
    } else {
      logger.v('User change received signed in...');
      emit(AuthState.signedIn(user: user));
    }
  }

  void _onSignout(SignOut event, emit) async {
    try {
      logger.v('Signing out...');
      await _authRepository.signOut();
      _authStateChangeSub.cancel();
      _userChangeSub.cancel();
      event.onSignedOut?.call();
      emit(const AuthState.signedOut());
      logger.v('Successfully signed out');
      _logAnalyticsSuccessfulSignout();
    } catch (error, stackTrace) {
      _crashlyticsService.recordError(
        exception: error,
        stackTrace: stackTrace,
        reason: 'Unable to sign out!',
      );
    }
  }

  void _onDismissSigninError(DismissSigninError event, emit) {
    emit(const AuthState.signedOut());
  }

  @override
  Future<void> close() async {
    _authStateChangeSub.cancel();
    _userChangeSub.cancel();
    return super.close();
  }

  Future<User> _signin(SigninMethodType signinMethodType, {
    String? email,
    String? password
  }) async {
    User user;
    if (signinMethodType == SigninMethodType.emailAndPassword) {
      user = await _authRepository.signIn(signinMethodType,
        email: email,
        password: password,
      );
    } else {
      user = await _authRepository.signIn(signinMethodType);
    }
    return user;
  }

  void _logAnalyticsSuccessfulSignin() {
    _analyticsService.logEvent(name: 'sign_in',);
  }

  void _logAnalyticsSuccessfulSignout() {
    _analyticsService.logEvent(name: 'sign_out',);
  }

}
