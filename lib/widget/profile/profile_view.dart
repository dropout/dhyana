import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_footer.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/profile_menu.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/timer/completed/milestone_progress.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {

  final Profile profile;

  const ProfileView({
    required this.profile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppThemeData.paddingLg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Profile avatar + name
          Gap.large(),
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
          Gap.large(),
          Text(
            profile.displayName,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap.large(),
          MilestoneProgress(profile: profile),
          Gap.large(),
          Row(
            children: [
              Expanded(
                child: ConsecutiveDaysView(profile: profile,)
              ),
              Gap.medium(),
              Expanded(
                child: MilestonesView(profile: profile)
              ),
            ],
          ),
          Gap.large(),
          SummaryView(profile: profile),
          Gap.large(),
          ProfileMenu(profile: profile),
          Gap.large(),
          const ProfileFooter(),
          Gap.large(),
        ],
      ),
    );
  }

}
