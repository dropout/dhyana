import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/widget/bloc_provider/profile_bloc_provider.dart';
import 'package:dhyana/widget/profile/profile_view.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/custom_app_bar.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SignedIn(
        yes: (context, user) {
          return ProfileBlocProvider(
            initialEvent: ProfileEvent.loadProfile(
              profileId: user.uid
            ),
            child: buildBody(context),
          );
        },
        no: const AppErrorDisplay(),
      )
    );
  }

  Widget buildBody(BuildContext context) {
    return const Stack(
      // fit: StackFit.expand,
      children: [
        Padding(
          padding: EdgeInsets.only(top: CustomAppBar.height),
          child: ProfileView(),
        ),
        CustomAppBar(
          title: 'Profil',
        ),
      ],
    );
  }

}
