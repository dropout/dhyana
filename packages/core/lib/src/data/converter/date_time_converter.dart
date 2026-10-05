import 'package:freezed_annotation/freezed_annotation.dart';

/// Converter to convert DateTime to int (milliseconds since epoch) 
/// and vice versa for JSON serialization.
class DateTimeConverter implements JsonConverter<DateTime, int>  {

  const DateTimeConverter();

  @override
  DateTime fromJson(int millisecondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  @override
  int toJson(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

}
