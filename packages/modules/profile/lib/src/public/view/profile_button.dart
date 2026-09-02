import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/view/profile_image.dart';

class ProfileButton extends StatelessWidget {

  final double size;

  const ProfileButton({
    super.key,
    this.size = 96.0,
  });
  
  void _signedOutTap(BuildContext context) {
    context.services.authNavigator.navigateToLogin(type: .go);
    context.hapticsTap();
  }

  void _signedInTap(BuildContext context, Profile profile) {
    if (profile.completed) {
      context.services.profileNavigator.navigateToProfile(profile.id);
    } else {
      context.services.profileNavigator.navigateToProfileWizard(profile.id);
    }
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return SignedIn(
      yes: (context, profileId) =>
        buildSignedIn(context, profileId),      
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
    return BlocBuilder<ProfileStateCubit, ProfileState>(
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
          position: .foreground,
          decoration: BoxDecoration(
            shape: .circle,
            border: Border.all(
              color: Colors.black,
              width: 3.0,
            ),
          ),
          child: ProfileImage(
            profileId: profile.id,
            profileName: profile.displayName,          
            profilePhotoBlurhash: profile.photoBlurhash,
            size: size,
          ),
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
        context.services.profileNavigator.navigateToProfile(profileId, type: .go);
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
