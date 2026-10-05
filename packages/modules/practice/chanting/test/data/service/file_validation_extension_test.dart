import 'dart:io';

import 'package:chanting/src/data/service/file_validation_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('sha256 hashes file contents in an isolate', () async {
    final directory = await Directory.systemTemp.createTemp();
    addTearDown(() => directory.delete(recursive: true));
    final file = File('${directory.path}/sample.txt');
    await file.writeAsString('abc');

    expect(
      await file.sha256(),
      'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad',
    );
  });
}
