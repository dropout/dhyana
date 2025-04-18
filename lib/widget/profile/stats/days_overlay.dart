import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaysOverlay extends StatelessWidget {

  final Day day;

  const DaysOverlay({
    required this.day,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = AppColors.backgroundPaperLight;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade500,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(AppThemeData.borderRadiusSm),
        color: Colors.grey.shade900,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppThemeData.paddingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat.yMMMMEEEEd(Localizations.localeOf(context).toString()).format(day.startDate),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              AppLocalizations.of(context).minutesPluralWithNumber(day.minutesCount),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.self_improvement_rounded,
                      size: 21,
                      color: textColor,
                    ),
                    Gap.xs(),
                    Text(
                      day.sessionCount.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gap.medium(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.link_rounded,
                      size: 21,
                      color: textColor,
                    ),
                    Gap.xs(),
                    Text(
                      day.consecutiveDaysCount.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )


              ],
            ),

          ],
        ),
      ),
    );
  }
}

class DaysOverlayIdle extends StatelessWidget {

  final String dateRangeText;
  final int averageMinutes;
  final int averageSessionCount;

  const DaysOverlayIdle({
    required this.dateRangeText,
    required this.averageMinutes,
    required this.averageSessionCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = AppColors.backgroundPaperLight;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade500,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(AppThemeData.borderRadiusSm),
        color: Colors.grey.shade900,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppThemeData.paddingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dateRangeText,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              AppLocalizations.of(context).minutesPluralWithNumber(averageMinutes),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              AppLocalizations.of(context).average.toLowerCase(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
