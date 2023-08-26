import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'session.dart';
import 'query_options.dart';

part 'session_query_options.freezed.dart';

@freezed
class SessionQueryOptions with _$SessionQueryOptions implements QueryOptions<Session> {

  const SessionQueryOptions._();

  const factory SessionQueryOptions() = _SessionQueryOptions;

  @override
  Query<Session> prepareQuery(CollectionReference<Session> collectionReference) {
    Query<Session> query = collectionReference.orderBy(FieldPath(const ['startTime']), descending: true);
    return query.limit(20);
  }

}
