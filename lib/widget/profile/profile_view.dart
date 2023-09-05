import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/profile_menu.dart';
import 'package:dhyana/widget/profile/stats/daily_chart.dart';
import 'package:dhyana/widget/profile/stats/metrics.dart';
import 'package:dhyana/widget/timer/completed/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/separator_gem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch (state) {
          case ProfileLoadingState():
            return const AppLoadingDisplay();
          case ProfileErrorState():
            return const AppErrorDisplay();
          case ProfileLoadedState():
            return buildLoaded(context, state.profile);
        }
      }
    );
  }

  Widget buildLoaded(BuildContext context, Profile profile) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 96,
            height: 96,
            child: ProfileImage.fromProfile(profile),
          ),
          const SizedBox(height: AppThemeData.spacingLg),
          Text(
            profile.displayName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ConsecutiveDays(profile: profile),
          const SeparatorGem(count: 1),
          Padding(
            padding: const EdgeInsets.all(AppThemeData.spacingMd),
            child: DailyChart(
              profile: profile,
            ),
          ),
          const SeparatorGem(count: 1),
          ProfileMetricsView(profile: profile),
          ProfileMenu(),
          // const Expanded(
          //   child: ProfileMenu(),
          // )
        ],
      ),
    );
  }
}
