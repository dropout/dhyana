extension DateTimeUtils on DateTime {

  String toYearId() {
    return year.toString();
  }

  String toMonthId() {
    return '$year${_twoDigits(month)}';
  }

  String toDayId() {
    return '$year${_twoDigits(month)}${_twoDigits(day)}';
  }

  bool isSameDay(DateTime other) {
    return year == other.year &&
      month == other.month &&
      day == other.day;
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

String _twoDigits(int n) {
  return n.toString().padLeft(2, "0");
}
