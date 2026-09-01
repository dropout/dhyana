sealed class AuthPublicFailure implements Exception {
  final String message;

  const AuthPublicFailure(this.message);
}

final class AuthPublicSignInCancelled extends AuthPublicFailure {
  const AuthPublicSignInCancelled(super.message);
}

final class AuthPublicSignInWithGoogleFailure extends AuthPublicFailure {
  const AuthPublicSignInWithGoogleFailure(super.message);
}

final class AuthPublicSignInWithAppleFailure extends AuthPublicFailure {
  const AuthPublicSignInWithAppleFailure(super.message);
}

final class AuthPublicSignInWithEmailAndPasswordFailure extends AuthPublicFailure {
  const AuthPublicSignInWithEmailAndPasswordFailure(super.message);
}

final class AuthPublicUnknownFailure extends AuthPublicFailure {
  const AuthPublicUnknownFailure(super.message);
}