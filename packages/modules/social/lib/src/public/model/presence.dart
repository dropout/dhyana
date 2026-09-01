import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core/core.dart';
import 'package:social/src/public/model/social_profile.dart';


part 'presence.freezed.dart';

@freezed
sealed class Presence with _$Presence {

  const Presence._();

  const factory Presence({
    required String id,
    required SocialProfile profile,
    @DateTimeConverter() required DateTime startedAt,
    Location? location,
  }) = _Presence;

}
