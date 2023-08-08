import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'public_profile.freezed.dart';
part 'public_profile.g.dart';

@freezed
class PublicProfile with _$PublicProfile {

  const factory PublicProfile({
    required String id,
    required String firstName,
    required String lastName,
    required String photoUrl,
  }) = _PublicProfile;

  factory PublicProfile.fromJson(Map<String, Object?> json) =>
      _$PublicProfileFromJson(json);

  factory PublicProfile.fromFirstore(DocumentSnapshot snapshot) =>
      PublicProfile.fromJson(snapshot.data() as Map<String, dynamic>);

}