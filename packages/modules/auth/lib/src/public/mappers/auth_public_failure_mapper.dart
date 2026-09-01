import 'package:auth/src/data/datasource/auth/exception.dart';
import 'package:auth/src/public/types/auth_public_failure.dart';

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
    return AuthPublicUnknownFailure(toString());
  }
}