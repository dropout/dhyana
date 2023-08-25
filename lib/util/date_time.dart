extension DayId on DateTime {

  String toDayId() {
    return '$year${_twoDigits(month)}${_twoDigits(day)}';
  }

}


String _twoDigits(int n) {
  return n.toString().padLeft(2, "0");
}
