import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/consecutive_days.dart';
import 'package:dhyana/model/milestone_progress.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailedMilestonesView extends StatelessWidget {

  final Profile profile;

  const DetailedMilestonesView({
    required this.profile,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final MilestoneProgress milestoneProgress =
      profile.statsReport.milestoneProgress;
    final int milestoneCount = profile.statsReport.milestoneCount;

    return AppCard(
        title: AppLocalizations.of(context).milestones,
        padding: EdgeInsets.only(
          bottom: AppThemeData.paddingLg,
          left: AppThemeData.paddingLg,
          right: AppThemeData.paddingLg,
        ),
        child: Column(
          children: [
            LabelValueDetail(
              label: AppLocalizations.of(context).statsCount,
              value: milestoneCount.toString(),
            ),
            LabelValueDetail(
              label: AppLocalizations.of(context).statsNextMilestone,
              value: getNextMilestoneText(context, profile.statsReport.milestoneProgress),
            ),
          ],
        )
    );
  }

  String getNextMilestoneText(BuildContext context, MilestoneProgress milestoneProgress) {
    return AppLocalizations.of(context).statsNextMilestoneIn(
      milestoneProgress.targetDaysCount - milestoneProgress.completedDaysCount,
    );
    // final MilestoneProgress milestoneProgress =
    //     profile.statsReport.milestoneProgress;
    // if (milestoneProgress.completedDaysCount > 0) {
    //   return '${milestoneProgress.completedDaysCount} / ${milestoneProgress.targetDaysCount}';
    // } else {
    //   return 'Not yet started';
    // }
  }

  String getTimeString(BuildContext context, DateTime dateTime) {
    Locale locale = Localizations.localeOf(context);
    String date = DateFormat.yMMMMd(locale.toString()).format(dateTime);
    String time = DateFormat.Hm(locale.toString()).format(dateTime);

    return '$date $time';
  }

  Widget buildTimeText(BuildContext context, DateTime dateTime) {
    return Text(getTimeString(context, dateTime),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildConsecutiveDaysStartTime(BuildContext context) {
    final ConsecutiveDays consecutiveDays =
        profile.statsReport.consecutiveDays;
    if (consecutiveDays.current > 0 && consecutiveDays.startedAt != null) {
      return buildTimeText(context, consecutiveDays.startedAt!);
    } else {
      return Text('Not yet started',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          )
      );
    }
  }

  Widget buildLastCheckedTime(BuildContext context) {
    final ConsecutiveDays consecutiveDays =
        profile.statsReport.consecutiveDays;
    if (consecutiveDays.lastChecked != null) {
      return buildTimeText(context, consecutiveDays.lastChecked!);
    } else {
      return Text('Not yet checked',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          )
      );
    }
  }

}
