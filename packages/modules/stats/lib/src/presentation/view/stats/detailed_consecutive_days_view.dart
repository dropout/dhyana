import 'package:dhyana/l10n/app_localizations.dart';
import 'package:profile/profile.dart';
import 'package:core/core.dart';
import 'package:stats/src/presentation/view/stats/label_value_detail.dart';
import 'package:flutter/material.dart';


class DetailedConsecutiveDaysView extends StatelessWidget {

  final ProfileStatsReport profileStatsReport;

  const DetailedConsecutiveDaysView({
    required this.profileStatsReport,
    super.key
  });

  ConsecutiveDays get consecutiveDays =>
    profileStatsReport.consecutiveDays;

  @override
  Widget build(BuildContext context) {

    return AppCard(
        title: AppLocalizations.of(context).consecutiveDays,
        padding: const EdgeInsets.only(
          bottom: DesignSpec.paddingLg,
          left: DesignSpec.paddingLg,
          right: DesignSpec.paddingLg,
        ),
        child: Column(
          children: [
            LabelValueDetail(
              label: context.l10n.statsCurrentStreak,
              value: consecutiveDays.current.toString(),
            ),
            LabelValueDetail(
              label: context.l10n.statsStartedAt,
              value: getStartedAtString(context),
            ),
            LabelValueDetail(
              label: context.l10n.statsLastCheckedAt,
              value: getLastCheckedTimeString(context),
            ),
            LabelValueDetail(
              label: context.l10n.statsLongestStreak,
              value: consecutiveDays.longest.toString(),
            ),
          ],
        )
    );
  }

  String getStartedAtString(BuildContext context) {
    if (consecutiveDays.current > 0 && consecutiveDays.startedAt != null) {
      return consecutiveDays.startedAt!.toFormattedDateTimeString(context);
    } else {
      return context.l10n.notAvailableAbbr;
    }
  }

  String getLastCheckedTimeString(BuildContext context) {
    if (consecutiveDays.lastChecked != null) {
      return consecutiveDays.lastChecked!.toFormattedDateTimeString(context);
    } else {
      return context.l10n.statsNotyetChecked;
    }
  }

}
