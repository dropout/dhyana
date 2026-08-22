import 'dart:io';

import 'package:crypto/crypto.dart' as crypto;

/// Helper extension for validation cached files.
extension FileValidationExtension on File {

  Future<String> sha256() async {
    final bytes = await readAsBytes();
    return crypto.sha256.convert(bytes).toString();
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
