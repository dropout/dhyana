import 'package:freezed_annotation/freezed_annotation.dart';

class DurationConverter implements JsonConverter<Duration, int>  {

  const DurationConverter();

  @override
  Duration fromJson(int json) {
    // return Duration(seconds: json);
    return const Duration(seconds: 10);
  }

  @override
  int toJson(Duration object) {
    return object.inSeconds.abs();
  }

}
