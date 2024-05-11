import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/util/remap_range.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseFirestore
  extends Mock
  implements FirebaseFirestore {}

void main() {

  group('FirebaseProfileDataProviderTest', () {

    MockFirebaseFirestore mockFirebaseFirestore = MockFirebaseFirestore();

    test('can be created with its default values', () {
      // FirebaseProfileDataProvider firebaseProfileDataProvider =
      //     FirebaseProfileDataProvider(mockFirebaseFirestore)
      // double value = 0.0;
      // expect(() {
      //   value.remap(0, 0, 1, 20);
      // }, throwsException);
    });

  });

}
