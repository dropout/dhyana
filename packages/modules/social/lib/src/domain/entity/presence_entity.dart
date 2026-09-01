import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:core/core.dart';
import 'package:social/src/domain/entity/social_profile_entity.dart';

part 'presence_entity.freezed.dart';
part 'presence_entity.g.dart';

@freezed
sealed class PresenceEntity with _$PresenceEntity implements Dto {
  const PresenceEntity._();

  const factory PresenceEntity({
    required String id,
    required SocialProfileEntity profile,
    @DateTimeConverter() required DateTime startedAt,
    Location? location,
  }) = _PresenceEntity;

  factory PresenceEntity.fromJson(Map<String, Object?> json) =>
    _$PresenceEntityFromJson(json);

}
