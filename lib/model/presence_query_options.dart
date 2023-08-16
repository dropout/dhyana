import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'presence.dart';
import 'query_options.dart';

part 'presence_query_options.freezed.dart';

@freezed
class PresenceQueryOptions with _$PresenceQueryOptions implements QueryOptions<Presence> {

  const PresenceQueryOptions._();

  const factory PresenceQueryOptions({
    String? ownProfileId,
  }) = _PresenceQueryOptions;

  @override
  Query<Presence> prepareQuery(CollectionReference<Presence> collectionReference) {
    if (ownProfileId != null) {
      return collectionReference
        .where(FieldPath(const ['profile', 'id']), isNotEqualTo: ownProfileId)
        .limit(20);
    } else {
      return collectionReference.limit(20);
    }
  }

}
