import 'package:material_ui/material_ui.dart';
import 'package:profile/l10n/profile_localizations.dart';

import 'package:core/core.dart';
import 'package:profile/src/public/model/profile.dart';

import 'progress_summary_item.dart';


class ProgressSummary extends StatefulWidget {

  final Profile oldProfile;
  final Profile updatedProfile;

  const ProgressSummary({
    required this.oldProfile,
    required this.updatedProfile,
    super.key,
  });

  @override
  State<ProgressSummary> createState() => _ProgressSummaryState();

}

class _ProgressSummaryState extends State<ProgressSummary> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSpec.spacingLg),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ProgressSummaryItem(
              key: const Key('progress_summary_sessions'),
              oldValue: widget.oldProfile.statsReport.completedSessionsCount,
              newValue: widget.updatedProfile.statsReport.completedSessionsCount,
              label: ProfileLocalizations.of(context).sessionsPlural(
                widget.updatedProfile.statsReport.completedSessionsCount
              ),
              animationDelay: Durations.short1,
            )
          ),
          const SizedBox(width: DesignSpec.spacingMd),
          Expanded(
            child: ProgressSummaryItem(
              key: const Key('progress_summary_minutes'),
              oldValue: widget.oldProfile.statsReport.completedMinutesCount,
              newValue: widget.updatedProfile.statsReport.completedMinutesCount,
              label: ProfileLocalizations.of(context).minutesPlural(
                widget.updatedProfile.statsReport.completedMinutesCount
              ),
              animationDelay: Durations.medium1,
            )
          ),
          const SizedBox(width: DesignSpec.spacingMd),
          Expanded(
            child: ProgressSummaryItem(
              key: const Key('progress_summary_days'),
              oldValue: widget.oldProfile.statsReport.completedDaysCount,
              newValue: widget.updatedProfile.statsReport.completedDaysCount,
              label: ProfileLocalizations.of(context).daysPlural(
                widget.updatedProfile.statsReport.completedDaysCount
              ),
              animationDelay: Durations.long1,
            )
          )
        ],
      ),
    );
  }

}
