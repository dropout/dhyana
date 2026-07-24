import 'package:dhyana/core/domain/model/converter/date_time_converter.dart';
import 'package:dhyana/core/domain/model/model.dart';
import 'package:dhyana/core/domain/model/location.dart';
import 'package:dhyana/modules/social/domain/model/public_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

@freezed
sealed class Presence with _$Presence implements Model {
  const Presence._();

  const factory Presence({
    required String id,
    required PublicProfile profile,
    @DateTimeConverter() required DateTime startedAt,
    Location? location,
  }) = _Presence;

  factory Presence.fromJson(Map<String, Object?> json) =>
    _$PresenceFromJson(json);
}
