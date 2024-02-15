import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/widget/bloc_provider/profile_bloc_provider.dart';
import 'package:dhyana/widget/profile/profile_view.dart';
import 'package:dhyana/widget/util/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  /*
      In case a profile is passed, use that to display.
      If no profile is passed use the id to load the profile.
   */
  final String profileId;

  const ProfileScreen({
    required this.profileId,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: ProfileBlocProvider(
          initialEvent: ProfileEvent.loadProfile(profileId: profileId),
          child: buildBody(context),
        ),
      )
    );
  }

  Widget buildBody(BuildContext context) {
    return const Stack(
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
