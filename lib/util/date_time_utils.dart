import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {

  String toYearId() {
    return year.toString();
  }

  String toMonthId() {
    return '$year${_twoDigits(month)}';
  }

  String toWeekId() {
    DateTime monday = mostRecentMonday(this);
    return '${monday.year}${_twoDigits(monday.month)}${_twoDigits(monday.day)}';
  }

  String toDayId() {
    return '$year${_twoDigits(month)}${_twoDigits(day)}';
  }

  bool isSameDay(DateTime? other) {
    if (other == null) {
      return false;
    } else {
      return year == other.year &&
        month == other.month &&
        day == other.day;
    }
  }

  bool isYesterday(DateTime other) {
    DateTime prevDay = subtract(const Duration(hours: 24));
    return prevDay.year == other.year &&
      prevDay.month == other.month &&
      prevDay.day == other.day;
  }

  bool isBeforeYesterday(DateTime other) {
    DateTime prevDay = subtract(const Duration(hours: 24));

    // check same day
    if (prevDay.isSameDay(other)) {
      return false;
    }

    return other.isBefore(prevDay);
  }

  String toFormattedDateTimeString(BuildContext context) {
    return DateFormat.yMMMd(
      Localizations.localeOf(context).toString()
    ).add_Hm().format(this);
  }

  String toFormattedDateString(BuildContext context) {
    return DateFormat.yMMMd(
      Localizations.localeOf(context).toString()
    ).format(this);
  }

  String toFormattedTimeString(BuildContext context) {
    return DateFormat.Hm(
      Localizations.localeOf(context).toString()
    ).format(this);
  }

  // It's monday not sunday
  DateTime firstDayOfWeek() {
    return mostRecentMonday(this);
  }

  DateTime lastDayOfWeek() {
    return mostRecentMonday(this).add(const Duration(days: 6));
  }

}

String createIntervalString(BuildContext context, DateTime from, DateTime to) =>
  '${DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(from)} - ${DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(to)}';

String _twoDigits(int n) {
  return n.toString().padLeft(2, "0");
}

DateTime mostRecentSunday(DateTime date) =>
  DateTime(date.year, date.month, date.day - date.weekday % 7);

DateTime mostRecentMonday(DateTime date) =>
  DateTime(date.year, date.month, date.day - (date.weekday - 1));

DateTime mostRecentWeekday(DateTime date, int weekday) =>
  DateTime(date.year, date.month, date.day - (date.weekday - weekday) % 7);
