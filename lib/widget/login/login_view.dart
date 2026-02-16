import 'package:dhyana/bloc/auth/auth_bloc.dart';
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
        return LoginSignedOutView();
    }
  }

}
