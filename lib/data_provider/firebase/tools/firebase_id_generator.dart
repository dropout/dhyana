
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/id_generator.dart';

class FirebaseIdGenerator implements IdGenerator {

  final FirebaseFirestore fireStore;

  const FirebaseIdGenerator(this.fireStore);

  @override
  String sessionId() {
    // Collection name is arbitrary, we just need 
    // a document to generate a unique ID
    return fireStore.collection('id_generators')
      .doc().id;
  }

}
