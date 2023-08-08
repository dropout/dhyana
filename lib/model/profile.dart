import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile implements Model {

  const Profile._();

  const factory Profile({
    required String id,
    required String displayName,
    required String email,
    required String photoURL,
    required DateTime signupDate,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) =>
    _$ProfileFromJson(json);

  factory Profile.fromFireStore(DocumentSnapshot snapshot) =>
    Profile.fromJson(snapshot.data() as Map<String, dynamic>);

  @override
  Map<String, Object?> toFireStore() => toJson();

}
