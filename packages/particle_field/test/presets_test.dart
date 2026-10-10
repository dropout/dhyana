import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:particle_field/particle_field.dart';

void main() {
  test('shrinking burst drifts, slows, shrinks and expires in ~1s', () {
    final fx = ShrinkingBurst(random: Random(3))..emit(count: 2);
    expect(fx.system.count, 2);
    final speed0 = hypot(fx.system.buffers.vx[0], fx.system.buffers.vy[0]);
    for (var i = 0; i < 30; i++) {
      fx.system.step(1 / 60);
    }
    final b = fx.system.buffers;
    expect(hypot(b.vx[0], b.vy[0]), lessThan(speed0 * 0.5));
    expect(b.size[0], closeTo(0.5, 0.05));
    for (var i = 0; i < 31; i++) {
      fx.system.step(1 / 60);
    }
    expect(fx.system.count, 0);
  });

  group('Fireworks', () {
    test('rocket rises to the requested apex then bursts into sparks', () {
      final fw = Fireworks(random: Random(5), trails: false, sparkCount: 50);
      fw.launch(0, 300, apexY: 0);
      final s = fw.system;
      var minY = double.infinity;
      var steps = 0;
      while (s.buffers.kind[0] == Fireworks.rocket && steps++ < 600) {
        minY = min(minY, s.buffers.py[0]);
        s.step(1 / 120);
      }
      expect(minY, closeTo(0, 12));
      expect(s.count, 50);
      expect(
        List.generate(50, (i) => s.buffers.kind[i]),
        everyElement(Fireworks.spark),
      );
    });

    test('sparks inherit rocket colour and fade out completely', () {
      final fw = Fireworks(random: Random(2), trails: false);
      fw.launch(0, 200, color: 0xFF123456);
      for (var i = 0; i < 400; i++) {
        fw.system.step(1 / 60);
        if (fw.system.buffers.kind[0] == Fireworks.spark) break;
      }
      expect(fw.system.buffers.color[0] & 0xFFFFFF, 0x123456);
      for (var i = 0; i < 240; i++) {
        fw.system.step(1 / 60);
      }
      expect(fw.system.count, 0);
    });

    test('trail particles are emitted while the rocket flies', () {
      final fw = Fireworks(random: Random(1));
      fw.launch(0, 300);
      for (var i = 0; i < 10; i++) {
        fw.system.step(1 / 60);
      }
      final kinds = List.generate(
        fw.system.count,
        (i) => fw.system.buffers.kind[i],
      );
      expect(kinds, contains(Fireworks.trail));
    });

    test('never exceeds capacity', () {
      final fw = Fireworks(random: Random(1), maxParticles: 100);
      for (var i = 0; i < 5; i++) {
        fw.launch(0, 200);
      }
      for (var i = 0; i < 300; i++) {
        fw.system.step(1 / 60);
        expect(fw.system.count, lessThanOrEqualTo(100));
      }
    });
  });

  test('spherical fireworks burst spreads in z', () {
    final f = Fireworks(random: Random(2), spherical: true, sparkCount: 50);
    f.launch(0, 0, z: 10, apexY: -100);
    bool hasSpark() {
      final b = f.system.buffers;
      for (var i = 0; i < b.count; i++) {
        if (b.kind[i] == Fireworks.spark) return true;
      }
      return false;
    }

    for (var i = 0; i < 300 && !hasSpark(); i++) {
      f.system.step(0.02);
    }
    final b = f.system.buffers;
    var maxVz = 0.0;
    for (var i = 0; i < b.count; i++) {
      if (b.kind[i] == Fireworks.spark) maxVz = max(maxVz, b.vz[i].abs());
    }
    expect(maxVz, greaterThan(10));
  });
}

double hypot(num a, num b) => sqrt(a * a + b * b);
