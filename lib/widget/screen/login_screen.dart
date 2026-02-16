import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/auth/auth_bloc.dart';

import '../app_bar/custom_app_bar.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              leading: CustomBackButton(),
            ),
            body: LoginView(
              authState: state,
            ),
          );

        }
    );
  }
}
