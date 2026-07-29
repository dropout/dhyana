class DocumentNotFoundException implements Exception {

  final String message;

  DocumentNotFoundException({
    required this.message,
  });

  @override
  String toString() {
    return 'DocumentNotFoundException: $message';
  }

}
