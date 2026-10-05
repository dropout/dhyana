// Conditional export for different platforms (IO vs non-IO).
export 'connection_stub.dart' if (dart.library.io) 'connection_io.dart';
