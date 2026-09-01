import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:session/src/data/datasource/firebase_session_data_provider.dart';
import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/domain/repository/session_repository.dart';

/// A default implementation of the [SessionRepository] that uses 
/// Firebase Firestore as the data source.
/// This repository provides methods to create, read, update, delete, and 
/// query session data for a specific profile.
class FirebaseSessionRepository implements SessionRepository {

  final FirebaseFirestore firestore;

  const FirebaseSessionRepository({
    required this.firestore,
  });
  
  @override
  Future<void> create(String profileId, SessionEntity session) async =>
    FirebaseSessionDataProvider(
      firestore,
      profileId,
    )..create(session);
  
  @override
  Future<void> delete(String profileId, String sessionId) async => 
    FirebaseSessionDataProvider(
      firestore,
      profileId,
    )..delete(sessionId);
  
  @override
  Future<SessionEntity> read(String profileId, String id) async => 
    await FirebaseSessionDataProvider(
      firestore,
      profileId,
    ).read(id);
  
  @override
  Stream<SessionEntity> readStream(String profileId, String id) =>
    FirebaseSessionDataProvider(
      firestore,
      profileId,
    ).readStream(id);
    
  @override
  Future<void> update(String profileId, SessionEntity model) async => 
    await FirebaseSessionDataProvider(
      firestore,
      profileId,
    ).update(model);

  @override
  Future<List<SessionEntity>> query(String profileId, {int limit = 20}) async =>
    FirebaseSessionDataProvider(
      firestore,
      profileId,
    ).query(limit: limit);
    
  @override
  Stream<List<SessionEntity>> queryStream(String profileId, {int limit = 20}) =>
    FirebaseSessionDataProvider(
      firestore,
      profileId,
    ).queryStream(limit: limit);
 
}
