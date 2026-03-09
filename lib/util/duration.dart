import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// Extension methods on [Duration] for formatting durations in various ways.
extension DurationUtils on Duration {

  /// Formats a duration as a localized string, e.g. "1h 5m" or "45m".
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

  /// Formats a duration as "HH:MM:SS".
  String formatHHmmss() {
    String twoDigitMinutes = _twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _twoDigits(inSeconds.remainder(60));
    return "${_twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  /// Formats a duration as "HH:MM".
  String formatHHmm() {
    String twoDigitMinutes = _twoDigits(inMinutes.remainder(60));
    return "${_twoDigits(inHours)}:$twoDigitMinutes";
  }

  /// Formats a duration as "MM:SS".
  String formatMMss() {
    String twoDigitMinutes = _twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _twoDigits(inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  /// Formats a duration as "HH:MM:SS.mm", where "mm" is hundredths of a second.
  String formatHHMMSSmm() {
    String twoDigitMinutes = _twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _twoDigits(inSeconds.remainder(60));
    String twoDigitMilliseconds = _twoDigits(inMilliseconds.remainder(1000) ~/ 10);
    return "${_twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds.$twoDigitMilliseconds";
  }

  /// Formats a duration as "M:SS".
  String formatMss() {
    final int totalSeconds = inSeconds;
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    final String paddedSeconds = seconds.toString().padLeft(2, '0');
    return '$minutes:$paddedSeconds';
  }

}

String _twoDigits(int n) {
  return n.toString().padLeft(2, "0");
}
