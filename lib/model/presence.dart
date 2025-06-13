import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';
import 'public_profile.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

@freezed
sealed class Presence with _$Presence implements Model {

  const Presence._();

  const factory Presence({
    required String id,
    required PublicProfile profile,
    @DateTimeConverter() required DateTime startedAt,
  }) = _Presence;

  factory Presence.fromJson(Map<String, Object?> json) =>
    _$PresenceFromJson(json);

}
