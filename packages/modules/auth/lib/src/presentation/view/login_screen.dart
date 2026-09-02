import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';
import 'package:auth/src/presentation/view/login/login_view.dart';


class LoginScreen extends StatelessWidget {

  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStateCubit, AuthState>(
        builder: (context, authState) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              leading: CustomBackButton(),
            ),
            body: LoginView(
              authState: authState,
            ),
          );
        }
    );
  }
  
}
