import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/core/domain/entity/entity.dart';

extension FirebaseModelExtension on Dto {
  Map<String, dynamic> toFireStore() => toJson();
}

T fromFireStore<T>(DocumentSnapshot snapshot, T Function(Map<String, dynamic>) createCallback) {
  Map<String, dynamic> jsonData = snapshot.data() as Map<String, dynamic>;
  return createCallback(jsonData);
}
