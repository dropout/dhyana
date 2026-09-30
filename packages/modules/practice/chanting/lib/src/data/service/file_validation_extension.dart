import 'dart:io';
import 'dart:isolate';

import 'package:crypto/crypto.dart' as crypto;

/// Helper extension for validation cached files.
extension FileValidationExtension on File {
  Future<String> sha256() async {
    return Isolate.run(() => _sha256File(path));
  }

  Future<int> size() async {
    if (!await exists()) {
      return 0;
    }
    return length();
  }

  Future<void> deleteIfExists() async {
    if (await exists()) {
      await delete();
    }
  }
}

Future<String> _sha256File(String path) async {
  final digest = await crypto.sha256.bind(File(path).openRead()).first;
  return digest.toString();
}
