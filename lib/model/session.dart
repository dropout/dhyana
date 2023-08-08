import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';
import 'timer_settings.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session implements Model {

  const Session._();

  const factory Session({
    required String id,
    required DateTime startTime,
    required DateTime endTime,
    required Duration duration,
    required TimerSettings timerSettings,
  }) = _Session;

  factory Session.fromJson(Map<String, Object?> json) =>
      _$SessionFromJson(json);

  factory Session.fromFireStore(DocumentSnapshot snapshot) =>
      Session.fromJson(snapshot.data() as Map<String, dynamic>);

  @override
  Map<String, Object?> toFireStore() => toJson();

}
