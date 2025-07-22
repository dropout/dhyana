import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/profile/profile_view.dart';
import 'package:dhyana/widget/screen/default_screen_setup.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {

  final String profileId;
  final Profile? profile;

  const ProfileScreen({
    required this.profileId,
    this.profile,
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
  with DefaultScreenSetupHelpersMixin {

  @override
  initState() {
    BlocProvider.of<ProfileBloc>(context).add(
      ProfileEvent.loadProfile(
        profileId: widget.profileId,
        profile: widget.profile,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch (state) {
          case ProfileLoadingState():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).profile,
              enableScrolling: false,
              enableTitleSliver: false,
              slivers: [
                buildLoadingSliver(context)
              ],
            );
          case ProfileLoadedState():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).profile,
              enableTitleSliver: false,
              slivers: [
                SliverSafeArea(
                  top: false,
                  sliver: SliverToBoxAdapter(
                    child: ProfileView(
                      profile: state.profile,
                    ),
                  ),
                )
              ],
            );
          case ProfileErrorState():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).profile,
              titleColor: Colors.white,
              enableTitleSliver: false,
              backgroundColor: Theme.of(context).colorScheme.error,
              appBarBackgroundColor: Theme.of(context).colorScheme.error,
              backButton: CustomBackButton.light(),
              enableScrolling: false,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: AppErrorDisplay(
                    onButtonTap: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        AuthEvent.signOut(),
                      );
                      const HomeRoute().go(context);
                      BlocProvider.of<ProfileBloc>(context).add(
                        const ProfileEvent.clearData(),
                      );
                    },
                    buttonText: AppLocalizations.of(context).signOut,
                  ),
                )
                // buildErrorSliver(context),
              ],
            );
          case ProfileStateInitial():
            return DefaultScreenSetup(
              enableScrolling: false,
              title: '',
            );
        }
      },
    );
  }
}

