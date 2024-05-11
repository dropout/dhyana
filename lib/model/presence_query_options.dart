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
    @Default(Duration(hours: 3)) Duration windowSize,
    @Default(20) int limit,
  }) = _PresenceQueryOptions;

  @override
  Query<Presence> toFirebaseQuery(CollectionReference<Presence> collectionRef) {
    Query<Presence> query = collectionRef;
    query = query
      .where('startedAt', isGreaterThan: Timestamp.fromDate(DateTime.now().subtract(windowSize)))
      .where('startedAt', isLessThan: Timestamp.fromDate(DateTime.now()));
    return query.limit(limit);
  }

}
