import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/model/model.dart';

extension FirebaseModelExtension on Model {
  Map<String, dynamic> toFireStore() => toJson();
}

T fromFireStore<T>(DocumentSnapshot snapshot, T Function(Map<String, dynamic>) createCallback) {
  Map<String, dynamic> jsonData = snapshot.data() as Map<String, dynamic>;
  return createCallback(jsonData);
}
