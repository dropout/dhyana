import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class QueryOptions<T> {
  Query<T> toFirebaseQuery(CollectionReference<T> collectionRef);
}
