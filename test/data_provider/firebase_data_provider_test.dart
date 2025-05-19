import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_model_extension.dart';
import 'package:dhyana/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// This test is a questionable effort.
// For the sake of unit testing, ignore the warnings about a sealed class.
// ignore_for_file: subtype_of_sealed_class

class MockFirebaseFirestore
  extends Mock
  implements FirebaseFirestore {}

class MockDocumentReference<MockModel>
  extends Mock
  implements DocumentReference<MockModel> {}

class MockCollectionReference<MockModel>
  extends Mock
  implements CollectionReference<MockModel> {}

class MockDocumentSnapshot<MockModel>
  extends Mock
  implements DocumentSnapshot<MockModel> {}

class MockQuerySnapshot<MockModel>
  extends Mock
  implements QuerySnapshot<MockModel> {}

class MockQueryDocumentSnapshot<MockModel>
    extends Mock
    implements QueryDocumentSnapshot<MockModel> {}

class MockModel
  extends Mock
  implements Model {}

class MockQuery<MockModel>
  extends Mock
  implements Query<MockModel> {}

void main() {

  group('FirebaseDataProvider', () {

    late StreamController<MockDocumentSnapshot<MockModel>> mockDocumentSnapshotStreamController;
    late StreamController<MockQuerySnapshot<MockModel>> mockQuerySnapshotController;
    late MockCollectionReference<MockModel> mockCollectionRef;
    late MockDocumentReference<MockModel> mockDocumentRef;
    late MockDocumentSnapshot<MockModel> mockDocumentSnapshot;
    // late MockQuerySnapshot<MockModel> mockQuerySnapshot;
    // late MockQueryDocumentSnapshot<MockModel> mockQueryDocumentSnapshot;
    late MockModel mockModel;
    // late MockQuery<MockModel> mockQuery;

    setUp(() {
      mockDocumentSnapshotStreamController = StreamController(sync: true);
      mockQuerySnapshotController = StreamController(sync: true);
      mockCollectionRef = MockCollectionReference();
      mockDocumentRef = MockDocumentReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
      // mockQuerySnapshot = MockQuerySnapshot();
      // mockQueryDocumentSnapshot = MockQueryDocumentSnapshot();
      mockModel = MockModel();
      // mockQuery = MockQuery();
    });

    tearDown(() {
      mockDocumentSnapshotStreamController.close();
      mockQuerySnapshotController.close();
    });

    test('can create data', () {
      when(() => mockModel.id)
        .thenReturn('fake_id');
      when(() => mockCollectionRef.doc('fake_id'))
        .thenReturn(mockDocumentRef);
      when(() => mockDocumentRef.set(mockModel))
        .thenAnswer((_) => Future.value(null));

      FirebaseDataProvider<MockModel> firebaseDataProvider =
          FirebaseDataProvider(mockCollectionRef);
      firebaseDataProvider.create(mockModel);

      verifyInOrder([
        () => mockCollectionRef.doc('fake_id'),
        () => mockDocumentRef.set(mockModel)
      ]);
    });

    test('can read data', () async {
      when(() => mockModel.id)
          .thenReturn('fake_id');
      when(() => mockCollectionRef.doc('fake_id'))
          .thenReturn(mockDocumentRef);
      when(() => mockDocumentRef.get())
          .thenAnswer((_) => Future.value(mockDocumentSnapshot));
      when(() => mockDocumentSnapshot.data())
          .thenReturn(mockModel);
      when(() => mockDocumentSnapshot.exists)
          .thenReturn(true);

      FirebaseDataProvider<MockModel> firebaseDataProvider =
          FirebaseDataProvider(mockCollectionRef);
      MockModel result = await firebaseDataProvider.read('fake_id');
      expect(result.id, 'fake_id');
      verifyInOrder([
        () => mockCollectionRef.doc('fake_id'),
        () => mockDocumentRef.get(),
        () => mockDocumentSnapshot.data(),
      ]);
    });

    test('can read data as a stream', () async {
      when(() => mockModel.id)
          .thenReturn('fake_id');
      when(() => mockCollectionRef.doc('fake_id'))
          .thenReturn(mockDocumentRef);
      when(() => mockDocumentRef.snapshots())
          .thenAnswer((_) => mockDocumentSnapshotStreamController.stream);
      when(() => mockDocumentSnapshot.data())
          .thenReturn(mockModel);

      FirebaseDataProvider<MockModel> firebaseDataProvider =
        FirebaseDataProvider(mockCollectionRef);
      Stream<MockModel> resultStream = firebaseDataProvider.readStream('fake_id');
      mockDocumentSnapshotStreamController.add(mockDocumentSnapshot);

      await expectLater(
          resultStream,
          emits(mockModel)
      );

      verifyInOrder([
          () => mockCollectionRef.doc('fake_id'),
          () => mockDocumentRef.snapshots(),
          () => mockDocumentSnapshot.data(),
      ]);
    });

    test('can update data', () async {
      when(() => mockModel.id)
          .thenReturn('fake_id');
      when(() => mockModel.toFireStore())
          .thenReturn({
            'id': 'fake_id'
          });
      when(() => mockCollectionRef.doc('fake_id'))
          .thenReturn(mockDocumentRef);
      when(() => mockDocumentRef.update({
          'id': 'fake_id'
        })
      ).thenAnswer((_) => Future.value(null));

      FirebaseDataProvider<MockModel> firebaseDataProvider =
          FirebaseDataProvider(mockCollectionRef);
      await firebaseDataProvider.update(mockModel);

      verifyInOrder([
          () => mockCollectionRef.doc('fake_id'),
          () => mockDocumentRef.update({
            'id': 'fake_id'
          }),
      ]);
    });

    test('can delete data', () async {
      when(() => mockModel.id)
          .thenReturn('fake_id');
      when(() => mockCollectionRef.doc('fake_id'))
          .thenReturn(mockDocumentRef);
      when(() => mockDocumentRef.delete())
          .thenAnswer((_) => Future.value(null));

      FirebaseDataProvider<MockModel> firebaseDataProvider =
          FirebaseDataProvider(mockCollectionRef);
      await firebaseDataProvider.delete('fake_id');

      verifyInOrder([
          () => mockCollectionRef.doc('fake_id'),
          () => mockDocumentRef.delete(),
      ]);
    });

    // test('can convert query to list', () async {
    //
    // });
    //
    // test('can convert query to stream', () async {
    //
    // });

    // test('can query data', () async {
    //   when(() => mockModel.id)
    //       .thenReturn('fake_id');
    //   when(() => mockCollectionRef.doc('fake_id'))
    //       .thenReturn(mockDocumentRef);
    //   when(() => mockDocumentRef.delete())
    //       .thenAnswer((_) => Future.value(null));
    //
    //   when(() => mockQuery.get())
    //       .thenAnswer((_) => Future.value(mockQuerySnapshot));
    //   when(() => mockQueryDocumentSnapshot.data()).thenReturn(mockModel);
    //   when(() => mockQuerySnapshot.docs).thenReturn(
    //     [mockQueryDocumentSnapshot]
    //   );
    //
    //   FirebaseDataProvider<MockModel> firebaseDataProvider =
    //     FirebaseDataProvider(mockCollectionRef);
    //   List<MockModel> result =
    //     await firebaseDataProvider.query(mockModelQueryOptions);
    //
    //   expect(result.length, 1);
    //   expect(result[0].id, mockModel.id);
    //
    //   verifyInOrder([
    //     () => mockQuery.get(),
    //     () => mockQueryDocumentSnapshot.data(),
    //   ]);
    // });

    // test('can query stream of data', () async {
    //   when(() => mockModel.id)
    //       .thenReturn('fake_id');
    //   when(() => mockCollectionRef.doc('fake_id'))
    //       .thenReturn(mockDocumentRef);
    //   when(() => mockDocumentRef.delete())
    //       .thenAnswer((_) => Future.value(null));
    //   when(() => mockModelQueryOptions.toFirebaseQuery(mockCollectionRef))
    //       .thenReturn(mockQuery);
    //   when(() => mockQuery.snapshots())
    //       .thenAnswer((_) => mockQuerySnapshotController.stream);
    //   when(() => mockQueryDocumentSnapshot.data()).thenReturn(mockModel);
    //   when(() => mockQuerySnapshot.docs).thenReturn(
    //       [mockQueryDocumentSnapshot]
    //   );
    //
    //   FirebaseDataProvider<MockModel> firebaseDataProvider =
    //     FirebaseDataProvider(mockCollectionRef);
    //   Stream<List<MockModel>> resultStream =
    //      firebaseDataProvider.queryStream(mockModelQueryOptions);
    //   mockQuerySnapshotController.add(mockQuerySnapshot);
    //
    //   await expectLater(
    //     resultStream,
    //     emits([mockModel])
    //   );
    //
    //   verifyInOrder([
    //     () => mockModelQueryOptions.toFirebaseQuery(mockCollectionRef),
    //     () => mockQuery.snapshots(),
    //     () => mockQuerySnapshot.docs,
    //     () => mockQueryDocumentSnapshot.data(),
    //   ]);
    // });


  }); // eof group

} // eof main
