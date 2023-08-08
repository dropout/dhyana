// General
class SignInFailure implements Exception {}

// Google
class SignInWithGoogleFailure implements Exception {
  final String msg;
  const SignInWithGoogleFailure(this.msg);
  @override
  String toString() => 'SignInWithGoogleFailure: $msg';
}

// Apple
class SignInWithAppleFailure implements Exception {
  final String msg;
  const SignInWithAppleFailure(this.msg);
  @override
  String toString() => 'SignInWithAppleFailure: $msg';
}

// Specific exception to handle case when user cancels
// the signin process
class SignInCancelled implements Exception {
  final String msg;
  const SignInCancelled(this.msg);
  @override
  String toString() => 'SignInWithAppleFailure: $msg';
}