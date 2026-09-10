import 'package:drift/drift.dart';

/// Fallback used on platforms without a native SQLite implementation (e.g. web).
LazyDatabase openChantCacheConnection() {
  throw UnsupportedError('ChantCacheDatabase is not supported on this platform.');
}
