import 'package:auth/src/presentation/view/login/login_signed_in_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_signed_out_view.dart';

class LoginView extends StatelessWidget {

  final AuthState authState;

  const LoginView({
    required this.authState,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    switch (authState) {
      case AuthStateErrorOccured():
        return AppErrorDisplay(
          onButtonTap: () =>
            context.read<AuthStateCubit>().dismissSigninError(),
        );
      case AuthStateSigningIn():
        return AppLoadingDisplay();
      case AuthStateSignedIn(userId: final userId):
        return LoginSignedInView(
          profileId: userId,
        );
      default:
        return LoginSignedOutView();
    }
  }

}
