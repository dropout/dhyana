import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/entity/session_query_options.dart';
import 'package:dhyana/modules/practice/session/data/datasource/firebase_session_data_provider.dart';
import 'package:dhyana/modules/practice/session/domain/repository/session_repository.dart';

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
  Future<void> create(String profileId, Session session) async =>
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
  Future<List<Session>> query(String profileId, SessionQueryOptions queryOptions) async =>
    FirebaseSessionDataProvider(
      firestore,
      profileId,
    ).query(queryOptions);
    
  @override
  Stream<List<Session>> queryStream(String profileId, SessionQueryOptions queryOptions) =>
    FirebaseSessionDataProvider(
      firestore,
      profileId,
    ).queryStream(queryOptions);
  
  @override
  Future<Session> read(String profileId, String id) async => 
    await FirebaseSessionDataProvider(
      firestore,
      profileId,
    ).read(id);
  
  @override
  Stream<Session> readStream(String profileId, String id) =>
    FirebaseSessionDataProvider(
      firestore,
      profileId,
    ).readStream(id);
    
  @override
  Future<void> update(String profileId, Session model) async => 
    await FirebaseSessionDataProvider(
      firestore,
      profileId,
    ).update(model);

  

  




 
}
