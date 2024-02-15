import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/profile_menu.dart';
import 'package:dhyana/widget/profile/stats/daily_chart.dart';
import 'package:dhyana/widget/profile/stats/metrics.dart';
import 'package:dhyana/widget/timer/completed/all.dart';
import 'package:dhyana/widget/util/separator_gem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  Widget buildProfileArea(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch (state) {
          case ProfileLoadingState():
            return buildProfileLoading(context);
          case ProfileErrorState():
            return buildProfileError(context);
          case ProfileLoadedState():
            // return buildProfileLoading(context);
            return buildProfileLoaded(context, state.profile);
        }
      }
    );
  }

  Widget buildProfileLoading(BuildContext context) {
    return const Text('its loading');
  }

  Widget buildProfileLoaded(BuildContext context, Profile profile) {
    ProfileBloc profileBloc = BlocProvider.of<ProfileBloc>(context);
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 3.0,
            ),
          ),
          child: ProfileImage.fromProfile(profile),
        ),
        const SizedBox(height: AppThemeData.spacingLg),
        Text(
          profile.displayName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppThemeData.spacingLg),
        ConsecutiveDays(
          profile: profile,
          profileBloc: profileBloc,
        ),
        const SeparatorGem(count: 1),
        Padding(
          padding: const EdgeInsets.all(AppThemeData.spacingMd),
          child: DailyChart(
            profile: profile,
          ),
        ),
        const SeparatorGem(count: 1),
        Padding(
          padding: const EdgeInsets.all(AppThemeData.spacingMd),
          child: ProfileMetricsView(profile: profile),
        ),
      ],
    );
  }

  Widget buildProfileError(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.spacingMd),
      child: Container(
        padding: const EdgeInsets.all(AppThemeData.spacingSm),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(AppThemeData.borderRadiusMd)),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.warning_amber_rounded,
                size: 64,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unable to load profile',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      )
                    ),
                    Text(
                      'An unexpected error occured while trying to load your profile.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      )
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProfileArea(context),
          const ProfileMenu(),
        ],
      ),
    );
  }


}
