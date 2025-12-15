import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';


class CalculatedStatsView extends StatefulWidget {

  final CalculatedStats calculatedStats;

  const CalculatedStatsView({
    required this.calculatedStats,
    super.key,
  });

  @override
  State<CalculatedStatsView> createState() => _CalculatedStatsViewState();
}

class _CalculatedStatsViewState extends State<CalculatedStatsView>
  with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CalculatedStats calculatedStats = widget.calculatedStats;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: buildColumnItem(
                context,
                label: AppLocalizations.of(context).statsTotalSessions,
                child: SizedBox(
                  width: double.infinity,
                  key: ValueKey(calculatedStats.totalSessions),
                  child: Text(
                    calculatedStats.totalSessions.toString(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundPaperLight,
                    ),
                  ),
                ),
                order: 0,
              ),
            ),
            Gap.medium(),
            Expanded(
              child: buildColumnItem(
                context,
                label: AppLocalizations.of(context).statsTotalTimeSpent,
                child: SizedBox(
                  width: double.infinity,
                  key: ValueKey(calculatedStats.totalMinutes),
                  child: Text(
                    Duration(minutes: calculatedStats.totalMinutes).toFormattedLocalizedString(context),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundPaperLight,
                    ),
                  ),
                ),
                order: 1,
              ),
            ),
          ],
        ),
      ]
    );
  }

  Widget buildColumnItem(
    BuildContext context, {
    required String label,
    required Widget child,
    int order = 0,
  }) {

    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppThemeData.paddingLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundPaperLight,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
              Gap.small(),
              AnimatedSwitcher(
                duration: Durations.medium4,
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: child,
              ),
            ],
          ),
        ),
      ),
    );

  }

}




