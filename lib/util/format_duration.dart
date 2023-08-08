// ignore: non_constant_identifier_names
String formatDuration_HH_mm_ss(Duration duration) {
  String twoDigitMinutes = _twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = _twoDigits(duration.inSeconds.remainder(60));
  return "${_twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

// ignore: non_constant_identifier_names
String formatDuration_HH_mm(Duration duration) {
  String twoDigitMinutes = _twoDigits(duration.inMinutes.remainder(60));
  return "${_twoDigits(duration.inHours)}:$twoDigitMinutes";
}

// ignore: non_constant_identifier_names
String formatDuration_mm_ss(Duration duration) {
  String twoDigitMinutes = _twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = _twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}

String _twoDigits(int n) {
  return n.toString().padLeft(2, "0");
}
