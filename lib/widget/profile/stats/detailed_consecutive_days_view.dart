import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/consecutive_days.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:flutter/material.dart';

class DetailedConsecutiveDaysView extends StatelessWidget {

  final Profile profile;

  const DetailedConsecutiveDaysView({
    required this.profile,
    super.key
  });

  ConsecutiveDays get consecutiveDays =>
    profile.statsReport.consecutiveDays;

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
              label: context.localizations.statsCurrentStreak,
              value: consecutiveDays.current.toString(),
            ),
            LabelValueDetail(
              label: context.localizations.statsStartedAt,
              value: getStartedAtString(context),
            ),
            LabelValueDetail(
              label: context.localizations.statsLastCheckedAt,
              value: getLastCheckedTimeString(context),
            ),
            LabelValueDetail(
              label: context.localizations.statsLongestStreak,
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
      return context.localizations.notAvailableAbbr;
    }
  }

  String getLastCheckedTimeString(BuildContext context) {
    if (consecutiveDays.lastChecked != null) {
      return consecutiveDays.lastChecked!.toFormattedDateTimeString(context);
    } else {
      return context.localizations.statsNotyetChecked;
    }
  }

}
