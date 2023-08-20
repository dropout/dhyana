import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/widgets/bloc_provider/profile_bloc_provider.dart';
import 'package:dhyana/widgets/profile/profile_view.dart';
import 'package:dhyana/widgets/util/app_back_button.dart';
import 'package:dhyana/widgets/util/app_error_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          switch (state) {
            case AuthStateSignedIn():
              return ProfileBlocProvider(
                initialEvent: ProfileEvent.loadProfile(
                  profileId: state.user.uid
                ),
                child: buildBody(context),
              );
            default:
              return const AppErrorDisplay();
          }
        },
      )
    );
  }

  Widget buildBody(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: [
        ProfileView(),
        AppBackButton(),
      ],
    );
  }

}
