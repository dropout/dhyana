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
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: Colors.transparent,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppThemeData.borderRadiusMd),
                  ),
                  color: AppColors.backgroundPaperLight,
                  child: Padding(
                    padding: const EdgeInsets.all(AppThemeData.paddingMd),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          DateFormat.yMMMMEEEEd(Localizations.localeOf(context).toString()).format(day.startDate),
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context).minutesPluralWithNumber(day.minutesCount),
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.black,
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
                                ),
                                Gap.xs(),
                                Text(
                                  day.sessionCount.toString(),
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.black,
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
                                ),
                                Gap.xs(),
                                Text(
                                  day.consecutiveDaysCount.toString(),
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.black,
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
                ),
              )


          ),
        ),
      ),
    );
  }
}
