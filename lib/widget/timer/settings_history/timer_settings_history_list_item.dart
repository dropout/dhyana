import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/util/localization.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class TimerSettingsHistoryListItem extends StatelessWidget {

  final TimerSettingsHistoryRecord timerSettingsHistoryRecord;
  final void Function() onTap;

  const TimerSettingsHistoryListItem({
    required this.timerSettingsHistoryRecord,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundPaperLight,
        borderRadius: BorderRadius.circular(DesignSpec.borderRadiusLg),
        boxShadow: DesignSpec.defaultBoxShadow,
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildDurationColumn(
                context,
                timerSettingsHistoryRecord.timerSettings.duration
              ),
              Gap.small(),
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
                borderRadius: BorderRadius.circular(DesignSpec.borderRadiusLg),
                highlightColor: Colors.white.withValues(alpha: 0.25),
                splashColor: Colors.white.withValues(alpha: 0.25),
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
      padding: const EdgeInsets.all(
        DesignSpec.paddingXl
      ),
      child: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: SizedBox(
              width: 64,
              height: 64,
              child: Center(
                child: Text(duration.inMinutes.toString().toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundPaperLight,
                  ),
                ),
              ),
            ),
          ),
          Gap.small(),
          Text(AppLocalizations.of(context).minutesPlural(duration.inMinutes),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget buildDetailsColumn(BuildContext context) {
    final timerSettings = timerSettingsHistoryRecord.timerSettings;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: DesignSpec.paddingMd
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetail(
            context,
            AppLocalizations.of(context).inputWarmupLabel.toUpperCase(),
            AppLocalizations.of(context).minutesPluralWithNumber(
              timerSettings.warmup.inMinutes
            )
          ),
          const SizedBox(height: DesignSpec.spacingSm),
          buildDetail(
            context,
            AppLocalizations.of(context).inputStartingSoundLabel.toUpperCase(),
            getLocalizedSoundName(
              timerSettings.startingSound,
              AppLocalizations.of(context)
            ),
          ),
          const SizedBox(height: DesignSpec.spacingSm),
          buildDetail(
            context,
            AppLocalizations.of(context).inputEndingSoundLabel.toUpperCase(),
            getLocalizedSoundName(
              timerSettings.endingSound,
              AppLocalizations.of(context)
            ),
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
