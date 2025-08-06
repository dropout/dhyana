import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: AppThemeData.spacingLg),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ProgressSummaryItem(
              oldValue: widget.oldProfile.statsReport.completedSessionsCount,
              newValue: widget.updatedProfile.statsReport.completedSessionsCount,
              label: AppLocalizations.of(context).sessionsPlural(
                widget.updatedProfile.statsReport.completedSessionsCount
              ),
              animationDelay: Durations.short1,
            )
          ),
          const SizedBox(width: AppThemeData.spacingMd),
          Expanded(
            child: ProgressSummaryItem(
              oldValue: widget.oldProfile.statsReport.completedMinutesCount,
              newValue: widget.updatedProfile.statsReport.completedMinutesCount,
              label: AppLocalizations.of(context).minutesPlural(
                widget.updatedProfile.statsReport.completedMinutesCount
              ),
              animationDelay: Durations.medium1,
            )
          ),
          const SizedBox(width: AppThemeData.spacingMd),
          Expanded(
            child: ProgressSummaryItem(
              oldValue: widget.oldProfile.statsReport.completedDaysCount,
              newValue: widget.updatedProfile.statsReport.completedDaysCount,
              label: AppLocalizations.of(context).daysPlural(
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
