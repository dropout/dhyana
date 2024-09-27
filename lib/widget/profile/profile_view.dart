import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_footer.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/profile_menu.dart';
import 'package:dhyana/widget/profile/stats/consecutive_days.dart';
import 'package:dhyana/widget/timer/completed/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
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

  Widget buildProfileError(BuildContext context) {
    return const AppErrorDisplay();
  }

  Widget buildProfileLoading(BuildContext context) {
    return const AppLoadingDisplay();
  }

  Widget buildProfileLoaded(BuildContext context, Profile profile) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppThemeData.spacingLg),
            Container(
              width: AppThemeData.circleLg,
              height: AppThemeData.circleLg,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 4.0,
                ),
              ),
              child: ProfileImage.fromProfile(profile),
            ),
            const SizedBox(height: AppThemeData.spacingLg),
            Text(
              profile.displayName,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppThemeData.spacingLg),
            WeeklyPerformance(
              profile: profile,
            ),
            const SizedBox(height: AppThemeData.spacingLg),
            ConsecutiveDays(
              profile: profile,
              overrideProfileValue: true,
            ),
            const SizedBox(height: AppThemeData.spacingLg),
            ProfileMenu(profile: profile),
            const SizedBox(height: AppThemeData.spacingLg),
            const ProfileFooter()
          ],
        ),
      )
    );
  }

}
