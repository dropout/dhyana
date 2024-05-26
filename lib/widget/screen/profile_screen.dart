import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/bloc_provider/profile_bloc_provider.dart';
import 'package:dhyana/widget/profile/profile_view.dart';
import 'package:dhyana/widget/util/custom_app_bar.dart';
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
      appBar: CustomAppBar(titleText: AppLocalizations.of(context).profile),
      extendBodyBehindAppBar: true,
      body: ProfileBlocProvider(
        initialEvent: ProfileEvent.loadProfile(
          profileId: profileId,
          useStream: true,
        ),
        child: const SafeArea(
          bottom: false,
          child: ProfileView(),
        ),
      ),
    );
  }

}
