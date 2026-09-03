import 'package:core/src/domain/entity/serializable_entity.dart';
import 'package:firebase_provider/firebase_provider.dart';

extension FirebaseModelExtension on SerializableEntity {
  Map<String, dynamic> toFireStore() => toJson();
}

T fromFireStore<T>(DocumentSnapshot snapshot, T Function(Map<String, dynamic>) createCallback) {
  Map<String, dynamic> jsonData = snapshot.data() as Map<String, dynamic>;
  return createCallback(jsonData);
}
