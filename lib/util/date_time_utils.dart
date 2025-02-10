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
    DateTime monday = subtract(Duration(days: weekday - 1));
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

}

String buildTimerangeText(BuildContext context, DateTime from, DateTime to) =>
    '${DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(from)} - ${DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(to)}';

String _twoDigits(int n) {
  return n.toString().padLeft(2, "0");
}
