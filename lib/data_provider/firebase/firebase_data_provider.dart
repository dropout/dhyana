import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/model.dart';

class FirebaseDataProvider<M extends Model> implements DataProvider<M> {

  final CollectionReference<M> collectionRef;

  FirebaseDataProvider(this.collectionRef);

  @override
  Future<void> create(M item) async {
    await collectionRef
      .doc(item.id)
      .set(item);
  }

  @override
  Future<M> read(String id) async {
    DocumentSnapshot<M> snapshot = await collectionRef.doc(id).get();
    if (!snapshot.exists) {
      throw FirebaseDocumentNotFoundException(
        id: id,
        collectionPath: collectionRef.path,
      );
    }
    return snapshot.data()!;
  }

  Future<bool> exists(String id) async {
    DocumentReference<M> docRef = collectionRef.doc(id);
    DocumentSnapshot<M> docSnapshot = await docRef.get();
    return docSnapshot.exists;
  }

  @override
  Stream<M> readStream(String id) {
    return collectionRef.doc(id).snapshots()
      .map((querySnapshot) => querySnapshot.data()!);
  }

  @override
  Future<void> update(M item) async {
    await collectionRef
      .doc(item.id)
      .update(item.toFireStore());
  }

  @override
  Future<void> delete(String id) async {
    await collectionRef
      .doc(id)
      .delete();
  }

  Future<List<M>> buildListFromQuery(Query<M> query) async {
    final QuerySnapshot<M> querySnapshot = await query.get();
    return querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
  }

  Stream<List<M>> buildStreamFromQuery(Query<M> query) {
    return query.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((e) => e.data()).toList();
    });
  }

}
