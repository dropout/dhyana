import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_signed_out_view.dart';

class LoginView extends StatelessWidget {

  final AuthState authState;

  const LoginView({
    required this.authState,
    super.key
  });

  void _onSigninCompleted(BuildContext context, user, bool isFirstSignin) {
    if (isFirstSignin) {
      ProfileWizardRoute(profileId: user.uid).replace(context);
    } else {
      ProfileRoute(profileId: user.uid).replace(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (authState) {
      case AuthStateErrorOccured():
        return AppErrorDisplay(
          onButtonTap: () =>
            context.read<AuthCubit>().dismissSigninError(),
        );
      case AuthStateSigningIn():
        return AppLoadingDisplay();
      default:
        return LoginSignedOutView(
          onSigninComplete: (user, isFirstSignin) =>
            _onSigninCompleted(context, user, isFirstSignin),
        );
    }
  }

}
