import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/util/app_loading_indicator.dart';
import 'package:dhyana/widget/util/app_snack_bar.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileButton extends StatelessWidget {

  static const double size = 40.0;

  const ProfileButton({
    super.key
  });
  
  void _signedOutTap(BuildContext context) {
    context.pushNamed(AppScreen.login.name);
  }

  void _signedInTap(BuildContext context, Profile profile) {
    String screenName = profile.completed ? AppScreen.profile.name :
      AppScreen.profileWizard.name;
    context.pushNamed(screenName, pathParameters: {
      'profileId': profile.id,
    });
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
    return GestureDetector(
      onTap: () => _signedOutTap(context),
      child: const Icon(
        Icons.account_circle_outlined,
        size: ProfileButton.size,
        color: Colors.black,
      ),
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
      child: buildProfileStateDisplay(context, userId),
    );
  }

  Widget buildProfileStateDisplay(BuildContext context, String userId) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch(state) {
          case ProfileLoadingState():
            return buildProfileLoading(context);
          case ProfileErrorState():
            return buildProfileError(context, userId);
          case ProfileLoadedState():
            return buildProfileLoaded(context, state.profile);
        }
      }
    );
  }

  Widget buildProfileLoading(BuildContext context) {
    return const SizedBox(
      width: ProfileButton.size,
      height: ProfileButton.size,
      child: Center(
        child: AppLoadingIndicator(size: ProfileButton.size),
      )
    );
  }

  Widget buildProfileLoaded(BuildContext context, Profile profile) {
    return GestureDetector(
      onTap: () => _signedInTap(context, profile),
      child: Container(
        width: ProfileButton.size,
        height: ProfileButton.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 3.0,
          ),
        ),
        child: ProfileImage.fromProfile(profile),
      )
    );
  }

  Widget buildProfileError(BuildContext context, String userId) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppScreen.profile.name, pathParameters: {
          'profileId': userId
        });
      },
      child: const Icon(
        Icons.warning_amber_rounded,
        size: ProfileButton.size,
        color: Colors.black,
      )
    );
  }

}
