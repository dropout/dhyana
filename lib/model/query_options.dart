import 'package:cloud_firestore/cloud_firestore.dart';

abstract class QueryOptions<T> {
  Query<T> prepareQuery(CollectionReference<T> collectionReference);
}