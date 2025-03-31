import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/localization.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flip_board/flip_widget.dart';
import 'package:flutter/material.dart';

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
            child: ProgressItem(
              oldValue: widget.oldProfile.statsReport.completedSessionsCount,
              newValue: widget.updatedProfile.statsReport.completedSessionsCount,
              label: AppLocalizations.of(context).sessionsPlural(
                widget.updatedProfile.statsReport.completedSessionsCount
              ),
            )
          ),
          const SizedBox(width: AppThemeData.spacingMd),
          Expanded(
            child: ProgressItem(
              oldValue: widget.oldProfile.statsReport.completedMinutesCount,
              newValue: widget.updatedProfile.statsReport.completedMinutesCount,
              label: AppLocalizations.of(context).minutesPlural(
                widget.updatedProfile.statsReport.completedMinutesCount
              ),
            )
          ),
          const SizedBox(width: AppThemeData.spacingMd),
          Expanded(
            child: ProgressItem(
              oldValue: widget.oldProfile.statsReport.completedDaysCount,
              newValue: widget.updatedProfile.statsReport.completedDaysCount,
              label: AppLocalizations.of(context).daysPlural(
                widget.updatedProfile.statsReport.completedDaysCount
              ),
            )
          )
        ],
      ),
    );
  }

}

class ProgressItem extends StatelessWidget {

  final String label;
  final int oldValue;
  final int newValue;

  const ProgressItem({
    required this.oldValue,
    required this.newValue,
    required this.label,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    String old = getLocalizedRoundedNumber(context, oldValue, shorten: true);
    String newVal = getLocalizedRoundedNumber(context, newValue, shorten: true);

    return Padding(
      padding: const EdgeInsets.all(AppThemeData.paddingMd),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          FlipWidget(
            flipType: FlipType.spinFlip,

            itemStream: Stream.fromIterable([newVal]),
            itemBuilder: buildItem,
            initialValue: old,
            flipDirection: AxisDirection.up,
          ),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            )
          )
        ],),
    );
  }

  Widget buildItem(BuildContext context, String? value) {
    return Center(
      child: Text(
        value ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}
