import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension DurationUtils on Duration {

  String toFormattedLocalizedString(BuildContext context) {
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

  String formatHHmmss() {
    String twoDigitMinutes = _twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _twoDigits(inSeconds.remainder(60));
    return "${_twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String formatHHmm() {
    String twoDigitMinutes = _twoDigits(inMinutes.remainder(60));
    return "${_twoDigits(inHours)}:$twoDigitMinutes";
  }

  String formatMMss() {
    String twoDigitMinutes = _twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _twoDigits(inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

}

String _twoDigits(int n) {
  return n.toString().padLeft(2, "0");
}
