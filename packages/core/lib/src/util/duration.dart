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

const List<Duration> defaultMinutesSelectorValues = [
  Duration(minutes: 1), Duration(minutes: 2), Duration(minutes: 3), Duration(minutes: 4), Duration(minutes: 5),     
  Duration(minutes: 6), Duration(minutes: 7), Duration(minutes: 8), Duration(minutes: 9), Duration(minutes: 10),
  Duration(minutes: 11), Duration(minutes: 12), Duration(minutes: 13), Duration(minutes: 14), Duration(minutes: 15),
  Duration(minutes: 16), Duration(minutes: 17), Duration(minutes: 18), Duration(minutes: 19), Duration(minutes: 20),
  Duration(minutes: 21), Duration(minutes: 22), Duration(minutes: 23), Duration(minutes: 24), Duration(minutes: 25),
  Duration(minutes: 26), Duration(minutes: 27), Duration(minutes: 28), Duration(minutes: 29), Duration(minutes: 30),
  Duration(minutes: 31), Duration(minutes: 32), Duration(minutes: 33), Duration(minutes: 34), Duration(minutes: 35),
  Duration(minutes: 36), Duration(minutes: 37), Duration(minutes: 38), Duration(minutes: 39), Duration(minutes: 40),
  Duration(minutes: 41), Duration(minutes: 42), Duration(minutes: 43), Duration(minutes: 44), Duration(minutes: 45),
  Duration(minutes: 46), Duration(minutes: 47), Duration(minutes: 48), Duration(minutes: 49), Duration(minutes: 50),
  Duration(minutes: 51), Duration(minutes: 52), Duration(minutes: 53), Duration(minutes: 54), Duration(minutes: 55),
  Duration(minutes: 56), Duration(minutes: 57), Duration(minutes: 58), Duration(minutes: 59), Duration(minutes: 60),
];

const List<Duration> defaultChantGapSelectorValues = [
  Duration(seconds: 3), 
  Duration(seconds: 5),
  Duration(seconds: 10), 
  Duration(seconds: 15),
  Duration(seconds: 20),
  Duration(seconds: 25),
  Duration(seconds: 30),
  Duration(seconds: 35),
  Duration(seconds: 40),
  Duration(seconds: 45),
  Duration(seconds: 50),
  Duration(seconds: 55),
  Duration(seconds: 60),
];
