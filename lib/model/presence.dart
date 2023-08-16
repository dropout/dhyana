import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';
import 'public_profile.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

@freezed
class Presence with _$Presence implements Model {

  const Presence._();

  const factory Presence({
    required String id,
    required PublicProfile profile,
    required DateTime startedAt,
    DateTime? finishedAt,
  }) = _Presence;

  factory Presence.generateId({
    required PublicProfile profile,
    required DateTime startedAt,
    DateTime? finishedAt,
  }) {
    return Presence(
      id: FirebaseFirestore.instance.collection('presence').doc().id,
      profile: profile,
      startedAt: startedAt,
      finishedAt: finishedAt,
    );
  }

  factory Presence.fromJson(Map<String, Object?> json) =>
      _$PresenceFromJson(json);

  factory Presence.fromFireStore(DocumentSnapshot snapshot) =>
      Presence.fromJson(snapshot.data() as Map<String, dynamic>);

  @override
  Map<String, Object?> toFireStore() => toJson();

}
