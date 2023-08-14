import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'profile.dart';
import 'query_options.dart';

part 'profile_query_options.freezed.dart';

@freezed
class ProfileQueryOptions with _$ProfileQueryOptions implements QueryOptions<Profile> {

  const ProfileQueryOptions._();

  const factory ProfileQueryOptions() = _ProfileQueryOptions;

  @override
  Query<Profile> prepareQuery(CollectionReference<Profile> collectionReference) {
    return collectionReference.limit(20);
  }

}
