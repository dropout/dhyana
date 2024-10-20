import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/bloc_provider/profile_bloc_provider.dart';
import 'package:dhyana/widget/profile/profile_stats_view.dart';
import 'package:dhyana/widget/app_bar/all.dart';
import 'package:flutter/material.dart';

class ProfileStatsScreen extends StatelessWidget {

  final String profileId;

  const ProfileStatsScreen({
    required this.profileId,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        leading: const CustomBackButton(),
        titleText: AppLocalizations.of(context).profileStats,
      ),
      extendBodyBehindAppBar: true,
      body: ProfileBlocProvider(
        initialEvent: ProfileEvent.loadProfile(
          profileId: profileId,
        ),
        child: const SafeArea(
          bottom: false,
          child: ProfileStatsView(),
        ),
      ),
    );
  }

}
