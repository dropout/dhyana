import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/app_loading_indicator.dart';
import 'package:dhyana/widget/util/app_snack_bar.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileButton extends StatelessWidget {

  final double size;

  const ProfileButton({
    super.key,
    this.size = 24.0,
  });
  
  void _signedOutTap(BuildContext context) {
    context.pushNamed(AppScreen.login.name);
    context.hapticsTap();
  }

  void _signedInTap(BuildContext context, Profile profile) {
    String screenName = profile.completed ? AppScreen.profile.name :
      AppScreen.profileWizard.name;
    context.pushNamed(screenName, pathParameters: {
      'profileId': profile.id,
    });
    context.hapticsTap();
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
    return Stack(
      children: <Widget>[
        const DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black
            ),
            child: Icon(
              Icons.account_circle_outlined,
              size: 40.0,
              color: AppColors.backgroundPaper,
            ),
        ),
        Positioned.fill(
          child: Material(
            shape: const CircleBorder(),
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => _signedOutTap(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSignedIn(BuildContext context, String userId) {
    return ProfileBlocProvider(
      initialEvent: ProfileEvent.loadProfile(
        useStream: true,
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
          default:
            return const SizedBox.shrink();
        }
      }
    );
  }

  Widget buildProfileLoading(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: AppLoadingIndicator(size: size),
      )
    );
  }

  Widget buildProfileLoaded(BuildContext context, Profile profile) {
    return Stack(
      children: <Widget>[
        DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 3.0,
            ),
          ),
          child: ProfileImage.fromProfile(profile, size: 40)
        ),
        Positioned.fill(
          child: Material(
            shape: const CircleBorder(),
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => _signedInTap(context, profile),
            ),
          ),
        ),
      ],
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
        size: 40.0,
        color: Colors.black,
      )
    );
  }

}
