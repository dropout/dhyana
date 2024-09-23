import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/util/localization.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

class TimerSettingsHistoryListItem extends StatelessWidget {

  final TimerSettings timerSettings;
  final void Function() onTap;

  const TimerSettingsHistoryListItem({
    required this.timerSettings,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundPaperLight,
        borderRadius: BorderRadius.circular(AppThemeData.borderRadiusLg),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(1,2),
            // spreadRadius: .0,
            blurRadius: 1.0,
          )
        ]
      ),
      // surfaceTintColor: Colors.amber,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildDurationColumn(context, timerSettings.duration),
              buildDetailsColumn(context),
              const Spacer(),
              const Icon(
                Icons.chevron_right_rounded,
                size: 48,
              )
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(AppThemeData.borderRadiusLg),
                highlightColor: Colors.white.withOpacity(0.25),
                splashColor: Colors.white.withOpacity(0.25),
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDurationColumn(BuildContext context, Duration duration) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.paddingXl),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.black,
            ),
            child: Center(
              child: Text(duration.inMinutes.toString().toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppThemeData.spacingSm),
          Text(AppLocalizations.of(context).minutesPlural(duration.inMinutes),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget buildDetailsColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppThemeData.paddingXl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetail(
            context,
            'Warmup'.toUpperCase(),
            AppLocalizations.of(context).minutesPluralWithNumber(timerSettings.warmup.inMinutes)
          ),
          const SizedBox(height: AppThemeData.spacingSm),
          buildDetail(
            context,
            'Starting sound'.toUpperCase(),
            getLocalizedSoundName(timerSettings.startingSound, AppLocalizations.of(context)),
          ),
          const SizedBox(height: AppThemeData.spacingSm),
          buildDetail(
            context,
            'Ending sound'.toUpperCase(),
            getLocalizedSoundName(timerSettings.endingSound, AppLocalizations.of(context)),
          )
        ],
      ),
    );
  }

  Widget buildDetail(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(value,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

}
