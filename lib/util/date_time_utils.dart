extension DateTimeUtils on DateTime {

  String toDayId() {
    return '$year${_twoDigits(month)}${_twoDigits(day)}';
  }

  bool isSameDay(DateTime other) {
    return year == other.year &&
      month == other.month &&
      day == other.day;
  }

  bool isPreviousDay(DateTime other) {
    DateTime prevDay = subtract(const Duration(hours: 24));
    return prevDay.year == other.year &&
      prevDay.month == other.month &&
      prevDay.day == other.day;
  }

  bool isBeforePreviousDay(DateTime other) {
    DateTime prevDay = subtract(const Duration(hours: 24));
    return prevDay.year == other.year &&
      prevDay.month == other.month &&
      prevDay.day > other.day;
  }

}

String _twoDigits(int n) {
  return n.toString().padLeft(2, "0");
}
