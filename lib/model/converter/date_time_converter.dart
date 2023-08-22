import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, Timestamp>  {

  const DateTimeConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return DateTime.fromMillisecondsSinceEpoch(json.millisecondsSinceEpoch);
  }

  @override
  Timestamp toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }

}
