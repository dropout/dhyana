import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/model/model.dart';
import 'package:dhyana/model/query_options.dart';

import 'data_provider.dart';

abstract class FirebaseDataProvider<T extends Model> implements DataProvider<T> {

  CollectionReference<T> get collectionRef;

  @override
  Future<T> getItemById(String id) async {
    DocumentSnapshot<T> snapshot =
    await collectionRef.doc(id).get();
    return snapshot.data()!;
  }

  @override
  Stream<T> getItemStreamById(String id) {
    return collectionRef.doc(id).snapshots()
      .map((querySnapshot) => querySnapshot.data()!);
  }

  @override
  Future<List<T>> getItems(QueryOptions<T> queryOptions) async {
    QuerySnapshot<T> querySnapshot = await queryOptions
      .prepareQuery(collectionRef)
      .get();
    return querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
  }

  @override
  Stream<List<T>> getItemsStream(QueryOptions<T> queryOptions) {
    return queryOptions.prepareQuery(collectionRef).snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Future<void> setItem(T item) async {
    await collectionRef
      .doc(item.id)
      .set(item);
  }

  @override
  Future<void> updateItem(T item) async {
    await collectionRef
      .doc(item.id)
      .update(item.toFireStore());
  }

  @override
  Future<void> deleteItem(String id) async {
    await collectionRef
      .doc(id)
      .delete();
  }

}
