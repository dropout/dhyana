import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/util/app_circular_progress_indicator.dart';
import 'package:dhyana/widget/util/home_screen_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileButton extends StatelessWidget {

  static const double size = 36.0;

  const ProfileButton({
    super.key
  });
  
  void _signedOutTap(BuildContext context) {
    context.pushNamed(AppScreen.login.name);
  }

  void _signedInTap(BuildContext context, Profile profile) {
    if (profile.completed) {
      context.pushNamed(AppScreen.profile.name);
    } else {
      context.pushNamed(AppScreen.profileWizard.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        switch (state) {
          case AuthStateSignedIn():
            return buildSignedIn(context, state);
          default:
            return buildSignedOut(context);
        }
      },
    );
  }
  
  Widget buildSignedOut(context) {
    return GestureDetector(
      onTap: () => _signedOutTap(context),
      child: const HomeScreenMenuButton(
        child: Icon(
          Icons.account_circle_rounded,
          size: 30,
          color: Colors.white,
        )
      ),
    );
  }

  Widget buildSignedIn(BuildContext context, AuthStateSignedIn authState) {
    return ProfileBlocProvider(
      initialEvent: ProfileEvent.loadProfile(profileId: authState.user.uid),
      child: buildProfileStateDisplay(context),
    );
  }

  Widget buildProfileStateDisplay(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch(state) {
          case ProfileLoadedState():
            return buildProfileLoaded(context, state.profile);
          default:
            return buildProfileLoading(context);
        }
      }
    );
  }

  Widget buildProfileLoading(BuildContext context) {
    return const HomeScreenMenuButton(
      child: Center(
        child: AppCircularProgressIndicator(),
      ),
    );
  }

  Widget buildProfileLoaded(BuildContext context, Profile profile) {
    return GestureDetector(
      onTap: () => _signedInTap(context, profile),
      child: HomeScreenMenuButton(
        child: ProfileImage.fromProfile(profile),
      ),
    );
  }

}
