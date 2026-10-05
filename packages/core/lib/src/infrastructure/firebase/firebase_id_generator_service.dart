import 'package:firebase_provider/firebase_provider.dart';

import 'package:core/src/service/id_generator_service.dart';


class FirebaseIdGeneratorService implements IdGeneratorService {

  final FirebaseFirestore fireStore;

  const FirebaseIdGeneratorService(this.fireStore);

  @override
  String sessionId() {
    // Collection name is arbitrary, we just need 
    // a document to generate a unique ID
    return fireStore.collection('id_generators')
      .doc().id;
  }

}
