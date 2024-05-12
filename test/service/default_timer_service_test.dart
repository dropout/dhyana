import 'package:dhyana/util/remap_range.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('DefaultTimerServiceTest', () {

    test('throws an exception when range is invalid', () {
      double value = 0.0;
      expect(() {
        value.remap(0, 0, 1, 20);
      }, throwsException);
    });

  });

}
