import 'package:profile/l10n/profile_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:core/core.dart';
import 'package:profile/profile.dart';

import 'label_value_detail.dart';


class DetailedSummaryView extends StatelessWidget {

  final ProfileStatsReport profileStatsReport;

  const DetailedSummaryView({
    required this.profileStatsReport,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: ProfileLocalizations.of(context).statsSummary,
      padding: const EdgeInsets.only(
        bottom: DesignSpec.paddingLg,
        left: DesignSpec.paddingLg,
        right: DesignSpec.paddingLg,
      ),
      child: Column(
        children: [
          LabelValueDetail(
            label: ProfileLocalizations.of(context).statsTotalTimeSpent,
            value: profileStatsReport.completedMinutesCount.toString(),
          ),
          LabelValueDetail(
            label: ProfileLocalizations.of(context).statsTotalSessions,
            value: profileStatsReport.completedSessionsCount.toString(),
          ),
          LabelValueDetail(
            label: ProfileLocalizations.of(context).statsTotalDays,
            value: profileStatsReport.completedDaysCount.toString(),
          )
        ],
      )
    );
  }
}
