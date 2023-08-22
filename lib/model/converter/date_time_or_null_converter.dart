import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeOrNullConverter implements JsonConverter<DateTime?, Timestamp?>  {

  const DateTimeOrNullConverter();

  @override
  DateTime? fromJson(Timestamp? json) {
    if (json == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(
      json.millisecondsSinceEpoch
    );
  }

  @override
  Timestamp? toJson(DateTime? object) {
    if (object == null) {
      return null;
    }
    return Timestamp.fromDate(object);
  }

}
