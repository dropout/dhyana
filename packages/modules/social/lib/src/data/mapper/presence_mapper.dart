import 'package:social/src/data/mapper/social_profile_mapper.dart';
import 'package:social/src/domain/entity/presence_entity.dart';
import 'package:social/src/public/model/presence.dart';

extension PresenceMapper on PresenceEntity {
  Presence toApi() {
    return Presence(
      id: id,
      profile: profile.toApi(),
      startedAt: startedAt,
      location: location,
    );
  }
}

extension PresenceEntityMapper on Presence {
  PresenceEntity toEntity() {
    return PresenceEntity(
      id: id,
      profile: profile.toEntity(),
      startedAt: startedAt,
      location: location,
    );
  }
}