import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/profile/profile_view.dart';
import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  final String profileId;

  const ProfileScreen({
    required this.profileId,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        leading: const CustomBackButton(),
        titleText: AppLocalizations.of(context).profile
      ),
      extendBodyBehindAppBar: true,
      body: const ProfileView(),
      // body: ProfileBlocProvider(
      //   initialEvent: ProfileEvent.loadProfile(
      //     profileId: profileId,
      //   ),
      //   child: const ProfileView(),
      // ),
    );
  }

}
