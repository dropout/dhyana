import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/util/all.dart';
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

  static const double size = 40.0;

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
    return GestureDetector(
      onTap: () => _signedOutTap(context),
      child: const ProfileButtonSignedOut(),
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
            // return buildProfileError(context);
        }
      }
    );
  }

  Widget buildProfileLoading(BuildContext context) {
    return const SizedBox(
      width: ProfileButton.size,
      height: ProfileButton.size,
      child: ProfileButtonLoading(),
    );
  }

  Widget buildProfileLoaded(BuildContext context, Profile profile) {
    return GestureDetector(
      onTap: () => _signedInTap(context, profile),
      child: ProfileButtonSignedIn(
        profile: profile
      )
    );
  }

  Widget buildProfileError(BuildContext context) {
    return const SizedBox(
      width: ProfileButton.size,
      height: ProfileButton.size,
      child: Center(child: ProfileButtonError()),
    );
  }

}

class ProfileButtonLoading extends StatefulWidget {

  final Duration duration;
  final Curve curve;

  const ProfileButtonLoading({
    this.duration = const Duration(milliseconds: 1024),
    this.curve = Curves.easeInOutCirc,
    super.key
  });

  @override
  State<ProfileButtonLoading> createState() => _ProfileButtonLoadingState();
}

class _ProfileButtonLoadingState extends State<ProfileButtonLoading>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat(reverse: true);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.scale(
        scale: widget.curve.transform(controller.value).remapAndClamp(0.0, 1.0, 0.25, 0.55).toDouble(),
        child: child,
      ),
      child: Container(
        width: ProfileButton.size,
        height: ProfileButton.size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


class ProfileButtonSignedOut extends StatelessWidget {
  const ProfileButtonSignedOut({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.account_circle_outlined,
      size: ProfileButton.size,
      color: Colors.black,
    );
  }
}

class ProfileButtonSignedIn extends StatelessWidget {

  final Profile profile;

  const ProfileButtonSignedIn({
    required this.profile,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class ProfileButtonError extends StatefulWidget {
  const ProfileButtonError({super.key});

  @override
  State<ProfileButtonError> createState() => _ProfileButtonErrorState();
}

class _ProfileButtonErrorState extends State<ProfileButtonError> {

  late bool isPopupVisible;

  @override
  void initState() {
    isPopupVisible = false;
    super.initState();
  }

  void _onSignOutPressed(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const SignOut());
    context.goNamed(AppScreen.home.name);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.warning_amber_rounded,
        size: ProfileButton.size,
        color: Colors.black,
      ),
      elevation: 1,
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<int>>[
          PopupMenuItem<int>(
            value: 0,
            child: Text(AppLocalizations.of(context).signOut),
            onTap: () => { _onSignOutPressed(context) },
          ),
        ];
      }
    );
  }
}

