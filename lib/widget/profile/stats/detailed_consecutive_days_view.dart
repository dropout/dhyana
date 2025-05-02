import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/consecutive_days.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:flutter/material.dart';

class DetailedConsecutiveDaysView extends StatelessWidget {

  final Profile profile;

  const DetailedConsecutiveDaysView({
    required this.profile,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final ConsecutiveDays consecutiveDays =
      profile.statsReport.consecutiveDays;

    return AppCard(
        title: AppLocalizations.of(context).consecutiveDays,
        padding: EdgeInsets.only(
          bottom: AppThemeData.paddingLg,
          left: AppThemeData.paddingLg,
          right: AppThemeData.paddingLg,
        ),
        child: Column(
          children: [
            LabelValueDetail(
              label: AppLocalizations.of(context).statsCurrentStreak,
              value: consecutiveDays.current.toString(),
            ),
            LabelValueDetail(
              label: AppLocalizations.of(context).statsStartedAt,
              value: getStartedAtString(context),
            ),
            LabelValueDetail(
              label: AppLocalizations.of(context).statsLastCheckedAt,
              value: getLastCheckedTimeString(context),
            ),
            LabelValueDetail(
              label: AppLocalizations.of(context).statsLongestStreak,
              value: consecutiveDays.longest.toString(),
            ),
          ],
        )
    );
  }

  String getStartedAtString(BuildContext context) {
    final ConsecutiveDays consecutiveDays =
        profile.statsReport.consecutiveDays;
    if (consecutiveDays.current > 0 && consecutiveDays.startedAt != null) {
      return consecutiveDays.startedAt!.toFormattedDateTimeString(context);
    } else {
      return AppLocalizations.of(context).notAvailableAbbr;
    }
  }

  String getLastCheckedTimeString(BuildContext context) {
    final ConsecutiveDays consecutiveDays =
        profile.statsReport.consecutiveDays;
    if (consecutiveDays.lastChecked != null) {
      return consecutiveDays.lastChecked!.toFormattedDateTimeString(context);
    } else {
      return AppLocalizations.of(context).statsNotyetChecked;
    }
  }

}
