import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import 'package:core/core.dart';
import 'package:timer/l10n/timer_localizations.dart';
import 'package:timer/src/public/model/timer_settings_history_record.dart';


class TimerSettingsHistoryGridItem extends StatelessWidget {
  final TimerSettingsHistoryRecord timerSettingsHistoryRecord;
  final void Function() onTap;

  const TimerSettingsHistoryGridItem({
    required this.timerSettingsHistoryRecord,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundPaperLight,
        borderRadius: BorderRadius.circular(DesignSpec.borderRadiusLg),
        boxShadow: DesignSpec.defaultBoxShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignSpec.paddingMd),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,        
          children: [
            buildDurationColumn(
              context,
              timerSettingsHistoryRecord.timerSettings.duration,
            ),
            buildDetailsColumn(context),
            Padding(
              padding: const EdgeInsets.only(
                bottom: DesignSpec.paddingLg,
              ),
              child: buildLastUsedTimeText(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDurationColumn(BuildContext context, Duration duration) {
    return Padding(
      padding: const EdgeInsets.only(
        // top: DesignSpec.paddingMd,
        // left: DesignSpec.paddingMd,
        // right: DesignSpec.paddingMd,
      ),
      child: Text.rich(        
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          
        ),
        TextSpan(
          text: duration.inMinutes.toString().toUpperCase(),
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: ' ${TimerLocalizations.of(context).minutesPlural(duration.inMinutes)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),

      // child: Column(
      //   mainAxisSize: .min,
      //   crossAxisAlignment: .center,
      //   children: [
      //     DecoratedBox(
      //       decoration: const BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: Colors.black,
      //       ),
      //       child: SizedBox(
      //         width: 64,
      //         height: 64,
      //         child: Center(
      //           child: Text(
      //             duration.inMinutes.toString().toUpperCase(),
      //             style: Theme.of(context).textTheme.headlineMedium!.copyWith(
      //               fontWeight: FontWeight.bold,
      //               color: AppColors.backgroundPaperLight,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Gap.small(),
      //     Text(
      //       TimerLocalizations.of(context).minutesPlural(duration.inMinutes),
      //       style: Theme.of(context).textTheme.titleLarge,
      //     ),
    
          
    
      //     // Text(
      //     //   buildLastUsedTimeText(context),
      //     // ),
      //   ],
      // ),
    );
  }

  Widget buildDetailsColumn(BuildContext context) {
    final timerSettings = timerSettingsHistoryRecord.timerSettings;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DesignSpec.paddingMd),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetail(
            context,
            TimerLocalizations.of(context).inputWarmupLabel.toUpperCase(),
            TimerLocalizations.of(context)
                .minutesPluralWithNumber(timerSettings.warmup.inMinutes),
          ),
          const SizedBox(height: DesignSpec.spacingSm),
          buildDetail(
            context,
            TimerLocalizations.of(context).inputStartingSoundLabel
                .toUpperCase(),
            getLocalizedSoundName(
              timerSettings.startingSound,
              TimerLocalizations.of(context),
            ),
          ),
          const SizedBox(height: DesignSpec.spacingSm),
          buildDetail(
            context,
            TimerLocalizations.of(context).inputIntervalCountLabel
                .toUpperCase(),
            timerSettings.intervalCount.toString(),
          ),
          const SizedBox(height: DesignSpec.spacingSm),
          buildDetail(
            context,
            TimerLocalizations.of(context).inputEndingSoundLabel.toUpperCase(),
            getLocalizedSoundName(
              timerSettings.endingSound,
              TimerLocalizations.of(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetail(BuildContext context, String label, String value) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        Text(
          value,
          style: Theme.of(context).textTheme.labelLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// Builds a text field for displaying last used time.
  /// If the last used time was today: displays "Today" followed by the time.
  /// If the session was yesterday: displays "Yesterday" followed by the time.
  /// If the session was earlier than yesterday: displays the full date and time.
  Widget buildLastUsedTimeText(BuildContext context) {
    final lastUsedTime = timerSettingsHistoryRecord.lastUsed;
    final now = DateTime.now();
    String displayText;

    if (lastUsedTime.year == now.year &&
        lastUsedTime.month == now.month &&
        lastUsedTime.day == now.day) {
      // displayText = '${TimerLocalizations.of(context).today} ${TimeOfDay.fromDateTime(lastUsedTime).format(context)}';
      displayText =
          '${'today'} ${DateFormat.Hm(Localizations.localeOf(context).toString()).format(lastUsedTime)}';
    } else if (lastUsedTime.year == now.year &&
        lastUsedTime.month == now.month &&
        lastUsedTime.day == now.day - 1) {
      // displayText = '${TimerLocalizations.of(context).yesterday} ${TimeOfDay.fromDateTime(lastUsedTime).format(context)}';
      displayText =
          '${'yesterday'} ${DateFormat.Hm(Localizations.localeOf(context).toString()).format(lastUsedTime)}';
    } else {
      displayText = DateFormat.yMd().add_jm().format(lastUsedTime);
    }

    displayText = DateFormat.yMd().add_Hm().format(lastUsedTime);

    return Text(
      displayText, 
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontFamily: DesignSpec.condensedFontFamilyName,
        color: AppColors.charcoal.withValues(alpha: 0.66),
        fontWeight: FontWeight.bold,        
      ),
    );
  }
  
}
