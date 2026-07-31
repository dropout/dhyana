import 'package:dhyana/core/domain/enum/session_type.dart';

abstract interface class AppSession {
  String get id;
  SessionType get type;
  DateTime get startTime;
  DateTime get endTime;
  Duration get duration;
}
