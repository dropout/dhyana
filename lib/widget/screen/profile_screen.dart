import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/profile/profile_view.dart';
import 'package:dhyana/widget/screen/default_screen_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileScreen extends StatefulWidget {

  final String profileId;

  const ProfileScreen({
    required this.profileId,
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
      ProfileEvent.validateProfileStats(),
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
              enableScrolling: false,
              title: AppLocalizations.of(context).profile,
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
                    child: ProfileView(),
                  ),
                )
              ],
            );
          case ProfileErrorState():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).profile,
              titleColor: Colors.white,
              backgroundColor: Theme.of(context).colorScheme.error,
              appBarBackgroundColor: Theme.of(context).colorScheme.error,
              backButton: CustomBackButton.light(),
              enableScrolling: false,
              slivers: [
                buildErrorSliver(context),
              ],
            );
          default:
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).profile,
              slivers: [],
              enableScrolling: false,
            );
        }
      },
    );
  }
}

