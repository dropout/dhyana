import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileStatsView extends StatefulWidget {
  const ProfileStatsView({super.key});

  @override
  State<ProfileStatsView> createState() => _ProfileStatsViewState();
}

class _ProfileStatsViewState extends State<ProfileStatsView> {

  Widget buildProfileArea(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState state) {
          switch (state) {
            case ProfileLoadingState():
              return buildProfileLoading(context);
            case ProfileErrorState():
              return buildProfileError(context);
            case ProfileLoadedState():
              return buildProfileLoaded(context, state.profile);
            default:
              return const SizedBox.shrink();
          }
        }
    );
  }

  Widget buildProfileLoading(BuildContext context) {
    return const Text('its loading');
  }

  Widget buildProfileLoaded(BuildContext context, Profile profile) {
    return Column(
      children: [
        const SizedBox(height: AppThemeData.spacingLg),
        ConsecutiveDays(
          profile: profile,
        ),
        const SizedBox(height: AppThemeData.spacingLg),
        Padding(
          padding: const EdgeInsets.all(AppThemeData.spacingMd),
          child: ProfileMetricsView(profile: profile),
        ),
        const SizedBox(height: AppThemeData.spacingLg),
        Padding(
          padding: const EdgeInsets.all(AppThemeData.spacingMd),
          child: DailyChart(
            profile: profile,
          ),
        ),
        const SizedBox(height: AppThemeData.spacingLg),
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
            borderRadius: BorderRadius.all(
              Radius.circular(AppThemeData.borderRadiusMd)
            ),
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
                          'An unexpected error occured '
                          'while trying to load your profile.',
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
        ],
      ),
    );
  }

}
