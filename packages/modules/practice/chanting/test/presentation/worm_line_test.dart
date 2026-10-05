import 'package:chanting/src/presentation/view/player/worm_line.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('wormProgress', () {
    test('starts at 0 and ends at 1', () {
      for (final index in [0, 3, 20]) {
        expect(wormProgress(index: index, anchor: 3, t: 0), 0);
        expect(wormProgress(index: index, anchor: 3, t: 1), 1);
      }
    });

    test('is monotonic over time', () {
      var previous = 0.0;
      for (var t = 0.0; t <= 1.0; t += 0.05) {
        final p = wormProgress(index: 6, anchor: 3, t: t);
        expect(p, greaterThanOrEqualTo(previous));
        previous = p;
      }
    });

    test('lines below the anchor trail, lines above lead', () {
      const t = 0.3;
      final above = wormProgress(index: 1, anchor: 3, t: t);
      final at = wormProgress(index: 3, anchor: 3, t: t);
      final below = wormProgress(index: 6, anchor: 3, t: t);
      expect(above, at);
      expect(below, lessThan(at));
    });

    test('delay is capped', () {
      expect(wormProgress(index: 100, anchor: 0, t: 0.5), greaterThan(0));
    });
  });
}
