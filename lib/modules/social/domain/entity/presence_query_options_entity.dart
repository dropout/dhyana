import 'package:dhyana/core/domain/entity/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'presence_query_options_entity.freezed.dart';
part 'presence_query_options_entity.g.dart';

@freezed
sealed class PresenceQueryOptionsEntity with _$PresenceQueryOptionsEntity {
  
  const PresenceQueryOptionsEntity._();

  const factory PresenceQueryOptionsEntity({
    @Default(Duration(hours: 3)) Duration windowSize,
    @Default(20) int limit,
    String? ownProfileId,
    String? lastDocumentId,
    Location? location,
    @Default(100) double rangeInKm,
  }) = _PresenceQueryOptionsEntity;

  factory PresenceQueryOptionsEntity.fromJson(Map<String, Object?> json) =>
    _$PresenceQueryOptionsEntityFromJson(json);

}
