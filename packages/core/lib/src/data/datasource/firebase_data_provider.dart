import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/src/data/datasource/data_provider.dart';
import 'package:core/src/domain/entity/serializable_entity.dart';


import 'firebase_model_extension.dart';

/// A generic Firebase Firestore data provider for CRUD operations.
/// M extends Model to ensure the model has an 'id' field and can be converted
/// to Firestore format.
class FirebaseDataProvider<M extends SerializableEntity> implements DataProvider<M> {

  final CollectionReference<M> collectionRef;

  FirebaseDataProvider(this.collectionRef);

  /// Creates a new document in the Firestore collection.
  /// The document ID is taken from the model's 'id' field.
  @override
  Future<void> create(M item) async {
    await collectionRef
      .doc(item.id)
      .set(item);
  }

  /// Reads a document from the Firestore collection by its ID.
  /// Throws DocumentNotFoundException if the document does not exist.
  @override
  Future<M> read(String id, {bool preferCache = false}) async {
    if (preferCache) {
      try {
        DocumentSnapshot<M> snapshot = await collectionRef.doc(id).get(GetOptions(source: Source.cache));
        if (!snapshot.exists) {
          throw DocumentNotFoundException(
            message: 'Document with id $id not found in cache for collection ${collectionRef.path}',
          );
        }
        return snapshot.data()!;
      } catch (e) {
        // If the document is not found in cache, fall back to server
      }
    }

    DocumentSnapshot<M> snapshot = await collectionRef.doc(id).get();
    if (!snapshot.exists) {
      throw DocumentNotFoundException(
        message: 'Document with id $id not found in collection ${collectionRef.path}',
      );
    }
    return snapshot.data()!;
  }

  /// Checks if a document exists in the Firestore collection by its ID.
  @override
  Future<bool> exists(String id) async {
    DocumentReference<M> docRef = collectionRef.doc(id);
    DocumentSnapshot<M> docSnapshot = await docRef.get();
    return docSnapshot.exists;
  }

  /// Streams a document from the Firestore collection by its ID.
  @override
  Stream<M> readStream(String id) {
    return collectionRef.doc(id).snapshots()
      .map((querySnapshot) => querySnapshot.data()!);
  }

  /// Updates an existing document in the Firestore collection.
  @override
  Future<void> update(M item) async {
    await collectionRef.doc(item.id)
      .update(item.toFireStore());
  }

  /// Deletes a document from the Firestore collection by its ID.
  @override
  Future<void> delete(String id) async {
    await collectionRef.doc(id)
      .delete();
  }

  /// Builds a list of models from a Firestore query.
  Future<List<M>> buildListFromQuery(Query<M> query, {bool preferCache = false}) async {
    if (preferCache) {
      try {
        final QuerySnapshot<M> querySnapshot = await query.get(GetOptions(source: Source.cache));
        return querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
      } catch (e) {
        // If the query fails in cache, fall back to server
      }
    }

    final QuerySnapshot<M> querySnapshot = await query.get(GetOptions(source: Source.server));
    return querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
  }

  /// Builds a stream of lists of models from a Firestore query.
  Stream<List<M>> buildStreamFromQuery(Query<M> query) {
    return query.snapshots().map((querySnapshot) =>
      querySnapshot.docs.map((e) => e.data()).toList()
    );
  }

}
