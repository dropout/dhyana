import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignedIn extends StatelessWidget {

  final Widget Function(BuildContext context, String profileId) yes;
  final Widget no;

  const SignedIn({
    required this.yes,
    this.no = const SizedBox.shrink(),
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
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
