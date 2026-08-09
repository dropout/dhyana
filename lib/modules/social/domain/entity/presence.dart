import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/modules/social/domain/entity/public_profile.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

@freezed
sealed class Presence with _$Presence implements Dto {
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
