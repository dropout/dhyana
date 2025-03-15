import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/consecutive_days.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MilestonesDisplay extends StatefulWidget {

  final Profile profile;

  const MilestonesDisplay({
    required this.profile,
    super.key
  });

  @override
  State<MilestonesDisplay> createState() => _MilestonesDisplayState();
}

class _MilestonesDisplayState extends State<MilestonesDisplay> {

  @override
  Widget build(BuildContext context) {
    final int milestoneCount = widget.profile.statsReport.milestoneCount;

    return AppCard(
      title: AppLocalizations.of(context).milestones,
      child: Column(
        children: [
          StatsNumValueText(
            value: milestoneCount,
          ),
          buildConsecutiveDaysStartTime(context),
        ],
      ),
    );
  }

  Widget buildConsecutiveDaysCount(BuildContext context, String value) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppThemeData.paddingXl),
          child: Text(value.toString(),
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: AppColors.backgroundPaperLight,
            ),
          ),
        )
    );
  }

  Widget buildConsecutiveDaysStartTime(BuildContext context) {
    final ConsecutiveDays consecutiveDays =
        widget.profile.statsReport.consecutiveDays;
    if (consecutiveDays.current > 0 && consecutiveDays.startedAt != null) {
      Locale locale = Localizations.localeOf(context);
      String formattedDate = DateFormat.yMMMMd(locale.toString()).format(consecutiveDays.startedAt!);
      return Text('Since $formattedDate',
          style: Theme.of(context).textTheme.bodySmall
      );
    } else {
      return const SizedBox.shrink();
    }
  }

}
