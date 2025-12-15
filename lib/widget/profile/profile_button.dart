import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/app_loading_indicator.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileButton extends StatelessWidget {

  final double size;

  const ProfileButton({
    super.key,
    this.size = 24.0,
  });
  
  void _signedOutTap(BuildContext context) {
    const LoginRoute().go(context);
    context.hapticsTap();
  }

  void _signedInTap(BuildContext context, Profile profile) {
    if (profile.completed) {
      ProfileRoute(profileId: profile.id, $extra: profile).push(context);
    } else {
      ProfileWizardRoute(profileId: profile.id).push(context);
    }
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return SignedIn(
      yes: (context, profileId) {
        return buildSignedIn(context, profileId);
      },
      no: buildSignedOut(context),
    );
  }
  
  Widget buildSignedOut(BuildContext context) {
    return Stack(
      children: <Widget>[
        DecoratedBox(
          position: DecorationPosition.background,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black
          ),
          child: Icon(
            key: const Key('profile_button_signed_out_icon'),
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
              key: const Key('profile_button_signed_out_ink_well'),
              customBorder: const CircleBorder(),
              onTap: () => _signedOutTap(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSignedIn(BuildContext context, String userId) {
    return BlocBuilder<ProfileCubit, ProfileState>(
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
              key: const Key('profile_button_signed_in_ink_well'),
              customBorder: const CircleBorder(),
              onTap: () => _signedInTap(context, profile),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProfileError(BuildContext context, String profileId) {
    return GestureDetector(
      onTap: () {
        ProfileRoute(profileId: profileId).go(context);
        context.hapticsTap();
      },
      child: const Icon(
        key: Key('profile_button_error_icon'),
        Icons.warning_amber_rounded,
        size: 40.0,
        color: Colors.black,
      )
    );
  }

}
