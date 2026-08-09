import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeOrNullConverter implements JsonConverter<DateTime?, int?>  {

  const DateTimeOrNullConverter();

  @override
  DateTime? fromJson(int? millisecondsSinceEpoch) {
    if (millisecondsSinceEpoch == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(
      millisecondsSinceEpoch, isUtc: true
    );
  }

  @override
  int? toJson(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return dateTime.millisecondsSinceEpoch;
  }

}
