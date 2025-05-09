class FirebaseDocumentNotFoundException implements Exception {

  final String id;
  final String collectionPath;

  FirebaseDocumentNotFoundException({
    required this.id,
    this.collectionPath = '',
  });

  @override
  String toString() {
    return 'FirebaseDocumentNotFoundException: $id in collection $collectionPath';
  }

}
