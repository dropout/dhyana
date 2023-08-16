import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class QueryOptions<T> {
  Query<T> prepareQuery(CollectionReference<T> collectionReference);
}
