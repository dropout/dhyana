import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class StatsDurationText extends StatelessWidget {

  final Duration duration;

  const StatsDurationText ({
    required this.duration,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);

    if (duration.inMinutes < 1) {
      return RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: '0 ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: AppLocalizations.of(context).minute.toLowerCase(),
              style: Theme.of(context).textTheme.titleMedium
            ),
          ]
        )
      );
    }

    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.black,
        ),
        children: [
          if (hours > 0) TextSpan(
            text: hours.toString(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (hours > 0) TextSpan(
            // Whitespace management ternary operator
            text: (minutes > 0) ? '${AppLocalizations.of(context).hoursAbbr} '
              : AppLocalizations.of(context).hoursAbbr,
            style: Theme.of(context).textTheme.titleMedium
          ),
          if (minutes > 0) TextSpan(
            text: minutes.toString(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (minutes > 0) TextSpan(
              text: AppLocalizations.of(context).minutesAbbr,
              style: Theme.of(context).textTheme.titleMedium
          ),
        ]
      )
    );
  }

}

class StatsNumValueText extends StatelessWidget {

  final num value;
  final String postFix;

  const StatsNumValueText({
    required this.value,
    this.postFix = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: value.toStringAsFixed(0),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (postFix.isNotEmpty) TextSpan(
                text: postFix,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
            ]
        )
    );
  }
}
