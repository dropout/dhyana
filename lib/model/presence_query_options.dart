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
  }) = _PresenceQueryOptions;

  @override
  Query<Presence> prepareQuery(CollectionReference<Presence> collectionReference) {
    Query<Presence> query = collectionReference;
    query = query
      .where('startedAt', isGreaterThan: Timestamp.fromDate(DateTime.now().subtract(windowSize)))
      .where('startedAt', isLessThan: Timestamp.fromDate(DateTime.now()));

    return query.limit(20);
  }

}
