import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:dhyana/modules/social/public/model/social_profile.dart';
import 'package:dhyana/core/domain/entity/location.dart';


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
