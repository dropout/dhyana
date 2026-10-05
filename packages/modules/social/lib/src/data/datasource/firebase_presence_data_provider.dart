import 'dart:async';

import 'package:clock/clock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:social/src/data/datasource/presence_data_provider.dart';
import 'package:social/src/domain/entity/presence_entity.dart';
import 'package:social/src/domain/entity/presence_query_options_entity.dart';


class FirebasePresenceDataProvider extends FirebaseDataProvider<PresenceEntity>
    implements PresenceDataProvider {
  FirebasePresenceDataProvider(FirebaseFirestore fireStore)
    : super(
        fireStore
            .collection('presence')
            .withConverter<PresenceEntity>(
              fromFirestore: (snapshot, _) =>
                  fromFireStore(snapshot, PresenceEntity.fromJson),
              toFirestore: (presence, _) => presence.toFireStore(),
            ),
      );

  @override
  Future<List<PresenceEntity>> query(PresenceQueryOptionsEntity queryOptions) async {
    final location = queryOptions.location;
    final timeQuery = _buildTimeBasedQuery(
      queryOptions.windowSize,
      queryOptions.limit,
    );

    if (location == null) {
      final results = await _runQuery(
        query: timeQuery,
        lastDocumentId: queryOptions.lastDocumentId,
      );
      return _sortByTime(results);
    }

    final locationResults = await _runQuery(
      query: _buildLocationAndTimeBasedQuery(
        location: location,
        rangeInKm: queryOptions.rangeInKm,
        windowSize: queryOptions.windowSize,
        limit: queryOptions.limit,
      ),
      lastDocumentId: queryOptions.lastDocumentId,
    );

    if (locationResults.isNotEmpty) {
      return _sortByDistance(locationResults, location);
    }

    final fallbackResults = await _runQuery(
      query: timeQuery,
      lastDocumentId: queryOptions.lastDocumentId,
    );
    return _sortByTime(fallbackResults);
  }

  @override
  Stream<List<PresenceEntity>> queryStream(PresenceQueryOptionsEntity queryOptions) =>
      throw UnimplementedError('Not implemented to avoid complexity and cost!');

  Query<PresenceEntity> _buildTimeBasedQuery(Duration windowSize, int limit) {
    final timeThreshold = clock
        .now()
        .subtract(windowSize)
        .millisecondsSinceEpoch;
    return collectionRef
        .where('startedAt', isGreaterThanOrEqualTo: timeThreshold)
        .limit(limit);
  }

  Query<PresenceEntity> _buildLocationAndTimeBasedQuery({
    required Location location,
    required double rangeInKm,
    required Duration windowSize,
    required int limit,
  }) {
    final (minLatLng, maxLatLng) = calculateBoundingBox(
      location.latLng,
      rangeInKm,
    );

    final q = collectionRef
        .where(
          'geoHash',
          isGreaterThanOrEqualTo: location.geoHash.substring(0, 1),
        )
        .where(
          'location.latLng.latitude',
          isGreaterThanOrEqualTo: minLatLng.latitude,
        )
        .where(
          'location.latLng.latitude',
          isLessThanOrEqualTo: maxLatLng.latitude,
        )
        .where(
          'location.latLng.longitude',
          isGreaterThanOrEqualTo: minLatLng.longitude,
        )
        .where(
          'location.latLng.longitude',
          isLessThanOrEqualTo: maxLatLng.longitude,
        )
        .where(
          'startedAt',
          isGreaterThanOrEqualTo: clock
              .now()
              .subtract(windowSize)
              .millisecondsSinceEpoch,
        )
        .limit(limit);

    return q;
  }

  Future<List<PresenceEntity>> _runQuery({
    required Query<PresenceEntity> query,
    required String? lastDocumentId,
  }) async {
    var pagedQuery = query;
    if (lastDocumentId != null) {
      pagedQuery = pagedQuery.startAfter([lastDocumentId]);
    }

    final results = await pagedQuery.get();
    return results.docs.map((snapshot) => snapshot.data()).toList();
  }

  List<PresenceEntity> _sortByDistance(
    List<PresenceEntity> presenceList,
    Location location,
  ) {
    final withLocation = presenceList
        .where((presence) => presence.location != null)
        .toList();

    final withoutLocation = presenceList
        .where((presence) => presence.location == null)
        .toList();

    withLocation.sort((a, b) {
      final distanceA = location.distanceTo(a.location!);
      final distanceB = location.distanceTo(b.location!);
      return distanceA.compareTo(distanceB);
    });

    return [...withLocation, ...withoutLocation];
  }

  List<PresenceEntity> _sortByTime(List<PresenceEntity> presenceList) {
    presenceList.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    return presenceList;
  }
}
