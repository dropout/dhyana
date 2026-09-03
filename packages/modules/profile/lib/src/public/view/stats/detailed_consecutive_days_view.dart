import 'package:profile/profile.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';


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
        title: ProfileLocalizations.of(context).consecutiveDays,
        padding: const EdgeInsets.only(
          bottom: DesignSpec.paddingLg,
          left: DesignSpec.paddingLg,
          right: DesignSpec.paddingLg,
        ),
        child: Column(
          children: [
            LabelValueDetail(
              label: ProfileLocalizations.of(context).statsCurrentStreak,
              value: consecutiveDays.current.toString(),
            ),
            LabelValueDetail(
              label: ProfileLocalizations.of(context).statsStartedAt,
              value: getStartedAtString(context),
            ),
            LabelValueDetail(
              label: ProfileLocalizations.of(context).statsLastCheckedAt,
              value: getLastCheckedTimeString(context),
            ),
            LabelValueDetail(
              label: ProfileLocalizations.of(context).statsLongestStreak,
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
      return ProfileLocalizations.of(context).notAvailableAbbr;
    }
  }

  String getLastCheckedTimeString(BuildContext context) {
    if (consecutiveDays.lastChecked != null) {
      return consecutiveDays.lastChecked!.toFormattedDateTimeString(context);
    } else {
      return ProfileLocalizations.of(context).statsNotyetChecked;
    }
  }

}
