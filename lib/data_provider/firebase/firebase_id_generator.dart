
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/data_provider/id_generator.dart';

class FirebaseIdGenerator implements IdGenerator {

  final FirebaseFirestore fireStore;

  const FirebaseIdGenerator(this.fireStore);

  @override
  String sessionId(String profileId) {
    return FirebaseSessionDataProvider.generateId(profileId);
  }

}
