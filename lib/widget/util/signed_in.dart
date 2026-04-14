import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that conditionally renders based on whether 
/// the user is signed in or not.
class SignedIn extends StatelessWidget {

  /// The widget to render if the user is signed in. The builder function
  /// provides the [BuildContext] and the signed in user's profile ID.
  final Widget Function(BuildContext context, String profileId) yes;
  
  /// The widget to render if the user is not signed in. 
  /// Defaults to an empty widget.
  final Widget no;

  /// Creates a [SignedIn] widget.
  const SignedIn({
    required this.yes,
    this.no = const SizedBox.shrink(),
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        switch (state) {
          case AuthStateSignedIn():
            return yes(context, state.user.uid);
          default:
            return no;
        }
      },
    );
  }

}
