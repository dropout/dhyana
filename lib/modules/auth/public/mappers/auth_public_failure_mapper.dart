import 'package:dhyana/modules/auth/data/datasource/auth/exception.dart';
import 'package:dhyana/modules/auth/public/types/auth_public_failure.dart';

extension AuthPublicFailureMapper on Object {
  AuthPublicFailure toPublicFailure() {
    if (this is SignInCancelled) {
      return AuthPublicSignInCancelled((this as SignInCancelled).msg);
    }
    if (this is SignInWithGoogleFailure) {
      return AuthPublicSignInWithGoogleFailure(
        (this as SignInWithGoogleFailure).msg,
      );
    }
    if (this is SignInWithAppleFailure) {
      return AuthPublicSignInWithAppleFailure(
        (this as SignInWithAppleFailure).msg,
      );
    }
    if (this is SignInWithEmailAndPasswordFailure) {
      return AuthPublicSignInWithEmailAndPasswordFailure(
        (this as SignInWithEmailAndPasswordFailure).msg,
      );
    }
    if (this is SignInFailure) {
      return const AuthPublicUnknownFailure('Sign-in failed');
    }
    return AuthPublicUnknownFailure(toString());
  }
}