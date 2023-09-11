import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/util/app_circular_progress_indicator.dart';
import 'package:dhyana/widget/util/app_snack_bar.dart';
import 'package:dhyana/widget/util/home_screen_menu_button.dart';
import 'package:dhyana/widget/util/signed_in.dart';
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

  void _profileLoadErrorTap(BuildContext context) {
    context.pushNamed(AppScreen.profile.name);
  }

  @override
  Widget build(BuildContext context) {
    return SignedIn(
      yes: (context, user) {
        return buildSignedIn(context, user.uid);
      },
      no: buildSignedOut(context),
    );
  }
  
  Widget buildSignedOut(context) {
    return HomeScreenMenuButton(
      onTap: () => _signedOutTap(context),
      child: const Icon(
        Icons.account_circle_rounded,
        size: 30,
        color: Colors.white,
      )
    );
  }

  Widget buildSignedIn(BuildContext context, String userId) {
    return ProfileBlocProvider(
      initialEvent: ProfileEvent.loadProfile(
        profileId: userId,
        onError: (_, __) {
          ScaffoldMessenger.of(context).showSnackBar(
            getErrorSnackBar(context, 'An error occured while trying to load your profile!'),
          );
        }
      ),
      child: buildProfileStateDisplay(context),
    );
  }

  Widget buildProfileStateDisplay(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch(state) {
          case ProfileLoadingState():
            return buildProfileLoading(context);
          case ProfileErrorState():
            return buildProfileError(context);
          case ProfileLoadedState():
            return buildProfileLoaded(context, state.profile);
        }
      }
    );
  }

  Widget buildProfileLoading(BuildContext context) {
    return const HomeScreenMenuButton(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: AppCircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildProfileLoaded(BuildContext context, Profile profile) {
    return HomeScreenMenuButton(
      onTap: () => _signedInTap(context, profile),
      child: ProfileImage.fromProfile(profile),
    );
  }

  Widget buildProfileError(BuildContext context) {
    return HomeScreenMenuButton(
      onTap: () => _profileLoadErrorTap(context),
      child: const Center(
        child: Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

}
