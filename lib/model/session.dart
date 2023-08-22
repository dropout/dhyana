import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'converter/duration_converter.dart';
import 'model.dart';
import 'timer_settings.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session implements Model {

  const Session._();

  const factory Session({
    required String id,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
    required TimerSettings timerSettings,
  }) = _Session;

  factory Session.generateId({
    required String profileId,
    required DateTime startTime,
    required DateTime endTime,
    required Duration duration,
    required TimerSettings timerSettings,
  }) {
    String id = FirebaseFirestore.instance
      .collection('profiles').doc(profileId)
      .collection('sessions').doc().id;
    return Session(
      id: id,
      startTime: startTime,
      endTime: endTime,
      duration: duration,
      timerSettings: timerSettings,
    );
  }

  factory Session.fromJson(Map<String, Object?> json) =>
    _$SessionFromJson(json);

  factory Session.fromFireStore(DocumentSnapshot snapshot) =>
    Session.fromJson(snapshot.data() as Map<String, dynamic>);

  @override
  Map<String, Object?> toFireStore() => toJson();

}
