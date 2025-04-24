import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension DurationUtils on Duration {

  String toFormattedString(BuildContext context) {
    int hours = inHours;
    int minutes = inMinutes.remainder(60);

    if (inMinutes < 1) {
      return '0${AppLocalizations.of(context).minutesAbbr.toLowerCase()}';
    }

    String formattedDuration = '';
    if (hours > 0) {
      formattedDuration += '$hours${AppLocalizations.of(context).hoursAbbr} ';
    }
    if (minutes > 0) {
      formattedDuration += '$minutes${AppLocalizations.of(context).minutesAbbr} ';
    }
    return formattedDuration.trim();
  }

}
