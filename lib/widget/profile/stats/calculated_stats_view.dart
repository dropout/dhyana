import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

import 'stats_text.dart';

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
                child: StatsNumValueText(
                  value: calculatedStats.totalSessions,
                  color: AppColors.backgroundPaperLight,
                ),
                order: 0,
              ),
            ),
            Gap.medium(),
            Expanded(
              child: buildColumnItem(
                context,
                label: AppLocalizations.of(context).statsTotalTimeSpent,
                child: StatsDurationText(
                  duration: Duration(minutes: calculatedStats.totalMinutes),
                  color: AppColors.backgroundPaperLight,
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
            key: ValueKey(widget.calculatedStats),
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
              child,
            ],
          ),
        ),
      ),
    );

  }

}




